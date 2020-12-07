<?php

use core\Route;

$this->allowed_routes = 
[
     new Route(
         'movie',
         'GET',
         'moviecontroller',
         'index_json'
     ),
    new Route(
        'movie/([1-9][0-9]*)',
        'GET',
        'moviecontroller',
        'getMovieInfo_json'
    ),
    new Route(
        'person',
        'GET',
        'peoplecontroller',
        'index_json'
    ),
    new Route(
        'person/([1-9][0-9]*)',
        'GET',
        'peoplecontroller',
        'getPersonInfo_json'
    ),


];