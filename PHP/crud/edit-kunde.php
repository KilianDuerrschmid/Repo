<?php

//header('Content-type: application/json; charset=utf-8');

if($_SERVER["REQUEST_METHOD"] === "POST") {

  

    //Pflichtfelder mit empty prüfen, sonst abbrechen
    if(empty($_POST["id"]) || empty($_POST["anrede"]) || empty($_POST["vorname"])) {
        echo "Fehler!";
        exit();
    }
 
    //Pflichtfelder
    $id = $_POST["id"];
    $anrede = $_POST["anrede"];
    $vorname = $_POST["vorname"];
    $nachname = $_POST["nachname"];

    $anschrift = $_POST["anschrift"];
    $plz = $_POST["plz"];
    $ort = $_POST["ort"];
    $email = $_POST["email"];
    

    try {

        require_once('db.php');
        $db = DB::connectDB();
        $query = $db->prepare('UPDATE tblkunde SET Anrede = :anrede, Vorname = :vorname,  Nachname = :nachname, Anschrift = :anschrift, PLZ = :plz,  Ort = :ort, email = :email WHERE ID = :id');
        $query->bindParam(":id", $id, PDO::PARAM_INT);
        $query->bindParam(":anrede", $anrede, PDO::PARAM_STR);
        $query->bindParam(":vorname", $vorname, PDO::PARAM_STR);
        $query->bindParam(":nachname", $nachname, PDO::PARAM_STR);

        $query->bindParam(":anschrift", $anschrift, PDO::PARAM_INT);
        $query->bindParam(":plz", $plz, PDO::PARAM_STR);
        $query->bindParam(":ort", $ort, PDO::PARAM_STR);
        $query->bindParam(":email", $email, PDO::PARAM_STR);

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