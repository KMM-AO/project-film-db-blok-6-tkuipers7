<?php

/**
 * @author Jeroen van den Brink
 * @copyright 2020
 * 
 * configuratiefile voor de toegestane routes
 */
use core\Route;

$this->allowed_routes = 
[
     new Route(
         'getmovies',
         'GET',
         'moviecontroller',
         'index_json'
     ),
];