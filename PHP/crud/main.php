<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRUD</title>
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
                        <label for="datum" class="form-label">Datum</label>
                        <input type="date" class="form-control" name="datum" id="datum" placeholder="Datum">
                    </div>
                    <div class="mb-3">
                        <label for="inhalt" class="form-label">Inhalt</label>
                        <textarea class="form-control" name="inhalt" id="inhalt" rows="3"></textarea>
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
                            <th>ID</th>
                            <th>Datum</th>
                            <th>Inhalt</th>
                            <th>Aktionen</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php

                        require_once('db.php');

                        try {

                            $db = DB::connectDB();
                            $query = $db->prepare('SELECT * from tbldemo');
                            $query->execute();
                            $res = $query->fetchAll();
                            
                            foreach($res as $entry) {
                                echo '<tr id="'.$entry["ID"].'">';
                                echo '<td>'.$entry["ID"].'</td>';
                                echo '<td>'.$entry["Datum"].'</td>';
                                echo '<td>'.$entry["Inhalt"].'</td>';
                                echo '<td>
                                        <button type="button" class="btn btn-primary edit" data-bs-toggle="modal" data-bs-target="#editModal">Bearbeiten</button>
                                        <button type="button" class="btn btn-danger delete">Löschen</button>
                                    </td>';
                                echo '</tr>';
                            }
                        } catch(PDOException $ex) {
                                error_log("Error: main.php - ".$ex."\r\n", 3, "../logs/db-error.txt");
                        }
                                           
                        
                        
                        ?>

                    </tbody>   
                </table>

            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Bearbeiten von Datensatz</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="neuer_eintrag_modal">
                <div class="mb-3">
                    <label for="datum" class="form-label">Datum</label>
                    <input type="date" class="form-control" name="datum_modal" id="datum_modal" placeholder="Datum">
                </div>
                <div class="mb-3">
                    <label for="inhalt" class="form-label">Inhalt</label>
                    <textarea class="form-control" name="inhalt_modal" id="inhalt_modal" rows="5"></textarea>
                </div>
            </form>
            <p id="modalStatus"></p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Schließen</button>
            <button type="button" class="btn btn-primary save_modal">Speichern</button>
        </div>
        </div>
    </div>
    </div>

    <script>

        $(document).ready(function(){

            $('#neuer_eintrag').submit(function(event) {
                event.preventDefault();
                
                $.ajax({
                    url: "create-eintrag.php",
                    method: "post",
                    data: {
                        datum: $('#datum').val(),
                        inhalt: $('textarea[name="inhalt"]').val().trim()
                    },
                    success: function(res){
                       let resJSON = JSON.parse(res);
                       //console.log(resJSON);

                       if(resJSON.status !== "error")
                       {

                          //$('#testTable tbody').find('tr:last').after('<tr>'
                            $('#testTable tbody').find('tr:first').before('<tr id="'+resJSON.ID+'">'
                                +'<td>'+resJSON.ID+'</td>'
                                +'<td>'+resJSON.Datum+'</td>'
                                +'<td>'+resJSON.Inhalt+'</td>'
                                +'<td>'
                                +'<button type="button" class="btn btn-primary edit" data-bs-toggle="modal" data-bs-target="#editModal">Bearbeiten</button>'
                                +'<button type="button" class="btn btn-danger delete">Löschen</button>'
                                +'</td>'
                                +'</tr>');


                       }
                       else
                       {
                        alert("Fehler beim Einfügen.");
                       }
                    },
                    error: function(err){
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                });
            }) //submit


            $('#testTable tbody').on('click', 'button.delete', function(event) {

                let id = $(this).closest('tr').attr('id');
                //alert("delete: "+ id)
                $.ajax({
                    url: "delete-eintrag.php",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function(res){
                       let resJSON = JSON.parse(res);
                       //console.log(resJSON);

                       if(resJSON.status !== "error")
                       {
                            $('#'+id).remove();
                       }
                       else
                       {
                            alert("Fehler beim Löschen.");
                       }
                    },
                    error: function(err){
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                }) // ajax delete
            }); // delete


            //Modal Edit ID
            let modalId = "";
            
            $('#testTable tbody').on('click', 'button.edit', function(event) {
            
                let id = $(this).closest('tr').attr('id');
                modalId = id;

                $('#datum_modal').val( $('#'+id+' td:eq(1)').text().substring(0, 10) );
                $('#inhalt_modal').val( $('#'+id+' td:eq(2)').text() );

            }) // show edit modal


            $('#editModal').on('click', 'button.save_modal', function(event) {
       
                $.ajax({
                    url: "edit-eintrag.php",
                    method: "post",
                    data: {
                        id: modalId,
                        datum: $('#datum_modal').val(),
                        inhalt: $('textarea[name="inhalt_modal"]').val().trim()
                    },
                    success: function(res){
                       let resJSON = JSON.parse(res);

                       if(resJSON.status !== "error")
                       {
                            $('#modalStatus').html("Speichern erfolgreich.")
                            $('#modalStatus').css("color", "green");

                            $('#'+resJSON.id +' td:eq(1)').text( $('#datum_modal').val() );
                            $('#'+resJSON.id +' td:eq(2)').text( $('#inhalt_modal').val() );
                       }
                       else
                       {
                            $('#modalStatus').html("Fehler beim Speichern.")
                            $('#modalStatus').css("color", "red");
                       }
                    },
                    error: function(err){
                        alert("Es ist ein Fehler aufgetreten: " + err.status + " " + err.statusText);
                    }
                });
            }) //edit


       

          
        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

  </body>
</html>



































