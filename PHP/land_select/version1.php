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

$sql = 'SELECT * FROM land';
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo '<form method="post">';
    echo '<label for="countrySelect">Wählen Sie ein Land.</label>';
    echo '<select name ="countrySelect" id="countrySelect">';
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['id'] . '">' . $row["name"] . "</option>";
    }
    echo '</select><br>';
    echo '<input type="submit" value="Auswählen"';
    echo '</form>';
} else {
    echo "Keine Länder gefunden";
}
$conn->close();
?>
