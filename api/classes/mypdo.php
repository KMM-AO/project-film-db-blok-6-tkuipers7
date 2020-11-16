<?php


class mypdo extends PDO
{
    private $config;

    public function __construct() {
        $this->config = require PATH_TO_ROOT."include/database_config.php";
        $dsn = $this->config['driver'] . ':host=' . $this->config['host'] . ';port='.$this->config['port'] . ';dbname='.$this->config['dbname'];
        parent::__construct($dsn, $this->config['username'], $this->config['password']);
        $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
}