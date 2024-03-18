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
    <div class="row">
        <div class="col">
            <h2>Datatable</h2>
        </div>
    </div>
    <div class="container">
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
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
</body>

</html>