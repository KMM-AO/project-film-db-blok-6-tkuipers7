<?php
namespace app\models;

use core\Database;
use core\Model;
use PDO;

class movie extends model
{
    /** de bijbehorende database-tabel */
    const TABLENAME = 'movies';
    const PRIMARY_NAME = 'tmdb_id';
    const PRIMARY_TYPE = PDO::PARAM_INT;

    const ALLOWEDSEARCH = [
      'actor',
      'director',
      'movies'
    ];

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
        parent::__construct([self::PRIMARY_NAME, self::PRIMARY_TYPE]);
    }

    static public function searchIsAllowed($search) {
        return in_array($search,self::ALLOWEDSEARCH);
    }

    static public function indexByPerson(People $person)
    {
        $pdo = Database::getInstance()->getPdo();

        $query =
            '
                SELECT tmdb_id, original_title, poster_path
                FROM movies
                JOIN movie_person ON id_movie = tmdb_id
                WHERE id_person = :person_pk
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

    static public function indexSearch($type,$search, $limit )
    {
        $pdo = Database::getInstance()->getPdo();

        $query =
            '
                SELECT DISTINCT tmdb_id as id, title,original_title, poster_path
                FROM movies
        ';

        if ($type === 'movies')
        {
            $query .= ' WHERE original_title || title LIKE "%'.$search.'%"';
        }
        elseif ($type === 'actor' || $type === 'director')
        {
            $query .= ' JOIN movie_person ON id_movie = ' . self::TABLENAME . '.' . self::PRIMARY_NAME . '
            JOIN ' . People::TABLENAME . ' ON ' . People::TABLENAME . '.' . People::PRIMARY_NAME . ' = id_person 
            WHERE role = "' . $type . '" && ' . People::TABLENAME . '.name LIKE "%' . $search . '%"';
        }

        $query .= ' LIMIT '. $limit ;
        $statement = $pdo->prepare($query);
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