<?php
namespace app\models;

use core\Model;

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
        parent::__construct();
    }

    /** getter and setters */
    public function setId($value)
    {
        $this->setDataField('id', $value);
    }

    /**
     * relaties
     */

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