<?php

class Request
{
    public $url; # URL tapé par l'utilisateur

    function __construct()
    {
        $this->url = $_SERVER['REQUEST_URI']; # Il faudra un path info, mais je n'y arrive pas
    }
}