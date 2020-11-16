<?php

function requireClass($class_name)
{
    require PATH_TO_ROOT . 'classes/' . strtolower($class_name) . '.php';
}

spl_autoload_register('requireClass');



