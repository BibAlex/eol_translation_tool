<?php
include_once '../../../classes/BLL/BLL_names.php';
include_once '../../../classes/DAL/DAL_names.php';
include_once '../../../classes/BLL/BLL_taxon_concept_names.php';
include_once '../../../classes/DAL/DAL_taxon_concept_names.php';

include_once '../../../classes/BLL/BLL_a_names.php';
include_once '../../../classes/DAL/DAL_a_names.php';

//Load the current taxon
$taxon = BLL_taxon_concepts::Select_taxon_concept('slave',$taxonID);

	
?>
	<div class="form">
    	<h2>
          	<span style="float:left">
          		Species Common Names
          	</span>	
          
          	<br/>      
        </h2>      
           
       <div style="border:1px solid #C6C6C6; border-top:none;">
          <table border="0" cellpadding="10" cellspacing="0" width="100%">
              <tr>
              	<td class="oddc">ID</td>
                <td class="odd">Name</td>	               
                <td class="oddc">Status</td>		               
                <td class="oddc">&nbsp;</td>
                <td class="oddc">&nbsp;</td>
                
              </tr>
              
              <!-- ********************Begin of Old common Names ********************************** -->
              <?
              	$names = BLL_names::Select_Names_ByTaxon_ID($taxonID);
		        foreach ($names as $name){         
  	  		  ?>	
              <tr>
              	<td class="evenc"><?=$name->id?></td>  
              	<td class="evenc"><?=$name->string?></td>
              	<?php
              	$taxon_concept_name = BLL_taxon_concept_names::Select_TaxonNames_ByTaxonID_AND_NameID($taxonID,$name->id);
		        $status='Not Viewed';
		        switch ($taxon_concept_name->name_status_id) {
		        	case 2: $status='Accepted';	break;
		        	case 3: $status='Rejected';	break;
		        } 
              	?>
              	<td class="evenc"><?=$status?></td>
              	<td class="evenc">
              	<? 
              		if($taxon_concept_name->name_status_id>1) 
              			echo 'By '.BLL_users::get_user_name($taxon_concept_name->last_modified_person);
              		else 
              			echo '&nbsp;';
              	?>
              	</td>
                <td class="evenc">
                <? 
                	if($taxon_concept_name->name_status_id>1) 
                		echo 'On '.$taxon_concept_name->last_modified_date;
                	else 
              			echo '&nbsp;';
                ?>
                </td>
	            
              </tr>
            <?php }?>
		        <!-- ********************End of Old common Names ********************************** -->
		        <!-- ********************Begin of New common Names ********************************** -->
		        <?
              	$names = BLL_a_names::Select_a_names_ByTaxonID($taxonID);
		        foreach ($names as $name){         
  	  		  ?>	
              <tr>
              	<td class="evenc"><?=$name->id?></td>  
              	<td class="evenc"><?=$name->name?></td>
              	<?php
              	$status='Accepted';
		        if ($name->name_status_id==3) 
		        	$status='Rejected';		        
              	?>
              	<td class="evenc"><?=$status?></td>
              	<td class="evenc">
              	<? 
              		echo 'By '.BLL_users::get_user_name($name->last_modified_person);              		
              	?>
              	</td>
                <td class="evenc">
                <? 
                	echo 'On '.$name->last_modified_date;
                ?>
                </td>
                
              </tr>
             <?php }?>
		        <!-- ********************End of New common Names ********************************** -->
           </table>        
           
       </div>
  </div> 
  
