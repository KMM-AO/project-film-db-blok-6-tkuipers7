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
            $this->json->add('response', [$data]);
        }
        else
        {
            $this->json->setStatus(404, 'Not Found');
        }
        $this->json->render();
    }

    public function index_json()
    {
        $persons = People::index('tmdb_person_id as id, people.name, genders.name as gender, profile_path');

        $data = [];
        if (count($persons) > 0)
        {
            foreach ($persons as $person)
            {
                $data[] = $person->GetData();
            }
        }
        $this->json->add('response', $data);
        $this->json->render();
    }

    public function index_json_limit($limit)
    {
        $persons = People::index('tmdb_person_id as id, people.name, genders.name as gender, profile_path',$limit);

        $data = [];
        if (count($persons) > 0)
        {
            foreach ($persons as $person)
            {
                $data[] = $person->GetData();
            }
        }
        $this->json->add('response', $data);
        $this->json->render();
    }
}