<?php
namespace app\models;

use core\Database;
use core\Model;
use PDO;

class People extends Model
{
    const TABLENAME = 'people';

    public function __construct()
    {
        /**
         * Roep de parent-constructor aan met één optionele parameter:
         * primary-key-definitie als een array met twee elementen [naam, pdo-paramtype]
         *   default is ['id', PDO::PARAM_INT]
         */
        parent::__construct();
    }

    /**
     * API FUNCTIONS
     */

    static public function indexActorsByMovie($id_movie)
    {
        $pdo = Database::getInstance()->getPdo();
        $query =
            '
            SELECT people.*, genders.name as gender, mp.role as role, mp.character_name
            FROM people
            JOIN movie_person AS mp ON people.tmdb_person_id = mp.id_person
            JOIN genders ON genders.id = people.gender_id
            WHERE mp.id_movie = :id_movie && mp.role = "actor"
        ';
        $statement = $pdo->prepare($query);
        $statement->bindValue('id_movie',$id_movie,PDO::PARAM_INT);
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
}