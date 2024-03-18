<?php
require_once('config.php');

$query = $link->prepare('SELECT *, p.id as pId, d.id as dId from patienten p 
join diagnosen d on p.id = d.patientId');
$query->execute();
$res = $query->get_result();
$return = "";

foreach ($res as $entry) {
    $return .= '<tr>';
    $return .= '<td id="' . $entry["pId"] . '">' . $entry["pId"] . '</td>';
    $return .= '<td>' . $entry["svnr"] . $entry["gebDat"] . '</td>';
    $return .= '<td>' . $entry["vorname"] . '</td>';
    $return .= '<td>' . $entry["nachname"] . '</td>';
    $return .= '<td>' . $entry["name"] . '</td>';
    $return .= '<td>' . $entry["datum"] . '</td>';
    $return .= '</tr>';
}

echo $return;

exit();
