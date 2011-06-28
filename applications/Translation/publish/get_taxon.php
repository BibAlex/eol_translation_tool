<?
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects.php';
include_once '../../../classes/DAL/DAL_names.php';


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
				 xsi:schemaLocation=\"http://www.eol.org/transfer/content/0.3 http://services.eol.org/schema/content_0_3.xsd\" 
				 xmlns:dcterms=\"http://purl.org/dc/terms/\" 
				 xmlns:dwct=\"http://rs.tdwg.org/dwc/terms/\" 
				 xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" 
				 xmlns=\"http://www.eol.org/transfer/content/0.3\" 
				 xmlns:geo=\"http://www.w3.org/2003/01/geo/wgs84_pos#\">");

echo("<taxon>");
echo("<dc:identifier>".$taxon->id."</dc:identifier>");
echo("<dwc:ScientificName>".htmlspecialchars($taxon->scientificName)."</dwc:ScientificName>");

// Get Common Names
//<commonName xml:lang="ar">NameHere</commonName>
$names = BLL_taxon_concepts::get_accepted_common_names($id);
foreach ($names as $name) {
	echo('<commonName xml:lang="'.$GLOBALS['to_language_abbreviation'].'">'.htmlspecialchars($name->string).'</commonName>');
}

// Get rejected Common Names
//<rejectedCommonName name_id="15"/>
$rejected_names = BLL_taxon_concepts::get_rejected_common_names($id);
foreach ($rejected_names as $rejected_name) {
	echo('<rejectedCommonName name_id="'.$rejected_name->id.'" />');
}

// Get data objects
//Note: If Arabic text is empty display by default the english text
$data_objects = BLL_taxon_concepts::get_translated_data_objects($id);
foreach ($data_objects as $data_object) {
	echo ("<dataObject>");
	
	echo ("<dc:identifier>".$data_object->guid."</dc:identifier>");
	echo ("<dataType>".$data_object->data_type."</dataType>");
	
	echo ("<mimeType>".$data_object->mime_type."</mimeType>");
	if ($data_object->object_title != '')
		echo ("<dc:title>".htmlspecialchars($data_object->object_title, ENT_NOQUOTES, "UTF-8")."</dc:title>");
	else
		echo ("<dc:title>".htmlspecialchars($data_object->object_title_source, ENT_NOQUOTES, "UTF-8")."</dc:title>");
	echo ("<dc:language>ar</dc:language>");
	echo ("<license>".htmlspecialchars($data_object->license, ENT_NOQUOTES, "UTF-8")."</license>");
	if ($data_object->rights_statement != '') {
		echo ("<dc:rights>".htmlspecialchars($data_object->rights_statement, ENT_NOQUOTES, "UTF-8")."</dc:rights>");		
	}
	elseif ($data_object->rights_statement_source != '') {
		echo ("<dc:rights>".htmlspecialchars($data_object->rights_statement_source, ENT_NOQUOTES, "UTF-8")."</dc:rights>");
	}		
	
	if ($data_object->rights_holder != '') {
		echo ("<dcterms:rightsHolder>".htmlspecialchars($data_object->rights_holder, ENT_NOQUOTES, "UTF-8")."</dcterms:rightsHolder>");		
	}
	elseif ($data_object->rights_holder_source != '') {
		echo ("<dcterms:rightsHolder>".htmlspecialchars($data_object->rights_holder_source, ENT_NOQUOTES, "UTF-8")."</dcterms:rightsHolder>");
	}
	if ($data_object->location != '') {
		echo ("<location>".htmlspecialchars($data_object->location, ENT_NOQUOTES, "UTF-8")."</location>");		
	}
	elseif ($data_object->location_source != '') {
		echo ("<location>".htmlspecialchars($data_object->location_source, ENT_NOQUOTES, "UTF-8")."</location>");
	}
	
	echo ("<dc:source>".htmlspecialchars($data_object->source_url, ENT_NOQUOTES, "UTF-8")."</dc:source>");
	
	if ($data_object->object_title != '')
		echo ("<subject>".htmlspecialchars($data_object->object_title, ENT_NOQUOTES, "UTF-8")."</subject>");
	else
		echo ("<subject>".htmlspecialchars($data_object->object_title_source, ENT_NOQUOTES, "UTF-8")."</subject>");
	
	if ($data_object->description != '')
		echo ("<dc:description>".htmlspecialchars($data_object->description, ENT_NOQUOTES, "UTF-8")."</dc:description>");
	else
		echo ("<dc:description>".htmlspecialchars($data_object->description_source, ENT_NOQUOTES, "UTF-8")."</dc:description>");	
	
		
	
	echo ("</dataObject>");
}

echo("</taxon>");
echo("</response>");
?>