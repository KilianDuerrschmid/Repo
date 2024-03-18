<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skitage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.css" />

</head>

<body>
    <div class="container">

        <form id="monatSuche">
            <div class="row" id="radios">
                <div class="col-3">
                    <input type="radio" class="btn-check" name="month" id="current" value="current" checked>
                    <label for="current" class="btn btn-outline-secondary">Aktueller Monat</label>
                </div>
                <div class="col-3">
                    <input type="radio" class="btn-check" name="month" id="next" value="next">
                    <label for="next" class="btn btn-outline-secondary">Nächster Monat</label>
                </div>

                <div class="col-3">

                    <input type="radio" class="btn-check" name="month" id="prev" value="prev" onchange="">
                    <label for="prev" class="btn btn-outline-secondary">Letzter Monat</label>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary mb-3">Suche</button>
                </div>

            </div>
        </form>

        <div class="row">
            <div class="col">
                <h2>Datatable</h2>
            </div>
        </div>

        <div class="row">
            <div class="col">

                <table id="dataTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Anrede</th>
                            <th>Vorname</th>
                            <th>Nachname</th>
                            <th>Geburtsdatum</th>
                            <th>Alter</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        session_start();

                        require_once('config.php');

                        try {
                            $query = $link->prepare('SELECT *, FLOOR((DATEDIFF(DATE(now()), gebdat)) / 365.25) as "alter" from schueler');
                            $query->execute();
                            $res = $query->get_result();

                            foreach ($res as $entry) {
                                echo '<tr id="' . $entry["id"] . '">';
                                echo '<td>' . $entry["anrede"] . '</td>';
                                echo '<td>' . $entry["vorname"] . '</td>';
                                echo '<td>' . $entry["nachname"] . '</td>';
                                echo '<td>' . $entry["gebdat"] . '</td>';
                                echo '<td>' . $entry["alter"] . '</td>';
                                echo '</tr>';
                            }
                        } catch (PDOException $ex) {
                            error_log("Error: index.php - " . $ex . "\r\n", 3, "../logs/db-error.txt");
                        }
                        ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    </div>

    <script>
        $(document).ready(function() {
            new DataTable('#dataTable', {
                pageLength: 50
            });

            $('#monatSuche').submit(function(event) {
                event.preventDefault();
                let monat;
                let suche = $("#radios input[type='radio']:checked").val();

                if (suche == "current") {
                    monat = new Date().getMonth() + 1;
                } else if (suche == "next") {
                    monat = new Date().getMonth() + 2;
                    if (monat > 11) monat = 0;
                } else {
                    monat = new Date().getMonth();
                    if (monat == 0) monat = 11;
                }

                console.log(monat);
                console.log(suche);

                $.ajax({
                    url: "monatSuche.php",
                    method: "post",
                    data: {
                        monat: monat
                    },
                    success: function(res) {
                        console.log(res);

                        $('#dataTable tbody').html(res);
                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                });
            })

        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
</body>

</html>