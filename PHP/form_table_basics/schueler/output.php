<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<?php
    $pdo = new PDO("mysql:host=localhost;dbname=schueler","root","");
    $sql = "insert into tblschueler 
    (Schuelernummer, Vorname, Nachname, Geschlecht, GebDat, 
    Strasse, PLZ, Ort, Bundesland, Info, Klasse) 
    values 
    (:schuelernummer, :vorname, :nachname, :geschlecht, :gebDat, 
    :strasse, :plz, :ort, :bundesland, :info, :klasse)";

    $email = $_POST['num'];
    $vname = $_POST['vname'];
    $zname = $_POST['zname'];
    $sex = $_POST['sex'];
    $geb = $_POST['geb'];
    $street = $_POST['street'];
    $plz = $_POST['plz'];
    $city = $_POST['city'];
    $state = $_POST['state'];
    $info = $_POST['info'];
    $klasse = $_POST['klasse'];

    $statement = $pdo->prepare($sql);
    $statement->execute(array('schuelernummer'=> $email,'vorname'=> $vname,
     'nachname'=> $zname, 'geschlecht'=> $sex, 'gebDat'=> $geb, 
     'strasse'=> $street, 'plz'=> $plz, 'ort'=> $city, 
     'bundesland'=> $state, 'info'=> $info, 'klasse'=> $klasse));


    $sql = "select * from tblschueler order by Schuelernummer desc";

    echo"<table class='table table-striped' border='1px'>";
    echo"<thead >";
    echo"<th scope='col'>Schuelernummer</th>";
    echo"<th scope='col'>Vorname</th>";
    echo"<th scope='col'>Nachname</th>";
    echo"<th scope='col'>Geschlecht</th>";
    echo"<th scope='col'>GebDat</th>";
    echo"<th scope='col'>Strasse</th>";
    echo"<th scope='col'>PLZ</th>";
    echo"<th scope='col'>Ort</th>";
    echo"<th scope='col'>Bundesland</th>";
    echo"<th scope='col'>Info</th>";
    echo"<th scope='col'>Klasse</th>";
    echo"</thead>";

    foreach ($pdo->query($sql) as $row) {
        echo "<tr scope='row'>";
        echo "<td>" . $row["Schuelernummer"] . "</td>";
        echo "<td>" . $row["Vorname"] . "</td>";
        echo "<td>" . $row["Nachname"] . "</td>";
        echo "<td>" . $row["Geschlecht"] . "</td>";
        echo "<td>" . $row["GebDat"] . "</td>";
        echo "<td>" . $row["Strasse"] . "</td>";
        echo "<td>" . $row["PLZ"] . "</td>";
        echo "<td>" . $row["Ort"] . "</td>";
        echo "<td>" . $row["Bundesland"] . "</td>";
        echo "<td>" . $row["Info"] . "</td>";
        echo "<td>" . $row["Klasse"] . "</td>";
        echo "</tr>";
    }
    echo"</table>";

    echo "<a href='index.html'><button class='btn btn-primary'>Zurück</button></a>";
?>
