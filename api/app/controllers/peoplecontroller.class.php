<?php


namespace app\controllers;

use app\models\People;

class peoplecontroller extends Controller
{
    public function getPersonInfo_json($person_id)
    {
        $person = new People();
        $person->setPK($person_id);
        $person->load($success);
        if ($success)
        {
            $data = $person->getData();
            $data['gender'] = $person->getgender();
            $data['associated_movies'] = [];
            foreach($person->getassociatedMovies() as $movie)
            {
                $data['associated_movies'][] = $movie->GetData();
            }
            $this->json->add('person', $data);
        }
        else
        {
            $this->json->setStatus(404, 'Not Found');
        }
        $this->json->render();
    }

    public function index_json()
    {
        $actors = People::indexActors();

        if (isset($actors))
        {
            $data = [];
            foreach ($actors as $actor)
            {
                $data[] = $actor->GetData();
            }
            $this->json->add('actors', $data);
        }
        $this->json->render();
    }
}