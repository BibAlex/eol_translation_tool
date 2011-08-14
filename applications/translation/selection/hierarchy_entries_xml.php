<?
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_hierarchy_entries.php';
include_once '../../../classes/DAL/DAL_hierarchy_entries.php';

header("Cache-Control: must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Expires: ".gmdate("D, d M Y H:i:s", mktime(date("H")-2, date("i"), date("s"), date("m"), date("d"), date("Y")))." GMT");
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");

$h_id = $default_hierarchy_id;
if (isset($_GET['h_id']))
    $h_id = $_GET['h_id'];

$p_id = 0;
if (isset($_GET['id']))
    $p_id = $_GET['id'];

$hierarchy_entries = BLL_hierarchy_entries::load_siblings($h_id, $p_id);


echo "[\n";
$i=0;
foreach ($hierarchy_entries as $hierarchy_entry)
{
    if($i >= 1) echo ",\n";
    echo "\t{\n";
    echo "\t\tattributes: { id : '".$hierarchy_entry->id."'";    
    echo "},\n";    
    if ($hierarchy_entry->siblings_count > 0)
        echo "\t\tstate: 'closed',\n";
    else
        echo "\t\tstate: 'leaf',\n";
    
    echo "\t\tdata: '".$hierarchy_entry->string."'\n";
    echo "\t}\n";
    $i += 1;
}
echo "]";
?>