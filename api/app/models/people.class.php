<?php
namespace app\models;

use core\Database;
use core\Model;
use PDO;

class People extends Model
{
    const TABLENAME = 'people';

    private $associated_movies;
    private $gender;

    public function __construct()
    {
        /**
         * Roep de parent-constructor aan met één optionele parameter:
         * primary-key-definitie als een array met twee elementen [naam, pdo-paramtype]
         *   default is ['id', PDO::PARAM_INT]
         */
        parent::__construct(['tmdb_person_id',PDO::PARAM_INT]);
    }

    /**
     * API FUNCTIONS
     */

//    JOIN movie_person AS mp ON people.tmdb_person_id = mp.id_person
//    JOIN genders ON genders.id = people.gender_id
//    WHERE mp.id_movie = :id_movie && mp.role = "actor"

    public function getgender()
    {
        if (!isset($this->gender))
        {
            $query =
                '
            SELECT genders.name
            FROM people
            JOIN genders ON genders.id = gender_id
            WHERE tmdb_person_id = :pk
        ';

            $statement = $this->pdo->prepare($query);
            $pk_name = $this->primary_name;
            $statement->bindValue(':pk',$this->$pk_name,$this->primary_type);
            $ok = $statement->execute();
            if ($ok)
            {
                $this->gender =  $statement->fetch(PDO::FETCH_ASSOC)['name'];
            }
            else
            {
             $this->gender = NULL;
            }
        }
        return $this->gender;
    }

    public function getassociatedMovies()
    {
        if (!isset($this->associated_movies))
        {
            $this->associated_movies = Movie::indexByPerson($this);
        }
        return $this->associated_movies;
    }

    static public function indexActors()
    {
        $pdo = Database::getInstance()->getPdo();
        $query =
            '
            SELECT people.tmdb_person_id as id, people.name, mp.role
            FROM people
            JOIN movie_person AS mp ON people.tmdb_person_id = mp.id_person
            WHERE mp.role = "actor"
        ';
        $statement = $pdo->prepare($query);
        $ok = $statement->execute();
        $records =  $statement->fetchAll(PDO::FETCH_ASSOC);
        $objects = [];
        foreach ($records as $record)
        {
            $object = new self();
            $object->setData($record);
            $objects[] = $object;
        }
        return $objects;
    }

    static public function indexActorsByMovie(Movie $movie)
    {
        $pdo = Database::getInstance()->getPdo();
        $query =
            '
            SELECT people.name, mp.character_name
            FROM people
            JOIN movie_person AS mp ON people.tmdb_person_id = mp.id_person
            WHERE mp.id_movie = :id_movie && mp.role = "actor"
        ';
        $statement = $pdo->prepare($query);
        $statement->bindValue('id_movie',$movie->getPrimaryValue(),$movie->primary_type);
        $ok = $statement->execute();

        $objects = [];
        if ($ok)
        {
            $records =  $statement->fetchAll(PDO::FETCH_ASSOC);
            foreach ($records as $record)
            {
                $object = new self();
                $object->setData($record);
                $objects[] = $object;
            }
        }

        return $objects;
    }
}