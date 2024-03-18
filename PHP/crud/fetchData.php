<?php

require_once('db.php');
function getInvoices($kundenID, $status) {
    $output="";
    try {

        $db = DB::connectDB();
        if ($status == 1) {
            $query = $db->prepare("SELECT * FROM tblrechnung WHERE fkKundenID = $kundenID");
       
        }
        else {
            $query = $db->prepare("SELECT * FROM tblrechnung WHERE fkKundenID = $kundenID and Status=0 ");
       
        }
        
        //$query = $db->prepare("SELECT * FROM tblrechnung WHERE fkKundenID = 1");

        $query->execute();
        $res = $query->fetchAll();
        
        $output .= "<div class='container'>";
        $output .= "<div class='row'>";
        $output .= "<div class='col>";
        //$output .= "<div class='col-md-4'>";
        
        $output .= "<div class='table table-sm'>";
        $output .= "<table class='table table-bordered table-striped'>";
        $output .= "<thead class='thead-dark'><tr><th>id</th><th>Datum</th><th>Status</th></tr></thead>";
        $output .= "<tbody>";

             foreach($res as $entry) {
                    $output .= '<tr id="'.$entry["id"].'">';
                    $output .= '<td>'.$entry["id"].'</td>';
                    $output .= '<td>'.$entry["Datum"].'</td>';
                if ($entry["Status"] ==1) {
                    $output .= '<td>Erledigt</td>';
                }
                else {
                    $output .= '<td>Offen</td>';
                }
                    //$output .= '<td>'.$entry["Status"].'</td>';
                    $output .= '</tr>';
                }
                $output .= "</tbody>";
                $output .= "</table>";
                $output .= "</div>";

                $output .= "</div>";
                $output .= "</div>";
                $output .= "</div>";
    } catch(PDOException $ex) {
            error_log("Error: main.php - ".$ex."\r\n", 3, "../logs/db-error.txt");
    }
                       
    return $output;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['action'] === 'getInvoices') {
        $kundenID = $_POST['kundenID'];
        $status = $_POST['status'];
        $result = getInvoices($kundenID, $status);
        echo $result;
    }
    
}

?>
