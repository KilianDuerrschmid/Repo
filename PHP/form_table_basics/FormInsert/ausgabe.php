<?php


    $pdo = new PDO("mysql:host=localhost;dbname=db1","root","");
    $sql = "insert into tblusers (email, vorname, nachname) 
    values (:email, :vorname, :nachname)";

    $email = $_POST['email'];
    $vname = $_POST['vname'];
    $zname = $_POST['zname'];

    $statement = $pdo->prepare($sql);
    $statement->execute(array('email'=> $email,'vorname'=> $vname,
     'nachname'=> $zname));

    echo "<h1>Ausgabe</h1>";

    $sql = "select * from tblusers";
    $count = 1;

    foreach ($pdo->query($sql) as $row) {
        echo "Eintrag " . $count . "<br/>";
        echo "E-Mail: " . $row["email"]."<br/>" ;
        echo "Vorname: " . $row["vorname"]."<br/>" ;
        echo "Nachname: " . $row["nachname"]."<br/>" ;
        $count++;
    }
?>