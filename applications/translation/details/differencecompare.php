<?php 

include ('../master/includes.php');

include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

include_once '../../../classes/BLL/BLL_templates.php';
include_once '../../../classes/DAL/DAL_templates.php';

include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';

include_once '../../../classes/BLL/BLL_updated_data_objects.php';
include_once '../../../classes/DAL/DAL_updated_data_objects.php';

include_once '../../../classes/BLL/BLL_a_data_objects.php';
include_once '../../../classes/DAL/DAL_a_data_objects.php';

include_once '../../../classes/BLL/BLL_archived_a_data_objects.php';
include_once '../../../classes/DAL/DAL_archived_a_data_objects.php';

include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';

include_once '../../../classes/BLL/BLL_status.php';
include_once '../../../classes/DAL/DAL_status.php';

include_once "../../../classes/Text_Compare.php";
include_once "../../../classes/modules/Simple_Diff.php";

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		
  </head>
  <body>
        <?php
			//Load current Object info
			$start = 0;
			$limit = 1000;
			$updatedObjList = BLL_updated_data_objects::Select_limit_updated_dataObjects($start,$limit);
			echo "---------------".COUNT($updatedObjList)."-----------------";
		?>
    <!-- -------------------------Begin of Data Object Form -------------------- -->
     
 
    	<form name="frm" id="frm"  method="post">
    		<table border = "2">
    			<tr>
    				<td>
    					guid
    				</td>
    				<td>
    					Old Description
    				</td>
    				<td>
    					New Description
    				</td>
    				<td>
    					Text Compare
    				</td>
				<?php
					$counter = 1;
					foreach ($updatedObjList as &$updatedObj) {
						$oldObj = BLL_data_objects::Select_DataObjects_ByGuid($updatedObj->guid, $updatedObj->data_type_id);
						if($oldObj != '' && count($oldObj) > 0){
							if($oldObj[0] != '' && $updatedObj->guid != 'a4cb20faced620faa8bd984a1e6a0e68' && $updatedObj->guid != '930dbfc9661ec73650776a5ada6e168a' && $updatedObj->guid != '808af56ef423f54e54cd028ede319c33'){
				?>
    			<tr>
    				<td style="width:300px">
    					<?=$oldObj[0]->guid?>
    				</td>
    				<td style="width:300px">
    					<?=$oldObj[0]->description?>
    				</td>
    				<td style="width:300px">
    					<?=$updatedObj->description?>
    				</td>
    				<td style="width:300px">
    				
    					
    					 	<?php
    					 	echo Simple_Diff::htmlDiff($oldObj[0]->description, $updatedObj->description)
    					 	?>
    				</td>
    				
    			</tr>		
	
    				<?php
							}
						}
    					$counter++;	
					}
				?>
    			<tr>
    		</table>
    	</form>
	</body>
</html> 