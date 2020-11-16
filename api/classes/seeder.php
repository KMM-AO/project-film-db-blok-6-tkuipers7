<?php


class seeder extends model
{
    private $validids = [];

    public function __construct()
    {
        parent::__construct();
    }

    private function addValidId($id)
    {
        $this->validids[] = $id;
    }

    private function getValidIds()
    {
        return $this->validids;
    }

    public function seed ($amount = 100,$method = NULL)
    {
        $genre = new genre();
        $movie = new movie();

        $this->deleteTableContent();
        $this->insertGenders();
        $genre->insertGenres();
        switch ($method)
        {
            case 'random':
                $count = 0;
                do {
                    $tmdb_id = rand(1,900);
                    if (!in_array($tmdb_id,$this->getValidIds()))
                    {
                        $movie_details = json_decode(@file_get_contents("https://api.themoviedb.org/3/movie/" . $tmdb_id . "?api_key=" . $this->getApiKey()),true);
                    }
                    if (isset($movie_details))
                    {
                        $this->addValidId($tmdb_id);
                        $movie->insertMovie($movie_details);
                        $count++;
                    }
                } while ($count < $amount);
                break;
            default:
                $tmdb_id = 1;
                $count = 0;
                do {
                    $movie_details = json_decode(@file_get_contents("https://api.themoviedb.org/3/movie/" . $tmdb_id . "?api_key=" . $this->getApiKey()),true);
                    if (isset($movie_details))
                    {
                        $movie->insertMovie($movie_details);
                        $count++;
                    }
                    $tmdb_id++;
                } while ($count < $amount);
                break;
        }
    }

    // insert alle roles vanaf de roles config
    private function insertGenders()
    {
        $roles = include PATH_TO_ROOT."include/database_genders.php";
        foreach ($roles as $id => $role)
        {
            $query = "INSERT INTO genders (id, name) VALUES (:id, :name)";
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(':name',$role,PDO::PARAM_STR);
            $stmt->bindValue(':id',$id,PDO::PARAM_INT);
            $stmt->execute();
        }
    }
}