<?php

//header('Content-type: application/json; charset=utf-8');

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $spielname = $_POST["spielname"];
    $kategorie = $_POST["kategorie"];
    $kategorieId = 0;

    try {

        require_once('config.php');

        $query = $link->prepare('SELECT * from kategorie where UPPER(name) like UPPER("' . $kategorie . '") LIMIT 1');
        $query->execute();
        $res = $query->get_result();
        foreach ($res as $entry) {
            $kategorieId = $entry["id"];
        }

        if ($kategorieId == 0) {
            $sql = 'INSERT INTO kategorie 
            (name) 
            VALUES (?)';

            if ($stmt = mysqli_prepare($link, $sql)) {

                mysqli_stmt_bind_param(
                    $stmt,
                    "s",
                    $kategorie
                );



                if (!mysqli_stmt_execute($stmt))
                    echo "Oops! Something went wrong. Please try again later.";

                $kategorieId = $link->insert_id;
            }
        }

        $sql = 'INSERT INTO spiel 
        (name, kategorieId) 
        VALUES (?, ?)';

        if ($stmt = mysqli_prepare($link, $sql)) {

            mysqli_stmt_bind_param(
                $stmt,
                "si",
                $spielname,
                $kategorieId
            );



            if (!mysqli_stmt_execute($stmt))
                echo "Oops! Something went wrong. Please try again later.";

            $lastID = $link->insert_id;
        }
    } catch (PDOException $ex) {
        error_log("Write error - " . $ex . "\r\n", 3, "../logs/db-error.txt");
        echo json_encode(array("status" => "error"));
        exit();
    }

    echo json_encode(
        array(
            "id" => $lastID,
            "spielname" => $spielname,
            "kategorie" => $kategorie,
        )
    );
    exit();
}
