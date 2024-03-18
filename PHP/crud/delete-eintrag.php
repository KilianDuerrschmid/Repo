<?php

//header('Content-type: application/json; charset=utf-8');

if($_SERVER["REQUEST_METHOD"] === "POST") {

  

    //Pflichtfelder mit empty prüfen, sonst abbrechen
    if(empty($_POST["id"])) {
        echo "Fehler!";
        exit();
    }
 
    //Pflichtfelder
    $id = $_POST["id"];

    try {
        require_once('db.php');
        $db = DB::connectDB();
        $query = $db->prepare('DELETE FROM tbldemo WHERE ID = :id');
        $query->bindParam(":id", $id, PDO::PARAM_INT);
        $query->execute();

        //https://www.php.net/manual/de/pdo.constants.php
        //PARAM_STR (Datum, Kommazahlen, STRINGS)
        //PARAM_INT (Ganzzahlige Werte)
        
    } catch(PDOException $ex) {
        error_log("Write error - ".$ex."\r\n", 3, "../logs/db-error.txt");
        echo json_encode( array("status" => "error") );
        exit();
    }

    //Optionale Felder
    //$inhalt = $_POST["inhalt"] ?? '';

    echo json_encode(array(
        "status" => "success")
    );
    exit();

}