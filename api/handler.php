<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf8');

const PATH_TO_ROOT = './';
require PATH_TO_ROOT . "init.php";

$call = $_GET['call'] ?? '';

switch ($call)
{
    case 'getmovies':
        $movies = new movie();
        echo json_encode($movies->index());
        break;
    default:
        echo json_encode('INVALID CALL TO API');
        break;

}