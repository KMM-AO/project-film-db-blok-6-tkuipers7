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
        parent::__construct(['tmdb_id', PDO::PARAM_INT]);
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
                FROM movies
                JOIN movie_person ON movie_person.id_movie = movies.tmdb_id
                JOIN people ON people.tmdb_person_id = movie_person.id_person
                WHERE people.tmdb_person_id = :person_pk
        ';

        $statement = $pdo->prepare($query);
        $statement->bindValue(':person_pk', $person->getPrimaryValue(), $person->primary_type);
        $statement->execute();

        $records = $statement->fetchAll(PDO::FETCH_ASSOC);
        $objects = [];

        foreach ($records as $record) {
            $object = new self();
            $object->setData($record);
            $objects[] = $object;
        }

        return $objects;
    }

    public function getGenres()
    {
        if (!isset($this->genres)) {
            $this->genres = Genre::indexByMovie($this);
        }
        return $this->genres;
    }

    public function getActors()
    {
        if (!isset($this->actors)) {
            $this->actors = People::indexActorsByMovie($this);
        }
        return $this->actors;
    }
}