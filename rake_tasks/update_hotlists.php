<?php
include_once "config/database.yml";
include_once "config/constants.php";
include_once "classes/PDO_Connection.php";
include_once "classes/SendMail.php";


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
	$file_name = "rake_tasks/archive/".date("Ydm");
	$file = fopen($file_name, 'w');
	fwrite($file, $hotlists);
	fclose($file);
}


function clear_hotlists() {
	$query_str = 'delete from hotlists';
	$con = new PDO_Connection('config/database.yml');
	$con->Open('slave');
	$query = $con->connection->prepare($query_str);
	$query->execute();	  	 			    
	$con->Close();		
}


function insert_hotlists_entries($hotlists) {
	$hotlists_array = explode("\n", $hotlists);
	$con = new PDO_Connection('config/database.yml');
  	$con->Open('slave');
	$count = 0;
	foreach ($hotlists_array as $index => $item) {
		if (ord(substr(trim($item), 0, 1))!=215) { // for "×" charachter
			$query = $con->connection->prepare("insert into hotlists (entry) values (?);");
			$query->bindParam(1, $item);
			$query->execute();
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
