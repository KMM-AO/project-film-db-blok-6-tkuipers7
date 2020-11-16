<?php


class movie extends model
{
    /**
     * API vars
     */

    protected $data = [];

    /**
     * seeder vars
     */
    private $id; /** tmdb movie id */

    /** getter and setters */

    private function setData($data)
    {
        $this->data = $data;
    }

    protected function getData()
    {
        return $this->data;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    /**
     * API FUNCTIONS
     */



    public function index()
    {
        $query =
            '
                SELECT *
                FROM movies
            ';
        $statement = $this->pdo->prepare($query);
        $ok = $statement->execute();
        $movies = $statement->fetchAll(PDO::FETCH_ASSOC);
        if ($ok)
        {
           foreach ($movies as &$movie)
           {
               $id_movie = $movie['tmdb_id'];
                $genres = new genre();
                $genres->setMovieId($id_movie);
                $movie['genres'] = $genres->getGenres();
                $actors = new people();
                $actors->setMovieId($id_movie);
                $movie['actors'] = $actors->getActors();
           }
           $this->setData($movies);
        }
        return $this->getData();
    }

    /** seeder functions */

    /**
     * @param $movie
     */

    // insert de movie in movies en alle koppeltabbelen
    public function insertMovie($movie)
    {
        // set de movie id
        $this->setId($movie['id']);

        $query = "INSERT INTO movies (tmdb_id, title, original_title, description, adult, runtime, release_date, poster_path, original_language)
                    VALUES (:tmdb_id, :title, :original_title, :description, :adult, :runtime, :release_date, :poster_path, :original_language)";

        $stmt = $this->pdo->prepare($query);

        $stmt->bindValue(':tmdb_id',$this->getId(), PDO::PARAM_INT);
        $stmt->bindValue(':title',$movie['title'], PDO::PARAM_STR);
        $stmt->bindValue(':original_title',$movie['original_title'], PDO::PARAM_STR);
        $stmt->bindValue(':description',$movie['overview'], PDO::PARAM_STR);
        $stmt->bindValue(':adult',$movie['adult'], PDO::PARAM_BOOL);
        $stmt->bindValue(':runtime',$movie['runtime'], PDO::PARAM_INT);
        $stmt->bindValue(':release_date',$movie['release_date'], PDO::PARAM_STR);
        $stmt->bindValue(':poster_path',$movie['poster_path'], PDO::PARAM_STR);
        $stmt->bindValue(':original_language',$movie['original_language'], PDO::PARAM_STR);

        $stmt->execute();

        // genres toevoegen
        $this->attachGenres($movie['genres']);

        // get credits
        $credits = $this->getCredits();

        // personen toevoegen
        $this->attachPeople($credits['cast']);
    }

    // voegd alle genre toe aan de film
    private function attachGenres($genres)
    {
        foreach ($genres as $genre)
        {
            $this->attachGenre($genre);
        }
    }

    // voegd 1 genre toe aan de film
    private function attachGenre($genre)
    {
        $query = "INSERT INTO movie_genre (id_movie, id_genre)
                    VALUES (:id_movie, :id_genre)";
        $stmt = $this->pdo->prepare($query);

        $stmt->bindValue(':id_movie',$this->getId(), PDO::PARAM_INT);
        $stmt->bindValue(':id_genre',$genre['id'], PDO::PARAM_INT);

        $stmt->execute();
    }

    // haalt de credits van een film op
    private function getCredits()
    {
        return json_decode(@file_get_contents("https://api.themoviedb.org/3/movie/" . $this->getId() . "/credits?api_key=" . $this->getApiKey()),true);
    }

    // voegd 1 persoon aan de movie toe
    private function attachPerson($movie_person,$role)
    {
        $person = new people();
        $person->setPersonId($movie_person['id']);
        if(!$person->checkPersonExsist())
        {
            // persoon bestaat niet
            $person->insertPerson();
        }
        $query = "INSERT INTO movie_person (id_movie, id_person, role, character_name)
                    VALUES (:id_movie, :id_person, :role, :character_name)";

        if (isset($movie_person['character']) && $movie_person['character'] === 'The Narrator')
        {
            $role = 'The Narrator';
        }

        $stmt = $this->pdo->prepare($query);

        $stmt->bindValue(':id_movie',$this->getId(),PDO::PARAM_INT);
        $stmt->bindValue(':id_person',$person->getId(),PDO::PARAM_INT);
        $stmt->bindValue(':role',$role,PDO::PARAM_STR);
        if (isset($movie_person['character']))
        {
            $stmt->bindValue(':character_name',$movie_person['character'],PDO::PARAM_STR);
        }
        else {
            $stmt->bindValue(':character_name',NULL,PDO::PARAM_STR);
        }
        $stmt->execute();
    }

    // voegd alle personen van een film to aan een film
    private function attachPeople($people)
    {
        foreach ($people as $person)
        {
            $this->attachPerson($person,'actor');
        }
    }

}