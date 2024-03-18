<?php
include_once('config.php');

$conn = new mysqli(
    $databaseConfig['servername'],
    $databaseConfig['username'],
    $databaseConfig['password'],
    $databaseConfig['dbname']
);
if ($conn->connect_error) {
    die('Verbindung zu Datenbank fehlgeschlagen: ' . $conn->connect_error);
}

$selectedId = $_POST["id"];
$sql = "SELECT * FROM bundesland where id = $selectedId";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $response = '<img class="card-img-top" src="' . $row['bild'] . '" 
        alt="Card image cap">
        <div class="card-body">
        <h5 class="card-title">' . $row['name'] . '</h5>
        <ul class="list-group list-group-flush">
    <li class="list-group-item">Hauptstadt: '
            . $row['hauptstadt'] . '</li>
    <li class="list-group-item">Fläche: ' . $row['flaeche'] .
            '</li>
    <li class="list-group-item">Einwohner: ' . $row['einwohner'] . '</li>
  </ul>';
    }
    echo $response;
} else {
    echo '<option value="" selected disabled>Keine Bundesländer gefunden</option>';
}
$conn->close();
