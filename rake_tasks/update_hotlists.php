<?php
include_once "config/database.yml";
include_once "config/constants.php";
include_once "classes/PDO_Connection.php";
include_once "classes/SendMail.php";
include_once "classes/DAL/DAL_names.php";


function clean_name($original_name)
{
    $name = str_replace("."," ",$original_name);
    $name = str_replace(","," ",$name);
    $name = str_replace(";"," ",$name);
    $name = str_replace("-"," - ",$name);
    $name = str_replace("("," ( ",$name);
    $name = str_replace(")"," ) ",$name);
    $name = str_replace("["," [ ",$name);
    $name = str_replace("]"," ] ",$name);
    $name = str_replace("{"," { ",$name);
    $name = str_replace("}"," } ",$name);
    $name = str_replace(":"," : ",$name);
    $name = str_replace("&"," & ",$name);
    $name = str_replace("?"," ? ",$name);
    $name = str_replace("*"," * ",$name);
    $name = str_replace("×"," × ",$name);
    $name = str_replace(" and "," & ",$name);
    $name = str_replace(" et "," & ",$name);
#    while(preg_match("/ /",$name)) $name = str_replace(" "," ",$name);
    $name = preg_replace("/([A-Z])/e","''.strtolower('\\1').''",$name);
        
    $name = str_replace("À","à",$name);
    $name = str_replace("Â","â",$name);
    $name = str_replace("Å","å",$name);
    $name = str_replace("Ã","ã",$name);
    $name = str_replace("Ä","ä",$name);
    $name = str_replace("Á","á",$name);
    $name = str_replace("Æ","æ",$name);
    $name = str_replace("C","c",$name);
    $name = str_replace("Ç","ç",$name);
    $name = str_replace("Č","č",$name);
    $name = str_replace("É","é",$name);
    $name = str_replace("È","è",$name);
    $name = str_replace("Ë","ë",$name);
    $name = str_replace("Í","í",$name);
    $name = str_replace("Ì","ì",$name);
    $name = str_replace("Ï","ï",$name);
    $name = str_replace("Ň","ň",$name);
    $name = str_replace("Ñ","ñ",$name);
    $name = str_replace("Ñ","ñ",$name);
    $name = str_replace("Ó","ó",$name);
    $name = str_replace("Ò","ò",$name);
    $name = str_replace("Ô","ô",$name);
    $name = str_replace("Ø","ø",$name);
    $name = str_replace("Õ","õ",$name);
    $name = str_replace("Ö","ö",$name);
    $name = str_replace("Ú","ú",$name);
    $name = str_replace("Ù","ù",$name);
    $name = str_replace("Ü","ü",$name);
    $name = str_replace("R","r",$name);
    $name = str_replace("Ŕ","ŕ",$name);
    $name = str_replace("Ř","ř",$name);
    $name = str_replace("Ŗ","ŗ",$name);
    $name = str_replace("Š","š",$name);
    $name = str_replace("Š","š",$name);
    $name = str_replace("Ş","ş",$name);
    $name = str_replace("Ž","ž",$name);
    $name = str_replace("Œ","œ",$name);
    return trim($name);
}

function get_new_contents() {
	try {
		$web_request = new HttpRequest('http://wiki.eol.org/download/attachments/5276955/Hotlist+Nov+2010', HttpRequest::METH_GET);
		$web_request->send();
		return $web_request->getResponseBody();
	} catch (Exception $e) {
		return "";
	}
}

function save_content_to_file($hotlists) {
	$file_name = "rake_tasks/archive/".date("Ymd");
	$file = fopen($file_name, 'w');
	fwrite($file, $hotlists);
	fclose($file);
}


function clear_hotlists() {
	$query_str = 'delete from hotlists_names';
	$con = new PDO_Connection('config/database.yml');
	$con->Open('master');
	$query = $con->connection->prepare($query_str);
	$query->execute();	  	 			    
	$query = $con->connection->prepare('delete from hotlists_hierarchy_entries');
        $query->execute();
	$con->Close();		
}


function insert_hotlists_entries($hotlists) {
	$hotlists_array = explode("\n", $hotlists);
	$con = new PDO_Connection('config/database.yml');
  	$con->Open('master');
	$count = 0;	
	foreach ($hotlists_array as $index => $item) {
		if (ord(substr(trim($item), 0, 1))!=215) { // for "×" charachter
			$name_cleaned = clean_name($item);
			$query = $con->connection->prepare("SELECT id from names where clean_name=?;");
			$query->bindParam(1, $name_cleaned);
			$query->execute();
			$records = $query->fetchAll(PDO::FETCH_CLASS, 'DAL_names');
			$name_id = null;
			if (count($records)>0)
				$name_id = $records[0]->id;
			$query = $con->connection->prepare("insert into hotlists_names (entry, name_id) values (?, ?);");
			$query->bindParam(1, $item);
			$query->bindParam(2, $name_id);
			$query->execute();
			if ($name_id != null) {
				$query = $con->connection->prepare("insert into hotlists_hierarchy_entries (hierarchy_entry_id) 
									select distinct id from hierarchy_entries inner join taxon_concept_names on taxon_concept_names.taxon_concept_id=hierarchy_entries.taxon_concept_id and taxon_concept_names.name_id=? and not exists (select * from hotlists_hierarchy_entries where hotlists_hierarchy_entries.hierarchy_entry_id=hierarchy_entries.id);");
				$query->bindParam(1, $name_id);
	                        $query->execute();
			}
			$count = $count + 1;
		}
		else {
			echo ("Dropping ".$item."\n");
		}
	}
	$con->Close();
	echo $count." record has been added\n";
}

$hotlists = get_new_contents();
if ($hotlists != "") {
	save_content_to_file($hotlists);
	clear_hotlists();
	insert_hotlists_entries($hotlists);
} else {
	SendMail.send_email($From_Mail, "Error downloading the hotlists file", "Error downloading the hotlists file");
}


?>
