<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patienten</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header class="bg-primary text-white p-3">
        <img src="images/header.png" alt="">
    </header>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="foo1()">Patient Einfügen</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="patients" onclick="foo2()">Patienten</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="patientsAndDiagnosis" onclick="foo3()">Alle Patienten mit Diagnosen</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="diagnosisToPatients" onclick="foo4()">Diagnosen Zu Patient</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="flex-container">
        <aside id="asideLinks" class="bg-light p-3">Aside 1</aside>
        <div id="divContent1" class="content bg-white p-3">

            <div class="container text-center">
                <div class="row">
                    <div class="col">
                        <h2>Eingabe</h2>
                        <form id="neuer_eintrag">
                            <div class="form-group" id="group">
                                <div class="mb-3 col-sm-6">
                                    <label for="svnr" class="form-label">Versicherungslaufnummer</label>
                                    <input type="text" class="form-control" name="svnr" id="svnr" placeholder="1234">
                                </div>
                                <div class="mb-3  col-sm-6">
                                    <label for="gebDatum" class="form-label">Geburtsdatum</label>
                                    <input type="text" class="form-control" name="gebDatum" id="gebDatum" value="030697" placeholder="TTMMJJ">
                                </div>
                                <div class="mb-3 col-sm-6">
                                    <label for="vorname" class="form-label">Vorname</label>
                                    <input type="text" class="form-control" name="vorname" id="vorname" value="Kilian" placeholder="Vorname">
                                </div>
                                <div class="mb-3 col-sm-6">
                                    <label for="nachname" class="form-label">Nachname</label>
                                    <input type="text" class="form-control" name="nachname" id="nachname" value="D" placeholder="Nachname"></input>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary mb-3" onclick="foo2()">Speichern</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div id="divContent2" class="content bg-white p-3">

            <div class="row">
                <div class="col">

                    <table id="patientTable" class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>SVNR</th>
                                <th>Vorname</th>
                                <th>Nachname</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr></tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div id="divContent3" class="content bg-white p-3">

            <div class="row">
                <div class="col">

                    <table id="patientDiagnosisTable" class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>SVNR</th>
                                <th>Vorname</th>
                                <th>Nachname</th>
                                <th>Diagnose</th>
                                <th>Datum der Diagnose</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr></tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div id="divContent4" class="content bg-white p-3">

            <div class="row">
                <div class="col">

                    <?php

                    echo '<label class="form-label" for="patientSelect">Wählen Sie ein Land.</label>';
                    echo '<select class="form-select" aria-label="Default select example" onchange="getDiagnosis(this.value)" name ="patientSelect" id="patientSelect">';

                    require_once('config.php');

                    $query = $link->prepare('SELECT * from patienten');
                    $query->execute();
                    $res = $query->get_result();
                    $return = "";

                    echo '<option value="" selected disabled>Bitte wählen</option>';

                    foreach ($res as $entry) {

                        echo '<option value="' . $entry['id'] . '">' . $entry['svnr'] . $entry['gebDat'] . '/' . $entry['nachname'] . '</option>';
                    }

                    echo '</select><br>';
                    ?>

                    <table id="diagnosisTable" class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Diagnose</th>
                                <th>Datum der Diagnose</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr></tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>


        <aside id="asideRechst" class="bg-light p-3">Aside 2</aside>
    </div>
    </div>

    <footer class="bg-dark text-white p-3">
        <p>Footer</p>
        <img src="images/footer.png" alt="">
    </footer>

    <script>
        function foo1() {
            document.getElementById("divContent1").style.display = "block";
            document.getElementById("divContent2").style.display = "none";
            document.getElementById("divContent3").style.display = "none";
            document.getElementById("divContent4").style.display = "none";
        }

        function foo2() {
            document.getElementById("divContent2").style.display = "block";
            document.getElementById("divContent1").style.display = "none";
            document.getElementById("divContent3").style.display = "none";
            document.getElementById("divContent4").style.display = "none";

        }

        function foo3() {
            document.getElementById("divContent3").style.display = "block";
            document.getElementById("divContent2").style.display = "none";
            document.getElementById("divContent1").style.display = "none";
            document.getElementById("divContent4").style.display = "none";
        }

        function foo4() {
            document.getElementById("divContent4").style.display = "block";
            document.getElementById("divContent2").style.display = "none";
            document.getElementById("divContent1").style.display = "none";
            document.getElementById("divContent3").style.display = "none";
        }

        function getDiagnosis(selectedPatient) {
                $.ajax({
                    url: "selectDiagnosis.php",
                    method: "post",
                    data: {
                        patientId: selectedPatient
                    },
                    success: function(res) {
                        console.log(res);

                        $('#diagnosisTable tbody').html(res);

                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                })
            }
    </script>

    <script>
        $(document).ready(function() {


            $('#patientsAndDiagnosis').on('click', function() {
                $.ajax({
                    url: "selectAllWithDiagnosis.php",
                    method: "get",
                    success: function(res) {
                        console.log(res);

                        $('#patientDiagnosisTable tbody').html(res);

                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                })
            })

            $('#patients').on('click', function() {
                selectAllPatients();
            })


            $('#neuer_eintrag').submit(function(event) {
                event.preventDefault();

                $.ajax({
                    url: "insert_entry.php",
                    method: "post",
                    data: {
                        svnr: $('#svnr').val(),
                        gebDatum: $('#gebDatum').val(),
                        vorname: $('#vorname').val(),
                        nachname: $('#nachname').val(),
                    },
                    success: function(res) {

                        console.log(res);

                        selectAllPatients();

                        /* let resJSON = JSON.parse(res);

                        if (resJSON.status !== "error") {
                            $('#patientTable tbody').html('<tr id="' + resJSON.id + '">' +
                                '<td>' + resJSON.svnr + '</td>' +
                                '<td>' + resJSON.vorname + '</td>' +
                                '<td>' + resJSON.nachname + '</td>' +
                                '<td>' + resJSON.gebDatum + '</td>' +
                                '</tr>');


                        } else {
                            alert("Fehler beim Einfügen.");
                        } */
                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                });
            })

            function selectAllPatients() {
                $.ajax({
                    url: "selectAllPatients.php",
                    method: "get",

                    success: function(res) {
                        console.log(res);

                        $('#patientTable tbody').html(res);

                    },
                    error: function(err) {
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                })
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


</body>

</html>