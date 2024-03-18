<?php

//header('Content-type: application/json; charset=utf-8');

if($_SERVER["REQUEST_METHOD"] === "POST") {

  

    //Pflichtfelder mit empty prüfen, sonst abbrechen
    if(empty($_POST["id"]) || empty($_POST["datum"]) || empty($_POST["inhalt"])) {
        echo "Fehler!";
        exit();
    }
 
    //Pflichtfelder
    $id = $_POST["id"];
    $datum = $_POST["datum"];
    $inhalt = $_POST["inhalt"];

    try {

        require_once('db.php');
        $db = DB::connectDB();
        $query = $db->prepare('UPDATE tbldemo SET Datum = :datum, Inhalt = :inhalt WHERE ID = :id');
        $query->bindParam(":id", $id, PDO::PARAM_INT);
        $query->bindParam(":datum", $datum, PDO::PARAM_STR);
        $query->bindParam(":inhalt", $inhalt, PDO::PARAM_STR);
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
        "status" => "success",
        "id" => $id
        )
    );
    exit();

} else {

    http_response_code(405);
    echo json_encode(array(
        "status" => "method not allowed",
        )
    );
    exit();
}