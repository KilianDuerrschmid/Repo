<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <?php
    $pdo = new PDO("mysql:host=localhost;dbname=schueler", "root", "");
    $sql = "insert into tblschueler 
    (Schuelernummer, Vorname, Nachname, Geschlecht) 
    values 
    (:schuelernummer, :vorname, :nachname, :geschlecht)";

    $nummer = $_POST['num'];
    $vname = $_POST['vname'];
    $zname = $_POST['zname'];
    $sex = $_POST['sex'];

    $statement = $pdo->prepare($sql);
    $statement->execute(array(
        'schuelernummer' => $nummer, 'vorname' => $vname,
        'nachname' => $zname, 'geschlecht' => $sex
    ));
    header('Location: index.html');
    ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
</body>

</html>