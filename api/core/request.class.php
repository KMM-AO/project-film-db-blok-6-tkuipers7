<?php

/**
 * @author Jeroen van den Brink
 * @copyright 2020
 */

namespace core;

/**
 * De class Request is een container voor de twee eigenschappen die een request defini�ren:
 * - een uri (alleen het deel vanaf de webroot)
 * - een method (GET of POST)
 */
class Request
{
    /** properties */
    private $uri;
    private $method;
    
    /** constructor */
    public function __construct()
    {
        // verwijder url-encodering (zoals %20 voor spaties):
        $uri = urldecode($_SERVER['REQUEST_URI']);
        
        // bewaar alleen het deel van de uri vanaf de webroot:
        $this->uri = substr($uri, strlen(Router::getInstance()->getWebroot()));
        
        // bewaar de method (GET of POST)
        $this->method = $_SERVER['REQUEST_METHOD'] === 'OPTIONS' ? $_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'] : $_SERVER['REQUEST_METHOD'];
    }
        
    /** GETTERS */
    public function getMethod()
    {
        return $this->method;
    }
    
    public function getUri()
    {
        return $this->uri;
    }
    
    
}