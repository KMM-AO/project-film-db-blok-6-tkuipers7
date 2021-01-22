<?php

use core\Route;

$this->allowed_routes = 
[
    /**
     * movies route's
     */

    // get a specific amount of movies
    new Route(
        'movies/([1-9][0-9]*)',
        'GET',
        'MovieController',
        'index_json_limit'
    ),

    // get all movies
     new Route(
         'movie',
         'GET',
         'MovieController',
         'index_json'
     ),

    // get a specific movie
    new Route(
        'movie/([1-9][0-9]*)',
        'GET',
        'MovieController',
        'getMovieInfo_json'
    ),

    /**
     * Persons route's
     */

    // get a specific amount of people
    new Route(
        'persons/([1-9][0-9]*)',
        'GET',
        'PeopleController',
        'index_json_limit'
    ),

    // get all people
    new Route(
        'person',
        'GET',
        'PeopleController',
        'index_json'
    ),

    // get a specific person
    new Route(
        'person/([1-9][0-9]*)',
        'GET',
        'PeopleController',
        'getPersonInfo_json'
    ),

    /**
     * user route's
     */

    // register a user
    new Route(
        'user/register',
        'POST',
        'UserController',
        'register'
    ),

    // login a user
    new Route(
        'user/login',
        'POST',
        'UserController',
        'login'
    ),

    // authenticate a user
    new Route(
        'user/authenticate',
        'POST',
        'UserController',
        'authenticate'
    ),

    // logout a user
    new Route(
        'user/logout',
        'POST',
        'UserController',
        'logout'
    ),

    /**
     * search route's
     */

    // search for a movie with a specific actor or director or name
    new Route(
        'movies/search/([a-zA-z0-9]+)/([a-zA-z 0-9]+)/([1-9][0-9]*)',
        'GET',
        'MovieController',
        'search'
    ),

    // search for a actor
    new Route(
        'persons/search/([a-zA-z0-9]+)/([1-9][0-9]*)',
        'GET',
        'PeopleController',
        'search'
    ),

];