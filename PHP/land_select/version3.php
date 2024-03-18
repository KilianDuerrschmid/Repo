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
                    echo '<select class="form-select" aria-label="Default select example" onchange="getBundesland(this.value)" name ="countrySelect" id="countrySelect">';
                    while ($row = $result->fetch_assoc()) {
                        echo '<option value="' . $row['id'] . '">' . $row["name"] . "</option>";
                    }
                    echo '</select><br>';
                    echo '<button type="button" class="btn btn-primary mb-3" onclick="info()">Land Info anzeigen</button>';

                    echo '<label class="form-label" for="bundeslandSelect">Wählen Sie ein Bundesland.</label>';
                    echo '<select class="form-select" aria-label="Default select example" name ="bundeslandSelect" id="bundeslandSelect"></select>';

                    echo '<button type="button" class="btn btn-primary mb-3" onclick="getBundeslandInfo()">Bundesland Info anzeigen</button>';

                    echo '</div>';
                    echo '</form>';
                } else {
                    echo "Keine Länder gefunden";
                }
                $conn->close();
                ?>

                <div class="card" style="width: 18rem;" id="bundeslandInfo">
                    
                </div>

        </div>
    </div>
</div>

<script>
    function info() {
        let element = document.getElementById("countrySelect")
        alert("Gewähltes Land: " + element.options[element.selectedIndex].text + " (ID: " + element.value + ")")
    }

    function getBundesland(selectedLandId) {
        console.log(selectedLandId);
        $.ajax({
            type: 'POST',
            url: 'selectBundesland.php',
            data: {
                landId: selectedLandId
            },
            success: function(response) {
                $('#bundeslandSelect').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Fehler beim Laden der Bundesländer:', error);
                $('#bundeslandSelect').html('<option value="" selected disabled>Fehler beim Laden der Bundesländer</option>');
            }
        })
    }

    function getBundeslandInfo() {
        let selectedId = document.getElementById("bundeslandSelect").value;
        $.ajax({
            type: 'POST',
            url: 'bundeslandInfo.php',
            data: {
                id: selectedId
            },
            success: function(response) {
                $('#bundeslandInfo').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Fehler beim Laden der Info:', error);
                $('#bundeslandInfo').html('Fehler beim Laden der Info.');
            }
        })
    }

    $(document).ready(function() {
        let selectedLandId = document.getElementById("countrySelect").value;
        $.ajax({
            type: 'POST',
            url: 'selectBundesland.php',
            data: {
                landId: selectedLandId
            },
            success: function(response) {
                $('#bundeslandSelect').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Fehler beim Laden der Bundesländer:', error);
                $('#bundeslandSelect').html('<option value="" selected disabled>Fehler beim Laden der Bundesländer</option>');
            }
        })
    })
</script>
</body>

</html>