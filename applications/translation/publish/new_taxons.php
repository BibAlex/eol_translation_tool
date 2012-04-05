<?

include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

//THIS PAGE IS NOT USED ANYMORE 27 March 2012 

header("Content-type: text/xml"); 

$finished_taxons = BLL_taxon_concepts::get_finished_taxons();

echo ('<taxon_concepts>');

foreach ($finished_taxons as $taxon) {
	echo ('<taxon_concept id="'.$taxon->id.'" />');
}

echo ('</taxon_concepts>');
?>