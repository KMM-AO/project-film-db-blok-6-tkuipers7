<?php
namespace app\models;

use core\Database;
use core\Model;
use PDO;

class movie extends model
{
    /** de bijbehorende database-tabel */
    const TABLENAME = 'movies';

    /** relatie-properties */
    private $genres;
    private $actors;

    public function __construct()
    {
        /**
         * Roep de parent-constructor aan met ��n optionele parameter:
         * primary-key-definitie als een array met twee elementen [naam, pdo-paramtype]
         *   default is ['id', PDO::PARAM_INT]
         */
        parent::__construct(['tmdb_id',PDO::PARAM_INT]);
    }

    public function setId($movie_id)
    {
        $this->setDataField($this->primary_name, $movie_id);
    }

    /**
     * relaties
     */

    static public function indexByPerson(People $person)
    {
        $pdo = Database::getInstance()->getPdo();

        $query =
            '
                SELECT tmdb_id, original_title, poster_path
                FROM ' . self::TABLENAME . '
                JOIN movie_person ON movie_person.id_movie = movies.tmdb_id
                JOIN people ON people.tmdb_person_id = movie_person.id_person
                WHERE ' . $person::TABLENAME .'.'. $person->primary_name .  ' = :person_pk
        ';

        $statement = $pdo->prepare($query);
        $statement->bindValue(':person_pk',$person->getPrimaryValue(),$person->primary_type);
        $statement->execute();

        $records = $statement->fetchAll(PDO::FETCH_ASSOC);
        $objects = [];

        foreach ($records as $record)
        {
            $object = new self();
            $object->setData($record);
            $objects[] = $object;
        }

        return $objects;
    }

    public function getGenres()
    {
        if (!isset($this->genres))
        {
            $this->genres = Genre::indexByMovie($this->tmdb_id);
        }
        return $this->genres;
    }

    public function getActors()
    {
        if (!isset($this->actors))
        {
            $this->actors = People::indexActorsByMovie($this->tmdb_id);
        }
        return $this->actors;
    }

//    public function index()
//    {
//        $query =
//            '
//                SELECT *
//                FROM movies
//            ';
//        $statement = $this->pdo->prepare($query);
//        $ok = $statement->execute();
//        $movies = $statement->fetchAll(PDO::FETCH_ASSOC);
//        if ($ok)
//        {
//           foreach ($movies as &$movie)
//           {
//               $id_movie = $movie['tmdb_id'];
//                $genres = new genres.class();
//                $genres->setMovieId($id_movie);
//                $movie['genres'] = $genres->getGenres();
//                $actors = new people();
//                $actors->setMovieId($id_movie);
//                $movie['actors'] = $actors->getActors();
//           }
//           $this->setData($movies);
//        }
//        return $this->getData();
//    }
}