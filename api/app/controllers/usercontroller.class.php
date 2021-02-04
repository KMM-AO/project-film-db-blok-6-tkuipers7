<?php

/**
 * @author Jeroen van den Brink
 * @copyright 2020
 */

namespace app\controllers;

use app\models\movie;
use app\models\User;
use core\Token;

class UserController extends Controller
{
    /**
     * Registratie-request
     * 
     * - maak user-object
     * - stop gegevens (name, email, password en password_repeat) uit POST in user-object
     * - probeer user te registreren
     * - bij mislukking: stop validatie-errors in de response
     * - bij succes: stop naam van de user en token in de response 
     */
    public function register()
    {
        $user = new User();
        $user->setName(trim($_POST['username'] ?? ''));
        $user->setEmail(trim($_POST['email'] ?? ''));
        $user->setPassword(trim($_POST['password'] ?? ''));
        $user->setPasswordRepeat(trim($_POST['password2'] ?? ''));
        
        $user->register();
        
        if (!$user->isValid())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $user->getErrors());
            $this->json->add('password_requirements', 'Password requires atleast a length of 6 and atleast 1 number and atleast 1 capital letter.');
        }
        else
        {
            $this->json->add('success', true);
            $this->json->add('user_name', $user->name);
            $this->json->add('token', $user->getToken()->value);
        }
        $this->json->render();
    }
    
    /**
     * Login-request
     *
     * - delete alle invalid tokens
     * - maak user-object
     * - stop gegevens (email, password) uit POST in user-object
     * - probeer user in te loggen
     * - bij mislukking: stop validatie-errors in de response
     * - bij succes: stop naam van de user en token in de response 
     */
    public function login()
    {
        token::deleteInvalid();
        $user = new User();

        $user->setEmail($_POST['email'] ?? '');
        $user->setPassword($_POST['password'] ?? '');

        $user->login();

        if (!$user->isValid()) {
            $this->json->add('success', false);
            $this->json->add('errors', $user->getErrors());
        } else {
            $this->json->add('success', true);
            $this->json->add('user_name', $user->name);
            $this->json->add('token', $user->getToken()->value);

            $favorites = [];
            foreach($user->getFavorites() as $favorite){
                $favorites[] = $favorite->getData();
            }
            $this->json->add('favorites', $favorites);

            $rated = [];
            foreach($user->getRatings() as $rating){
                $rated[]  = $rating->getData();
            }
            $this->json->add('rated', $rated);
        }
        $this->json->render();
    }

    /**
     * Logout-request
     * Deze request is alleen toegestaan als de user is geauthenticeerd (ingelogd)
     * 
     * Als user niet is geauthenticeerd:
     * - stop authenticatie-errors in de response
     * 
     * Als user wel is geauthenticeerd:
     * - verwijder het token
     * @author Jeroen van den Brink
     */
    public function logout()
    {        
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $this->json->add('success', true);
            
            $this->token->delete($success);
        }
        $this->json->render();
    }

    /**
     * @param $movie_id
     * @author Tristan Kuipers
     */
    public function addFavorite($movie_id)
    {
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $user = new User();
            $user->setId($this->token->getUser()->id);
            $this->json->add('success',$user->addFavorite($movie_id));

            $movie = Movie::indexFavoriteById($movie_id);
            $this->json->add('movie', $movie->getData());
        }
        $this->json->render();
    }

    /**
     * @param $movie_id
     * @author Tristan Kuipers
     */
    public function delFavorite($movie_id)
    {
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $user = new User();
            $user->setId($this->token->getUser()->id);
            $this->json->add('success',$user->delFavorite($movie_id));
        }
        $this->json->render();
    }

    /**
     * @param $movie_id
     * @param $rating
     * @author Tristan Kuipers
     */
    public function addRating($movie_id, $rating)
    {
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $user = $this->token->getUser();
            $this->json->add('success',$user->addRating($movie_id,$rating));

            $movie = Movie::indexRatingById($movie_id);
            $this->json->add('movie', $movie->getData());

        }
        $this->json->render();
    }

    /**
     * @param $movie_id
     * @param $rating
     * @author Tristan Kuipers
     */
    public function delRating($movie_id)
    {
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $user = new User();
            $user->setId($this->token->getUser()->id);
            $this->json->add('success',$user->delRating($movie_id));
        }
        $this->json->render();
    }
}