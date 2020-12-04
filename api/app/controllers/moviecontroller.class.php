<?php


namespace app\controllers;

use app\models\Movie;

class moviecontroller extends Controller
{
    public function index_json()
    {
        $movies = Movie::index();

        if (!isset($movies))
        {
            $this->json->setStatus(404, 'Not Found');
        }
        else
        {
            $data = [];
            foreach($movies as $movie)
            {
                $movie_data = $movie->GetData();
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
                $data[] = $movie_data;
            }
            $this->json->add('movies', $data);
        }
        $this->json->render();
    }
}