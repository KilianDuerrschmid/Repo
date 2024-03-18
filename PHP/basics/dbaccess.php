<?php
    $pdo = new PDO("mysql:host=localhost;dbname=schueler","root","");
    $sql = "select * from tblschueler";
    $sql = "select * from tblschueler oder by vorname desc" ;
    $sql = "select * from tblschueler oder by vorname desc limit 3" ;
    $sql = "select * from tblschueler where id = 2017105" ;
    $sql = "select * from tblschueler where vorname = 'Dora'" ;


    foreach ($pdo->query($sql) as $row) {
        echo $row["Schuelernummer"]."<br/>" ;
        echo $row["Vorname"]."<br/>" ;
        echo $row["Nachname"]."<br/>" ;
    }

?>