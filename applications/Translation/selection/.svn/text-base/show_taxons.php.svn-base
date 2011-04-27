<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/BLL/BLL_a_data_objects.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_status.php';
include_once '../../../classes/DAL/DAL_status.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

validate_session('selector');

if (!$_GET['id'])
	exit;

if (!is_numeric($_GET['id']))
	exit;
	
$id = intval($_GET['id']);

$selection = BLL_selection_batches::load_by_id($id);

if (!isset($selection[0]->id)) {
	?>
	<script>
		alert('Selection does not exist');
		window.location='show_selections.php';
	</script>
	<?
	exit;
}


?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Selection Details</title>
    <? include ('../master/header.php');?> 
</head>
<body>
<? include ('../master/top.php');?>

	<div style="clear:both; height:15px;"></div>
      <div class="form_table">	    
	    <div class="table_of_content">
	    	<h2>
	        	Selection Tool	          	
	        </h2>
		    <ul>
		        <li class="toc">
		        	<a href="select.php">New Selection</a>
		        </li>
		        <li class="toc" >
		        	<a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;" href="show_selections.php">Old Selections</a>
		        </li>		        	        
		    </ul>
	    </div>    
		<div class="form">
	  
	
	<?
	$hierarchy_id = $selection[0]->hierarchy_id;	
	
	$taxon_concepts = BLL_selection_batches::get_selected_taxons($id) ;	
	
	$taxon_ids = '';
	
	foreach ($taxon_concepts as $taxon_concept) {
		if ($taxon_ids != '') $taxon_ids .= ',';
		$taxon_ids .= $taxon_concept->id;	
	}	
	
	$taxon_count=0;
	
	if ($taxon_ids <> '') {
		$master_taxon_concepts = BLL_taxon_concepts::get_taxons_list($taxon_ids, $hierarchy_id);
		$taxon_count = count($master_taxon_concepts);
	}		
	?>



<div class="form">
		          <h2>Selection Status</h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		            
	<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3"  width="100%">	
		<tr>
			<td class="odd" width="100"><b>ID:</b></td>
			<td class="even"><?=$selection[0]->id?></td>
		</tr>
		<tr>
			<td class="odd" width="100"><b>Species Count:</b></td>
			<td class="even"><?=$taxon_count?></td>
		</tr>
		<tr>
			<td class="odd"><b>Selected By:</b></td>
			<td class="even"><?=BLL_users::get_user_name($selection[0]->user_id)?></td>
		</tr>
		<tr>
			<td class="odd"><b>Comments:</b></td>
			<td class="even"><?=$selection[0]->comments?></td>
		</tr>
		<tr>
			<td class="odd"><b>Date:</b></td>
			<td class="even"><?=date("d M Y H:i", strtotime($selection[0]->date_selected))?></td>
		</tr>
	</table>
	</div>
	<div style="clear:both;"><br/><br/></div>
	<?if ($taxon_ids <> '') {?>
	
	<div style="border:1px solid #C6C6C6;">
	<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3"  width="100%">	
		<tr>
			<td class="table_head"><center>ID</center></td>
			<td class="table_head">Species Name</td>
			<td class="table_head"><center>Status</center></td>			
			<td class="table_head"><center>Text</center></td>			
			<td class="table_head"><center>Images/Videos</center></td>
			<td class="table_head"><center></center></td>			
		</tr>
		<? 
		$td_class='odd';
		$users = new BLL_users();
		for ($i=0; $i<count($master_taxon_concepts); $i++) {			
			if ($td_class=='odd') $td_class='even'; else $td_class='odd';
			?>			
			<tr>
				<td class="<?=$td_class?>"><?=$master_taxon_concepts[$i]->id?></td>
				<td class="<?=$td_class?>">
					<a href="<?=$eol_site_url?>/pages/<?=$master_taxon_concepts[$i]->id?>" target="_blank">
						<?=$master_taxon_concepts[$i]->scientificName?>
					</a>
				</td>				
				<td class="<?=$td_class?>"><center><?=BLL_status::Select_Status_ByID($taxon_concepts[$i]->taxon_status_id)?></center></td>
				<td class="<?=$td_class?>"><center><?=$master_taxon_concepts[$i]->total_text_objects ?></center></td>
				<td class="<?=$td_class?>"><center><?=$master_taxon_concepts[$i]->total_image_objects + $master_taxon_concepts[$i]->total_other_objects?></center></td>
				<td class="<?=$td_class?>">				
					<?
					//if translation status is not in translation yet or in translation but no body has entered any text in it (saved or finished) then show the deletion button 
					if ($taxon_concepts[$i]->taxon_status_id <2 || ($taxon_concepts[$i]->taxon_status_id==2 && BLL_a_data_objects::Count_a_dataObjects_ByTaxonConceptID($master_taxon_concepts[$i]->id,0)==0 )) {?>
						<center><a href="delete_taxon.php?id=<?=$taxon_concepts[$i]->id?>&selection_id=<?=$id?>" onclick="return confirm('Are you sure you want to delete this taxon? All work done will be lost!')">Delete</a></center>
					<?}?>
				</td>			
				
			</tr>
		<?}?>		
	</table>
	<?}?>
	
	</div>
	</div>
	<script>
    ActiveLink('select');
    </script>
    </div></div>		
<? include ('../master/footer.php');?>     
</body>
</html>