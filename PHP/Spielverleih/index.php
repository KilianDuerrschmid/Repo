<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Skitage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>

<body>

    <div class="container text-center">
        <div class="row">
            <div class="col">
                <h2>Eingabe</h2>
                <form id="neuer_eintrag">
                    <div class="mb-3">
                        <label for="spielname" class="form-label">Spielname</label>
                        <input type="text" class="form-control" name="spielname" id="spielname" value="spielname" placeholder="spielname">
                    </div>
                    <div class="mb-3">
                        <label for="kategorie" class="form-label">Kategorie</label>
                        <input type="text" class="form-control" name="kategorie" id="kategorie" value="Strategie" placeholder="kategorie">
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary mb-3">Speichern</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h2>Ausgabe</h2>
            </div>
        </div>

        <div class="row">
            <div class="col">

                <table id="testTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Spielname</th>
                            <th>Kategorie</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        require_once('config.php');

                        try {
                                $query = $link->prepare('SELECT s.id as id, s.name as spielname, k.name as kategorie from spiel s join kategorie k on s.kategorieId = k.id');
                                $query->execute();
                                $res = $query->get_result();

                                foreach ($res as $entry) {
                                    echo '<tr id="' . $entry["id"] . '">';
                                    echo '<td>' . $entry["id"] . '</td>';
                                    echo '<td>' . $entry["spielname"] . '</td>';
                                    echo '<td>' . $entry["kategorie"] . '</td>';
                                    echo '</tr>';
                                }
                                
                        } catch (PDOException $ex) {
                            error_log('Fehler beim Laden der Spiele.');
                        }
                        ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {

            $('#neuer_eintrag').submit(function(event) {
                event.preventDefault();

                $.ajax({
                    url: "insert_entry.php",
                    method: "post",
                    data: {
                        spielname: $('#spielname').val(),
                        kategorie: $('#kategorie').val()
                    },
                    success: function(res) {
                        let resJSON = JSON.parse(res);
                        //console.log(resJSON);

                        if (resJSON.status !== "error") {

                            //$('#testTable tbody').find('tr:first').before
                            $('#testTable tbody').find('tr:last').after('<tr id="' + resJSON.id + '">' +
                                '<td>' + resJSON.id + '</td>' +
                                '<td>' + resJSON.spielname + '</td>' +
                                '<td>' + resJSON.kategorie + '</td>' +
                                '</tr>');


                        } else {
                            alert("Fehler beim Einfügen.");
                        }
                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                });
            })
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>

</html>