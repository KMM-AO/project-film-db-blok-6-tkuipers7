<?php

namespace app\models;

use core\Model;
use core\Token;
use PDO;

class User extends Model {
    
    /** de bijbehorende database-tabel */
    const TABLENAME = 'users';
    const PRIMARY_NAME = 'id';
    const PRIMARY_TYPE = PDO::PARAM_INT;

    /** relatie-properties */
    private $token;             // user heeft 1-op-1-relatie met token
    private $favorites;
    private $ratings;

    /** password properties */
    private $password;
    private $password_repeat;

    public function __construct()
    {
        /**
         * Roep de parent-constructor aan met ��n optionele parameter:
         * primary-key-definitie als een array met twee elementen [naam, pdo-paramtype]
         *   default is ['id', PDO::PARAM_INT]
         */
        parent::__construct([self::PRIMARY_NAME,self::PRIMARY_TYPE]);
    }
    
    /** setters */
    
    public function setId($value)
    {
        $this->setDataField('id', $value);
    }
    
    public function setEmail($value)
    {
        $this->setDataField('email', $value);
    }
    
    public function setName($value)
    {
        $this->setDataField('name', $value);
    }
    
    public function setPasswordHash($value)
    {
        $this->setDataField('password_hash', $value);
    }
    
    public function setPassword($value)
    {
        $this->password = $value;
    }
    
    public function setPasswordRepeat($value)
    {
        $this->password_repeat = $value;
    }

    /** 
     * relaties
     * 
     * Relaties zijn in deze code lazy loaded,
     * d.w.z. ze worden pas uit de database opgehaald als ze opgevraagd worden.
     * 
     * Belangrijk is, dat relaties slechts 1x per request uit de database gehaald worden.
     * Dat wordt geregeld door de relatie op te slaan in een property. 
     * Als de property nog niet bestaat, wordt hij gemaakt en uit de database opgehaald.
     *
    */
    
    public function getToken()
    {
        if (!isset($this->token))
        {
        
            $this->token = new Token();

            $this->token->setIdUser($this->id);

            $this->token->loadByUser($success);

        }
        return $this->token;
    }

    public function getFavorites() {
        if (!isset($this->Favorites)) {
            $this->favorites = Movie::indexFavoritesByUser($this);
        }
        return $this->favorites;
    }
    function getRatings() {
        if (!isset($this->ratings)) {
            $this->ratings = Movie::indexRatingsByUser($this);
        }
        return $this->ratings;
    }

    /** database-acties */

    private function save()
    {
        $query =
        '
            INSERT INTO users (name, email, password_hash)
            VALUES (:name, :email, :password_hash)
        ';

        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':name', $this->name, PDO::PARAM_STR);
        $statement->bindValue(':email', $this->email, PDO::PARAM_STR);
        $statement->bindValue(':password_hash', $this->password_hash, PDO::PARAM_STR);
        $statement->execute();
        
