<?php
namespace app\models;

use core\Database;
use core\Model;
use PDO;

class Genre extends Model
{
    const TABLENAME = 'genres';

    public function __construct()
    {
        parent::__construct();
    }

    public function setId($value)
    {
        $this->setDataField('id', $value);
    }

    /** static methods */

    static public function indexByMovie($id_movie)
    {
        $pdo = Database::getInstance()->getPdo();
        $query =
            '
            SELECT name
            FROM genres
            JOIN movie_genre ON tmdb_genre_id = id_genre
            WHERE id_movie = :movie_id
        ';
        $statement = $pdo->prepare($query);
        $statement->bindValue(':movie_id',$id_movie,PDO::PARAM_INT);
        $ok = $statement->execute();

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
}