<?php


class people extends model
{
    private $person_id; /** id van tmdb */
    private $movie_id;
    private $data;

    /** getter and setters */
    public function setPersonId($id)
    {
        $this->person_id = $id;
    }

    public function getPersonId()
    {
        return $this->person_id;
    }

    public function setMovieId($id)
    {
        $this->movie_id = $id;
    }

    public function getMovieId()
    {
        return $this->movie_id;
    }

    private function setData($data)
    {
        $this->data = $data;
    }

    public function getData()
    {
        return $this->data;
    }

    public function getDataField($field_name)
    {
        return isset($this->data[$field_name]) ? $this->data[$field_name] : false;
    }

    private function setDataField($field_name,$data)
    {
        $this->data[$field_name] = $data;
    }
    /**
     * API FUNCTIONS
     */

    public function getActors()
    {
        $actors = $this->getDataField('actors');
        if (isset($actors))
        {
            $id_movie = $this->getMovieId();
            $query =
                '
                SELECT people.*, genders.name as gender, mp.role as role, mp.character_name
                FROM people
                JOIN movie_person AS mp ON people.tmdb_person_id = mp.id_person
                JOIN genders ON genders.id = people.gender_id
                WHERE mp.id_movie = :id_movie && mp.role = "actor"
            ';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue('id_movie',$id_movie,PDO::PARAM_INT);
            $ok = $statement->execute();
            if ($ok)
            {
                $this->setDatafield('actors',$statement->fetchAll(PDO::FETCH_ASSOC));
            }
        }
        return $this->getDataField('actors');
    }

    /** seeder functions */

    public function checkPersonExsist()
    {
        $query = "SELECT id FROM people WHERE tmdb_person_id = :id";
        $stmt = $this->pdo->prepare($query);

        $stmt->bindValue(':id', $this->getId(), PDO::PARAM_INT);

        $ok = $stmt->execute();

        if ($ok){
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result === false ? false : true;
        }
        return false;
    }

    // insert een persoon als de persoon nog niet in de database staat
    public function insertPerson()
    {
        $person_details = json_decode(@file_get_contents("https://api.themoviedb.org/3/people/" . $this->getId() . "?api_key=" . $this->getApiKey()),true);
        if(isset($person_details))
        {
            $query = "INSERT INTO people (tmdb_person_id, name, biography,gender_id, date_of_birth, date_of_death, place_of_birth, profile_path)
                        VALUES (:tmdb_person_id, :name, :biography, :gender_id, :date_of_birth, :date_of_death, :place_of_birth, :profile_path)";
            $stmt = $this->pdo->prepare($query);

            $stmt->bindValue(':tmdb_person_id',$this->getPersonId(),PDO::PARAM_INT);
            $stmt->bindValue(':name',$person_details['name'],PDO::PARAM_STR);
            $stmt->bindValue(':biography',$person_details['biography'],PDO::PARAM_STR);
            $stmt->bindValue(':gender_id',$person_details['gender'],PDO::PARAM_INT);
            $stmt->bindValue(':date_of_birth',$person_details['birthday'],PDO::PARAM_STR);
            $stmt->bindValue(':date_of_death',$person_details['deathday'],PDO::PARAM_STR);
            $stmt->bindValue(':place_of_birth',$person_details['place_of_birth'],PDO::PARAM_STR);
            $stmt->bindValue(':profile_path',$person_details['profile_path'],PDO::PARAM_STR);

            $stmt->execute();
        }
    }

}