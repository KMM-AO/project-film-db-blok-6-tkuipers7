<?php

/**
 * @author Jeroen van den Brink
 * @copyright 2020
 */

namespace app\controllers;

use app\models\User;
use core\Token;

class UserController extends Controller
{
    
    /**
     * TEST-methods voor het nabootsen van api-requests. 
     */
    
    /**
     * Registratieformulier.
     * 
     * - doet POST-request naar api/user/register
     * - verstuurt name, email, password en password_repeat
     */

    /**
     * API-requests
     */
     
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
     * - maak user-object
     * - stop gegevens (email, password) uit POST in user-object
     * - probeer user in te loggen
     * - bij mislukking: stop validatie-errors in de response
     * - bij succes: stop naam van de user en token in de response 
     */
    public function login()
    {
        $user = new User();
        
        $user->setEmail($_POST['email'] ?? '');
        $user->setPassword($_POST['password'] ?? '');
        
        $user->login();
        
        if (!$user->isValid())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $user->getErrors());
        }
        else
        {
            $this->json->add('success', true);
            $this->json->add('user_name', $user->name);
            $this->json->add('token', $user->getToken()->value);
        }
        
        $this->json->render();
        token::deleteInvalid();
    }

    /**
     * Logout-request
     * Deze request is alleen toegestaan als de user is geauthenticeerd (ingelogd)
     * 
     * Als user niet is geauthenticeerd:
     * - stop authenticatie-errors in de response
     * 
     * Als user wel is geauthenticeerd:
     * - stop de naam van de user in de response
     * - verwijder het token
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
     * Authenticatie-request
     * 
     * Als user niet is geauthenticeerd:
     * - stop authenticatie-errors in de response
     * 
     * Als user wel is geauthenticeerd:
     * - stop de naam van de user in de response
     */
    public function authenticate()
    {
        if (!$this->token->authenticated())
        {
            $this->json->add('success', false);
            $this->json->add('errors', $this->token->getErrors());
        }
        else
        {
            $this->json->add('success', true);
            $this->json->add('user_name', $this->token->getUser()->name);
        }
        
        $this->json->render();    
    }
}