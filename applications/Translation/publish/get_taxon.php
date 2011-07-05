<?
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/BLL/BLL_data_objects_info_items.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_info_items.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/DAL/DAL_names.php';
include_once '../../../classes/DAL/DAL_users.php';


if (!$_GET['id'])
	exit;

if (!is_numeric($_GET['id']))
	exit;

$id = intval($_GET['id']);

//$id=1270491;
$taxon = BLL_taxon_concepts::get_by_id($id);

// check if taxon exists
if (!isset($taxon->id))
	exit;

// check if taxon is ready for publish
if ($taxon->taxon_status_id != 6)
	exit;

header("Content-type: text/xml");

echo ("<response xmlns:dc=\"http://purl.org/dc/elements/1.1/\" 
				 xmlns:dwc=\"http://rs.tdwg.org/dwc/dwcore/\" 
				 xmlns:dcterms=\"http://purl.org/dc/terms/\" 
				 xmlns:dwct=\"http://rs.tdwg.org/dwc/terms/\" 
				 xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" 
				 xmlns=\"http://www.eol.org/transfer/content/0.3.18\" 
				 xmlns:geo=\"http://www.w3.org/2003/01/geo/wgs84_pos#\" 
				 xsi:schemaLocation=\"http://www.eol.org/transfer/content/0.3.18 http://services.eol.org/schema/content_0_3_18.xsd\"
				 >");
 
echo("<taxon>");
echo("<dc:identifier>batr:tid:".$taxon->id."</dc:identifier>");
echo("<dwc:ScientificName>".htmlspecialchars($taxon->scientificName)."</dwc:ScientificName>");

// Get Common Names
//<commonName xml:lang="ar">NameHere</commonName>
$names = BLL_taxon_concepts::get_accepted_common_names($id);
foreach ($names as $name) {
	echo('<commonName xml:lang="'.$GLOBALS['to_language_abbreviation'].'">'.htmlspecialchars($name->string).'</commonName>');
}

// Get rejected Common Names
//<rejectedCommonName name_id="15"/>
//$rejected_names = BLL_taxon_concepts::get_rejected_common_names($id);
//foreach ($rejected_names as $rejected_name) {
//	echo('<rejectedCommonName name_id="'.$rejected_name->id.'" />');
//}

// Get data objects
//Note: If Arabic text is empty display by default the english text
$data_objects = BLL_taxon_concepts::get_translated_data_objects($id);

foreach ($data_objects as $data_object) {
	
	echo ("<dataObject>");
	//1.Identifier
	echo ("<dc:identifier>batr:doid:".$data_object->id."</dc:identifier>");
	//echo ("<dataType>".$data_object->data_type."</dataType>");	
	//echo ("<mimeType>".$data_object->mime_type."</mimeType>");
	//2.Agent(s)	
	echo ('<agent role="creator">'.htmlspecialchars(BLL_users::get_user_name($taxon->translator_id)).'</agent>');
	//3.Title
	if ($data_object->object_title != '')
		echo ("<dc:title>".htmlspecialchars($data_object->object_title, ENT_NOQUOTES, "UTF-8")."</dc:title>");
	else
		echo ("<dc:title>".htmlspecialchars($data_object->object_title_source, ENT_NOQUOTES, "UTF-8")."</dc:title>");
	//4.Language	
	echo ("<dc:language>ar</dc:language>");
	//echo ("<license>".htmlspecialchars($data_object->license, ENT_NOQUOTES, "UTF-8")."</license>");
	//5.Rights
	if ($data_object->rights_statement != '') {
		echo ("<dc:rights>".htmlspecialchars($data_object->rights_statement, ENT_NOQUOTES, "UTF-8")."</dc:rights>");		
	}
	elseif ($data_object->rights_statement_source != '') {
		echo ("<dc:rights>".htmlspecialchars($data_object->rights_statement_source, ENT_NOQUOTES, "UTF-8")."</dc:rights>");
	}		
	//6.Rights Holder
	if ($data_object->rights_holder != '') {
		echo ("<dcterms:rightsHolder>".htmlspecialchars($data_object->rights_holder, ENT_NOQUOTES, "UTF-8")."</dcterms:rightsHolder>");		
	}
	elseif ($data_object->rights_holder_source != '') {
		echo ("<dcterms:rightsHolder>".htmlspecialchars($data_object->rights_holder_source, ENT_NOQUOTES, "UTF-8")."</dcterms:rightsHolder>");
	}
		
	//echo ("<dc:source>".htmlspecialchars($data_object->source_url, ENT_NOQUOTES, "UTF-8")."</dc:source>");
	

	//$info_item = BLL_data_objects_info_items::Select_info_items_ByDataObjectId('master', $data_object->id);
	//if ($info_item != null)
	//	echo ("<subject>".htmlspecialchars($info_item->schema_value, ENT_NOQUOTES, "UTF-8")."</subject>");	
    //7.Description
	if ($data_object->description != '')
		echo ("<dc:description>".htmlspecialchars($data_object->description, ENT_NOQUOTES, "UTF-8")."</dc:description>");
	else
		echo ("<dc:description>".htmlspecialchars($data_object->description_source, ENT_NOQUOTES, "UTF-8")."</dc:description>");	
	//8.Location		
	if ($data_object->location != '') {
		echo ("<location>".htmlspecialchars($data_object->location, ENT_NOQUOTES, "UTF-8")."</location>");		
	}
	elseif ($data_object->location_source != '') {
		echo ("<location>".htmlspecialchars($data_object->location_source, ENT_NOQUOTES, "UTF-8")."</location>");
	}
	echo ("<additionalInformation>");
	echo ("<translation>");	
	echo ("<EOLDataObjectID>".htmlspecialchars($data_object->id, ENT_NOQUOTES, "UTF-8")."</EOLDataObjectID>");
	if($taxon->translator_id >0)
		echo ("<translator>".htmlspecialchars(BLL_users::get_user_name($taxon->translator_id), ENT_NOQUOTES, "UTF-8")."</translator>");
	if($taxon->scientific_reviewer_id >0)
		echo ("<scientificReviewer>".htmlspecialchars(BLL_users::get_user_name($taxon->scientific_reviewer_id), ENT_NOQUOTES, "UTF-8")."</scientificReviewer>");
	if($taxon->linguistic_reviewer_id >0)
		echo ("<linguisticReviewer>".htmlspecialchars(BLL_users::get_user_name($taxon->linguistic_reviewer_id), ENT_NOQUOTES, "UTF-8")."</linguisticReviewer>");
	echo ("</translation>");
	echo ("</additionalInformation>");
	
	echo ("</dataObject>");
}

echo("</taxon>");
echo("</response>");
?>