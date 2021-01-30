<?php

namespace app\controllers;

use app\models\Movie;

class moviecontroller extends Controller
{
    public function getMovieInfo_json($movie_id)
    {
        $movie = new Movie();
        $movie->setPK($movie_id);
        $movie->load($success);
        $data = [];
        if ($success)
        {
            $data = $movie->getData();

            $data['id'] = $data[Movie::PRIMARY_NAME];
            unset($data[Movie::PRIMARY_NAME]);

            $data['genres'] = [];
            foreach ($movie->getGenres() as $genre)
            {
                $data['genres'][] = $genre->getData();
            }
            $data['actors'] = [];
            foreach ($movie->getActors() as $actor)
            {
                $data['actors'][] = $actor->getData();
            }

        }
        $this->json->add('response',[$data]);
        $this->json->render();
    }

    public function index_json()
    {
        $movies = Movie::index('tmdb_id as id, title,original_title, poster_path');

        $data = [];
        if (count($movies) > 0)
        {
            foreach ($movies as $movie)
            {
                $data[] = $movie->GetData();
            }
        }
        $this->json->add('response', $data);
        $this->json->render();
    }

    public function index_json_limit($limit)
    {
        $movies = Movie::index('tmdb_id as id, title,original_title, poster_path',$limit);

        $data = [];
        if (count($movies) > 0)
        {
            foreach ($movies as $movie)
            {
                $data[] = $movie->GetData();
            }
        }
        $this->json->add('response', $data);
        $this->json->render();
    }

    public function search($type,$input,$limit)
    {

        if (Movie::searchIsAllowed($type))
        {
            $movies = Movie::indexSearch($type, $input, $limit);
            $data = [];
            if (count($movies) > 0)
            {
                foreach ($movies as $movie)
                {
                    $data[] = $movie->GetData();
                }
            }
            $this->json->add('response',$data);
        } else {
            $this->json->add('response', []);
        }

        $this->json->render();
    }
}