        $this->setId($this->pdo->lastInsertId());
    }

    /**
     * @param $success
     */
    private function loadByEmail(&$success)
    {
        $query = 
        '
            SELECT *
            FROM users 
            WHERE email = :email
        ';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':email', $this->email, PDO::PARAM_STR);
        $statement->execute();
        $data = $statement->fetch(PDO::FETCH_ASSOC);
        $success = ($data != false);
        if ($success)
        {
            $this->setData($data);
        }
    }
    
    /**
     * LOGIN
     */

    public function login()
    {
        $this->loadByEmail($success);
        
        if (!$success)
        {
            $this->setError('form', 'Invalid user ID or password.');
        }
        elseif (!password_verify($this->password, $this->password_hash))
        {
            $this->setError('form', 'Invalid user ID or password.');
        }
                
        if ($this->isValid())
        {
            $this->getToken()->generate();
        }
    }

    /** REGISTRATIE */
    public function register()
    {
        $this->validateName();
        $this->validateEmail();
        $this->validatePassword();
        
        if ($this->isValid())
        {
            $this->setPasswordHash(password_hash($this->password, PASSWORD_DEFAULT));
            
            $this->save();

            $this->getToken()->generate();
        }
    }
    
    /** name mag niet leeg zijn */
    private function validateName()
    {
        if ($this->name == '')
        {
            $this->setError('username', 'Username can\'t be empty.');
        }    
    }

    /** email moet voldoen aan de eisen voor een e-mailadres, en mag niet al geregistreerd zijn */
    private function validateEmail()
    {
        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL))
        {
            $this->setError('form', 'Invalid user ID or password.');
        }
        else
        {
            $user = new User();
            $user->setEmail($this->email);
            $user->loadByEmail($success);
            if ($success)
            {
                $this->setError('form', 'Invalid user ID or password.');
            }
        }
    }
    
    /** password moet bestaan uit tenminste 6 tekens, waarvan tenminste 1 hoofdletter en tenminste 1 cijfer */
    private function validatePassword()
    {
        if (strlen($this->password) < 6 || !preg_match('/[A-Z]/', $this->password) || !preg_match('/[0-9]/', $this->password) || $this->password != $this->password_repeat)
        {
            $this->setError('form', 'Invalid user ID or password.');
        }
    }

    /**
     * General
     */

    /**
     * @param $table_name
     * @param $movie_id
     * @return bool
     */
    private function checkByMovieId($table_name,$movie_id)
    {
        $query =
            '
            SELECT *
            FROM ' . $table_name . '
            WHERE id_movie = :id_movie
        ';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id_movie', $movie_id, Movie::PRIMARY_TYPE);
        $statement->execute();
        $data = $statement->fetch(PDO::FETCH_ASSOC);
        return $data != false;
    }

    /**
     * @param $table_name
     * @param $movie_id
     * @return bool
     */
    private function delByMovieId($table_name,$movie_id)
    {
        $succes = false;
        if ($this->checkByMovieId($table_name,$movie_id))
        {
            $query =
                '
            DELETE FROM ' . $table_name . '
            WHERE id_user = :id_user && id_movie = :id_movie
        ';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(':id_user', $this->id, PDO::PARAM_INT);
            $statement->bindValue(':id_movie', $movie_id, PDO::PARAM_INT);
            $succes = $statement->execute();
        }
        return $succes;
    }

    /**
     *  FAVORITES
     */

    /**
     * @param $movie_id
     * @return bool
     */
    public function addFavorite($movie_id)
    {
        $succes = false;
        if (!$this->checkByMovieId('favorites',$movie_id))
        {
            $query =
                '
            INSERT INTO favorites (id_user, id_movie)
            VALUES (:id_user, :id_movie)
        ';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(':id_user', $this->id, PDO::PARAM_INT);
            $statement->bindValue(':id_movie', $movie_id, PDO::PARAM_INT);
            $succes = $statement->execute();
        }
        return $succes;
    }

    public function delFavorite($movie_id)
    {
        return $this->delByMovieId('favorites',$movie_id);
    }

    /**
     *  Ratings
     */

    /**
     * @param $movie_id
     * @param $rating
     * @return bool
     */
    public function addRating($movie_id,$rating)
    {
        if (!$this->checkByMovieId('ratings',$movie_id))
        {
            $query =
                '
                    INSERT INTO ratings (id_user, id_movie, rating)
                    VALUES (:id_user, :id_movie, :rating)
                ';
        } else {
            $query =
                '
                    UPDATE ratings 
                    SET rating = :rating
                    WHERE id_user = :id_user && id_movie = :id_movie 
                ';
        }
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id_user', $this->id, self::PRIMARY_TYPE);
        $statement->bindValue(':id_movie', $movie_id, Movie::PRIMARY_TYPE);
        $statement->bindValue(':rating', $rating, PDO::PARAM_INT);

        return $statement->execute();
    }

    public function delRating($movie_id)
    {
        return $this->delByMovieId('ratings',$movie_id);
    }
}
