<?php
namespace app\models;

use core\Database;
use core\Model;
use app\models\Movie;
use PDO;

class Genre extends Model
{
    const TABLENAME = 'genres';

    public function __construct()
    {
        parent::__construct();
    }

    /** static methods */

    static public function indexByMovie(Movie $movie)
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
        $statement->bindValue(':movie_id',$movie->getPrimaryValue(),$movie->primary_type);
        $ok = $statement->execute();

        $objects = [];

        if($ok)
        {
            $records = $statement->fetchAll(PDO::FETCH_ASSOC);
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