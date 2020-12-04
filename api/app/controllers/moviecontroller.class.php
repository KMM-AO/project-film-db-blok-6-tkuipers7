<?php


namespace app\controllers;

use app\models\Movie;
use app\models\People;

class moviecontroller extends Controller
{
    public function getMovieInfo_json($movie_id)
    {
        $movie = new Movie();
        $movie->setId($movie_id);
        $movie->load($success);
        if ($success)
        {
            $movie_data = $movie->getData();
            $movie_data['genres'] = [];
            foreach ($movie->getGenres() as $genre)
            {
                $movie_data['genres'][] = $genre->getData();
            }
            $movie_data['actors'] = [];
            foreach ($movie->getActors() as $actor)
            {
                $movie_data['actors'][] = $actor->getData();
            }
            $this->json->add('movie', $movie_data);
        }
        else
        {
            $this->json->setStatus(404, 'Not Found');
        }
        $this->json->render();
    }

    public function index_json()
    {
        $movies = Movie::index('tmdb_id as id,original_title, poster_path');

        if (!isset($movies))
        {
            $this->json->setStatus(404, 'Not Found');
        }
        else
        {
            $data = [];
            foreach ($movies as $movie)
            {
                $data[] = $movie->GetData();
            }
            $this->json->add('movies', $data);
        }
        $this->json->render();
    }
}