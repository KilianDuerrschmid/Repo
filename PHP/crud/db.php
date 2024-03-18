<?php

class DB {

    private const HOST = "localhost:3306";
    private const DBNAME = "crud";
    private const USER = "root";
    private const PASSWORD = "";

    private static $DBConnection;

    public static function connectDB() {

        if(self::$DBConnection === null)
        {
            self::$DBConnection = new PDO('mysql:host='.self::HOST.';dbname='.self::DBNAME.';charset=utf8', self::USER, self::PASSWORD);
       
            
            self::$DBConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
           
            self::$DBConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        }
        return self::$DBConnection;
    }

}