<?php

namespace core;

use app\models\User;
use PDO;

class Token extends Model {
    
    /** de bijbehorende database-tabel */
    const TABLENAME = 'tokens';

    const PRIMARY_NAME = 'value';
    const PRIMARY_TYPE = PDO::PARAM_STR;
    
    /** relatie-properties */
    private $user;              // token heeft 1-op-meer-relatie met user
    
    public function __construct()
    {
        /**
         * Roep de parent-constructor aan met ��n optionele parameter:
         * primary-key-definitie als een array met twee elementen [naam, pdo-paramtype]
         *   default is ['id', PDO::PARAM_INT]
         */
        parent::__construct([self::PRIMARY_NAME, self::PRIMARY_TYPE]);
    }
    
    /** setters */
    
    public function setValue($value)
    {
        $this->setDataField('value', $value);
    }
    
    public function setIdUser($value)
    {
        $this->setDataField('id_user', $value);
    }

    /** 
     * relaties (relaties zijn lazy loaded)
     */    
    public function getUser()
    {
        if (!isset($this->user))
        {        
            $this->user = new User();

            $this->user->setId($this->id_user);

            $this->user->load($success);
            
        }
        return $this->user;
    }

    /** niet-generieke database-acties */
    
    private function save()
    {
        $query =
        '
            INSERT INTO tokens (value, id_user)
            VALUES (:value, :id_user)
        ';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':value', $this->value, PDO::PARAM_STR);
        $statement->bindValue(':id_user', $this->id_user, PDO::PARAM_INT);
        $statement->execute();
    }

    public function load(&$success)
    {
        $query =
            '
            SELECT *
            FROM ' . self::TABLENAME . '
            WHERE ' . self::PRIMARY_NAME . ' = :pk && UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(date_created) < 86400
        ';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':pk', $this->getPrimaryValue(), self::PRIMARY_TYPE);
        $statement->execute();
        $data = $statement->fetch(PDO::FETCH_ASSOC);
        $success = ($data != false);
        if ($success)
        {
            $this->setData($data);
        }
    }

    public function loadByUser(&$success)
    {
        $query = 
        '
            SELECT *
            FROM tokens
            WHERE id_user = :id_user
        ';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id_user', $this->id_user, PDO::PARAM_INT);
        $statement->execute();
        $data = $statement->fetch(PDO::FETCH_ASSOC);
        $success = ($data != false);
        if ($success)
        {
            $this->setData($data);
        }
    }
    
    /** acties bij REGISTRATIE en LOGIN */
    
    public function generate()
    {
        $this->setValue(uniqid());
        $this->save();
    }
    
    /** 
     * AUTHENTICATIE
     *
     * API-authenticatie gaat bij voorkeur via een COOKIE, maar omdat dat lastig is in een
     * situatie waarbij je het token moet versturen vanaf een SPA (zoals Vue) in een ander
     * domein dan de API-backend, is er hier gekozen voor POST.
     *
     */
    
    public function authenticated()
    {
        $this->setValue($_POST['token'] ?? '');
        
        if ($this->value == '')
        {
            $this->setError('token', 'token ontbreekt');
        } 
        else
        {
            $this->load($ok);
            
            if (!$ok)
            {
                $this->setError('token', 'token is ongeldig');
            }
        }
        
        return $this->isValid();
    }

    /**
     * kijkt of de token geldig is zo niet dan worden errors gemaakt
     * @author Jeroen van den Brink
     * @edited Tristan Kuipers
     * - token ophalen
     * - errors msg's naar engels
     */
    public function authenticate()
    {
        $this->setValue(trim($_POST['token']) ?? '');

        if ($this->value == '')
        {
            $this->setError('token', 'Missing token.');
        }
        else
        {
            $this->load($success);

            if (!$success)
            {
                $this->setError('token', 'Invalid token.');
            }
        }
    }

    /**
     * Verwijdered alle tokens die langer dan een dag bestaan
     * @author Tristan Kuipers
     */
    static public function deleteInvalid() {
        $query =
            '
            DELETE
            FROM tokens
            WHERE UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(date_created) > 86400
        ';
        $statement = Database::getInstance()->getPdo()->prepare($query);
        $statement->execute();

    }
}
