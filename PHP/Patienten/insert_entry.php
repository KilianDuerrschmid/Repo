<?php


if ($_SERVER["REQUEST_METHOD"] === "POST") {
    
    $svnr = $_POST["svnr"];
    $gebDatum = $_POST["gebDatum"];
    $vorname = $_POST["vorname"];
    $nachname = $_POST["nachname"];

    try {

        require_once('config.php');

        $sql = 'INSERT INTO patienten 
        (svnr, gebDat, vorname, nachname) 
        VALUES (?, ?, ?, ?)';

        echo implode($_POST);

        if ($stmt = mysqli_prepare($link, $sql)) {

            mysqli_stmt_bind_param(
                $stmt,
                "isss",
                $svnr,
                $gebDatum,
                $vorname,
                $nachname,
            );

            if(!mysqli_stmt_execute($stmt))
                echo "Fehler.";

            $lastID = $link->insert_id;
        }

    } catch (PDOException $ex) {
        echo json_encode(array("status" => "error"));
        exit();
    }

    echo json_encode(
        array(
            "id" => $lastID,
            "svnr" => $svnr,
            "gebDatum" => $gebDatum,
            "vorname" => $vorname,
            "nachname" => $nachname,
        )
    );
    exit();
}
