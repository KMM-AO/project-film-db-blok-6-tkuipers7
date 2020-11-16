<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf8');

$amount = $_GET['id'] ?? 5;

const PATH_TO_ROOT = '../';
require PATH_TO_ROOT . "init.php";

$movie = new movie();
$data = json_encode($movie->index());
var_dump(json_decode($data,true));

/**
 * testing getmovies
 */
//
//$config = include "../include/database_config.php";
//
//$dsn = $config['driver'] . ':host=' . $config['host'] . ';port=' . $config['port'] . ';dbname=' . $config['dbname'];
//$pdo = new PDO($dsn, $config['username'], $config['password']);
//
//
//$query =
//    '
//        SELECT m.title, m.original_title, m.description, m.adult, m.runtime, m.release_date, m.poster_path, m.original_language, genres
//        FROM movies AS m
//        JOIN (
//            SELECT GROUP_CONCAT(genres.name) as genres, id_movie
//            FROM movie_genre
//            join (SELECT *
//                    FROM genres
//                    ) genres ON genres.tmdb_genre_id = movie_genre.id_genre
//                    GROUP BY movie_genre.id_movie
//        ) movie_genre ON movie_genre.id_movie = m.tmdb_id
//        JOIN (
//
//        )
//        LIMIT 5
//        ';
//
//
//
//$statement = $pdo->prepare($query);
//$ok = $statement->execute();
//$data = $statement->fetchALL(PDO::FETCH_ASSOC);
//if ($ok)
//{
//    foreach ($data as &$movie)
//    {
//        createGenreArray($movie);
//    }
//    var_dump($data);
//}
//else {
//    var_dump($statement->errorInfo());
//}
//
//function createGenreArray(&$movie)
//{
//    $genres = $movie['genres'];
//    $ngenres = explode(',',$genres);
//    $movie['genres'] = $ngenres;
//}
/**
 * testing seeder
 */

//$seeder = new seeder();
//$seeder->seed();
//
//echo json_encode("done");

//$data = json_decode(@file_get_contents("https://api.themoviedb.org/3/movie/550/credits?api_key=47f82ce417fd43f049e40b737f0be49e"),true)['cast'];

//$data = json_decode(@file_get_contents("https://api.themoviedb.org/3/genre/movie/list?api_key=47f82ce417fd43f049e40b737f0be49e"),true)['genres'];

//$data = json_decode(file_get_contents("https://api.themoviedb.org/3/person/819?api_key=47f82ce417fd43f049e40b737f0be49e"),true);


//foreach ($data as $i => $y)
//{
//    echo "$i <br>";
//    var_dump($y);
//    echo "<br><br><br>";
//}

