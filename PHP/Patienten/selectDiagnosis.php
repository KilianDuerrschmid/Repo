<?php
require_once('config.php');

$patientId = $_POST["patientId"];

$query = $link->prepare('SELECT * from diagnosen where patientId = ' . $patientId);
$query->execute();
$res = $query->get_result();
$return = "";

foreach ($res as $entry) {
    $return .= '<tr>';
    $return .= '<td id="' . $entry["id"] . '">' . $entry["id"] . '</td>';
    $return .= '<td>' . $entry["name"] . '</td>';
    $return .= '<td>' . $entry["datum"] . '</td>';
    $return .= '</tr>';
}

echo $return;
exit();
