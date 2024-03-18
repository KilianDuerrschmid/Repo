<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Länder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<div class="container text-center">
    <div class="row">
        <div class="col">

            <body>
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
                    echo '<form>';
                    echo '<div class="w-25 p-3">';
                    echo '<label class="form-label" for="countrySelect">Wählen Sie ein Land.</label>';
                    echo '<select class="form-select" aria-label="Default select example" name ="countrySelect" id="countrySelect">';
                    while ($row = $result->fetch_assoc()) {
                        echo '<option value="' . $row['id'] . '">' . $row["name"] . "</option>";
                    }
                    echo '</select><br>';
                    echo '<button type="button" class="btn btn-primary mb-3" onclick="info()">Info anzeigen</button>';
                    echo '</div>';
                    echo '</form>';
                } else {
                    echo "Keine Länder gefunden";
                }
                $conn->close();
                ?>
                
        </div>
    </div>
</div>

<script>
function info(){
    let element = document.getElementById("countrySelect")
    alert("Gewähltes Land: " + element.options[element.selectedIndex].text + " (ID: " + element.value + ")")
}
</script>
</body>

</html>