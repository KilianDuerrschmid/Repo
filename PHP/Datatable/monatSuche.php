<?php
require_once('config.php');
$return = "";
$monat = $_POST["monat"];

$sql = 'SELECT *, FLOOR((DATEDIFF(DATE(now()), gebdat)) / 365.25) as "alter" FROM schueler where MONTH(gebdat) = ?';

if ($stmt = mysqli_prepare($link, $sql)) {

    mysqli_stmt_bind_param(
        $stmt,
        "i",
        $monat
    );

    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);

    foreach ($res as $entry) {
        $return .= '<trid="' . $entry["id"] . '">';
        $return .= '<td>' . $entry["anrede"] . '</td>';
        $return .= '<td>' . $entry["vorname"] . '</td>';
        $return .= '<td>' . $entry["nachname"] . '</td>';
        $return .= '<td>' . $entry["gebdat"] . '</td>';
        $return .= '<td>' . $entry["alter"] . '</td>';
        $return .= '</tr>';
    }

    mysqli_stmt_close($stmt);
}

echo $return;

exit();
