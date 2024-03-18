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

$selectedLandID = $_POST["landId"];
$sql = "SELECT * FROM bundesland where landId = $selectedLandID";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $options = '<option value="" selected disabled>Bitte wählen</option>';
    
    while ($row = $result->fetch_assoc()) {
        $options .= '<option value="' . $row['id'] .'">'. $row['name'] .'</option>';
    }
    echo $options;
} else {
    echo '<option value="" selected disabled>Keine Bundesländer gefunden</option>';
}
$conn->close();
