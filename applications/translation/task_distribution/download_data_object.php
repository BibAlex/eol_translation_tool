<?php
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
 
 
echo("<b>Getting records with null GUI:</b><br><br>");
 
 
$null_data_objects = get_null_guides();
 
 
echo("Found: ".count($null_data_objects)."<br>");
 
 
foreach ($null_data_objects as $data_object)
{
                echo("Fetching master record for ".$data_object->id."<br>");
                $master_do = get_master_do_by_id($data_object->id);
                if (count($master_do) > 0) {
                                echo("Delete Slave record for ".$data_object->id."<br>");
                                delete_slave_data_object($data_object->id);
                                echo("Insert new slave record <br><br>");
                                BLL_data_objects::Insert_DataObject('slave', $master_do[0]);
                }
}
 
 
function get_null_guides() {
                $con = new PDO_Connection();
                $con->Open('slave');
 
                $stmt = $con->connection->prepare("select * from data_objects where guid is null;");
                $stmt->execute();
                $records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');
                $con->Close();
 
        return $records;
}
 
 
 
function get_master_do_by_id($id) {
                $con = new PDO_Connection();
                $con->Open('master');
 
                $stmt = $con->connection->prepare("select * from data_objects where id=".$id.";");
                $stmt->execute();
                $records = $stmt->fetchAll(PDO::FETCH_CLASS, 'DAL_data_objects');
                $con->Close();
 
                return $records;
}
 
function delete_slave_data_object($id) {
                $con = new PDO_Connection();
                $con->Open('slave');
 
                $stmt = $con->connection->prepare("delete from data_objects where id=".$id.";");
                $stmt->execute();
                $con->Close();
 
                return $records;
}
 
 
 
?>
 
