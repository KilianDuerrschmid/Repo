<?php
require_once('config.php');

$query = $link->prepare('SELECT * from patienten');
$query->execute();
$res = $query->get_result();
$return = "";

foreach ($res as $entry) {
    $return .= '<tr>';
    $return .= '<td id="' . $entry["id"] . '">' . $entry["id"] . '</td>';
    $return .= '<td>' . $entry["svnr"] . $entry["gebDat"] . '</td>';
    $return .= '<td>' . $entry["vorname"] . '</td>';
    $return .= '<td>' . $entry["nachname"] . '</td>';
    $return .= '</tr>';
}

echo $return;

exit();
