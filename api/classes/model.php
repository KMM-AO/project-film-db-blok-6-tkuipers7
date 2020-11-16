<?php


abstract class model extends mypdo
{
    private $apikey;
    protected $pdo;

    public function __construct()
    {
        parent::__construct();
        $this->setApiKey();
        $this->pdo = new mypdo();
    }

    // zet de api key vanuit de config
    private function setApiKey()
    {
        $api_config = include PATH_TO_ROOT."include/api_config.php";
        $this->apikey = $api_config['key'];
    }

    // haalt de api key op
    protected function getApiKey()
    {
        return $this->apikey;
    }

    /**
     * seeder functions
     */

    protected function deleteTableContent($tables = ['movie_person','people','genders','movie_genre','genres','movies'])
    {
        if (gettype($tables) === "array")
        {
            foreach ($tables as $table) :
                $query = "DELETE FROM " . $table;

                $statement = $this->pdo->prepare($query);

                $statement->execute();
            endforeach;
        }
        else
        {
            $query = "DELETE FROM " . $tables;

            $statement = $this->pdo->prepare($query);

            $statement->execute();
        }

    }
}