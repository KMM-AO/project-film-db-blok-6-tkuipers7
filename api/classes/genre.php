<?php


class genre extends model
{
    private $data = [];
    private $movie_id;

    private function setdata($data)
    {
        $this->data = $data;
    }

    public function getDataField($field_name)
    {
        return isset($this->data[$field_name]) ? $this->data[$field_name] : false;
    }

    public function setDataField($field_name, $data)
    {
        return $this->data[$field_name] = $data;
    }

    public function setMovieId($id)
    {
        $this->movie_id = $id;
    }

    public function getMovieId()
    {
        return $this->movie_id;
    }

    public function getGenres()
    {
        $genres = $this->getDataField('genres');
        if(isset($genres))
        {
            $id_movie = $this->getMovieId();
            $query =
                '
                SELECT name
                FROM genres
                JOIN movie_genre ON tmdb_genre_id = id_genre
                WHERE id_movie = :movie_id
            ';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(':movie_id',$id_movie,PDO::PARAM_INT);
            $ok = $statement->execute();
            if($ok)
            {
                $this->setDataField('genres',$statement->fetchAll(PDO::FETCH_ASSOC));
            }
        }
        return $this->getDataField('genres');
    }

    // insert genres van api
    public function insertGenres()
    {
        $genres = json_decode(@file_get_contents("https://api.themoviedb.org/3/genre/movie/list?api_key=" . $this->getApikey()),true)['genres'];
        if (isset($genres))
        {
            foreach ($genres as $genre)
            {
                $query = "INSERT INTO genres (tmdb_genre_id, name) VALUES (:tmdb_genre_id, :name) ";
                $stmt = $this->pdo->prepare($query);
                $stmt->bindValue(':tmdb_genre_id',$genre['id'],PDO::PARAM_INT);
                $stmt->bindValue(':name',$genre['name'],PDO::PARAM_STR);
                $stmt->execute();
            }
        }
    }
}