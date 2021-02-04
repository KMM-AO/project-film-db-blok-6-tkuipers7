<?php

use core\Route;

$this->allowed_routes = 
[
    /**
     * movies route's
     */

    // get a specific amount of movies
    // param: the max amount of records
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
    // param: id of a movie
    new Route(
        'movie/([1-9][0-9]*)',
        'GET',
        'MovieController',
        'getMovieInfo_json'
    ),

    /**
     * Persons route's
     */

    // get a specific amount of persons
    // param: the max amount of records
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
    // param: id of a person
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
    // post: credentials to register a user
    new Route(
        'user/register',
        'POST',
        'UserController',
        'register'
    ),

    // login a user
    // post: credentials of a user
    new Route(
        'user/login',
        'POST',
        'UserController',
        'login'
    ),

    // logout a user
    // post: token of a user
    new Route(
        'user/logout',
        'POST',
        'UserController',
        'logout'
    ),

    // add a movie to favorite
    // param: id of a movie
    // post: token of a user
    new Route(
        'user/addFavorite/([1-9][0-9]*)',
        'POST',
        'UserController',
        'addFavorite'
    ),

    // delete movie from favorite
    // param: id of the movie
    // post: token of a user
    new Route(
        'user/delFavorite/([1-9][0-9]*)',
        'POST',
        'UserController',
        'delFavorite'
    ),

    // add a movie to ratings
    // param 1: id of a movie
    // param 2: value of the rating
    // post: token of a user
    new Route(
        'user/addRating/([1-9][0-9]*)/([1-9][0-9]*)',
        'POST',
        'UserController',
        'addRating'
    ),

    // delete movie from ratings
    // param: id of the movie
    // post: token of a userd
    new Route(
        'user/delRating/([1-9][0-9]*)',
        'POST',
        'UserController',
        'delRating'
    ),

    /**
     * search route's
     */

    // search for a movie with a specific actor or director or name
    // param 1: type of the search
    // param 2: the search value
    // param 3: the max amount of records
    new Route(
        'movies/search/([a-zA-Z0-9]+)/([a-zA-Z 0-9]+)/([1-9][0-9]*)',
        'GET',
        'MovieController',
        'search'
    ),

    // search for a actor
    // param 1: type of the search
    // param 2: the search value
    // param 3: the max amount of records
    new Route(
        'persons/search/([a-zA-Z0-9]+)/([a-zA-Z 0-9]+)/([1-9][0-9]*)',
        'GET',
        'PeopleController',
        'search'
    ),

];