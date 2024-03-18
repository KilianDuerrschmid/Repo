<?php

$pdo = new PDO("mysql:host=localhost;dbname=db1","root","");
    echo "<h1>Ausgabe Tabelle</h1>";

    $sql = "select * from tblusers";
    $count = 1;
    echo"<table border='1px'>";
    echo"<th>Id</th>";
    echo"<th>E-Mail</th>";
    echo"<th>Vorname</th>";
    echo"<th>Nachname</th>";

    foreach ($pdo->query($sql) as $row) {
        echo "<tr>";
        echo "<td>" . $row["id"] . "</td>";
        echo "<td>" . $row["email"] . "</td>";
        echo "<td>" . $row["vorname"] . "</td>";
        echo "<td>" . $row["nachname"] . "</td>";
        echo "</tr>";
    }
    echo"</table>";


?>