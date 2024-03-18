<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "schueler";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Verbindung fehlgeschlagen" . $conn->connect_error);
    }

    ?>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card-header text-center text-white" style="background: #1867ab;">
                    <h3>Alle Schüler</h3>
                </div>
                <div class="card-body">


                    <?php

                    $sql = "select * from tblschueler order by Schuelernummer desc";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        echo "<table id='myTable' class='table table-striped' border='1px'>";
                        echo "<thead>";
                        echo "<th scope='col'>Schuelernummer</th>";
                        echo "<th scope='col'>Nachname</th>";
                        echo "<th scope='col'>Vorname</th>";
                        echo "<th scope='col'>Geschlecht</th>";
                        echo "</thead>";

                        while ($row = $result->fetch_assoc()) {
                            echo "<tr scope='row'>";
                        echo "<td>" . $row["Schuelernummer"] . "</td>";
                        echo "<td>" . $row["Nachname"] . "</td>";
                        echo "<td>" . $row["Vorname"] . "</td>";
                        echo "<td>" . $row["Geschlecht"] . "</td>";
                        echo "</tr>";
                        }

                        echo "</table>";
                    } else{
                        echo "Keine Datensätze gefunden";
                    }
                    $conn->close();
                    ?>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>