<?php
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/Pagination.php';


validate_session('task_distribution');

if (!$_GET['id'])
	header('Location: show_selections.php');

if (!is_numeric($_GET['id']))
	header('Location: show_selections.php');

$id = intval($_GET['id']);

$selection = BLL_selection_batches::load_by_id($id);

if (count($selection) == 0)
	header('Location: show_selections.php');

function get_record_index($taxon_concepts, $id) {	
	for ($i=0; $i<count($taxon_concepts); $i++) {
		if ($taxon_concepts[0]->id==$id) {
			return $i;
		}
	}
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Taxon List</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
    	function validateForm(frm) {
        	var species_count = parseInt(frm.species_count.value);
			for (var i=0; i<species_count; i++) {
				if (document.getElementById('scientific_reviewer'+i).value ==0) {
					alert('Missing scientific reviewer');
					document.getElementById('scientific_reviewer'+i).focus();
					return false;
				}
			}        	
			return confirm('Are you sure you want to proceed');
    	}
    </script> 
</head>
<body>
<? include ('../master/top.php');?>
	
	<div style="clear:both; height:15px;"></div>
      <div class="form_table">	    
	    <div class="table_of_content">
	    	<h2>
	        	Task Distribution	          	
	        </h2>
		    <ul>
		        <?include_once 'links.php';?>        	        
		    </ul>
	    </div>    
		<div class="form">
			<h2>Reassign Tasks</h2>
	<?
	$hierarchy_id = $selection[0]->hierarchy_id;	
	
	$taxon_concepts = BLL_selection_batches::get_old_selected_taxons($id) ;	
	
	$current_page = Pagination::get_current_page(count($taxon_concepts), $items_per_page);
	
	$start_index = ($current_page -1) * $items_per_page;
	if ($start_index > count($taxon_concepts)) {
		$start_index = 0;
		$current_page = 1;
	}
	
	$end_index = $current_page * $items_per_page;
	if ($end_index > count($taxon_concepts))
		$end_index = count($taxon_concepts);
	
	?>
	<input type="hidden" name="selection_id" value="<?=$id?>" />
	<center>
	<div style="border:1px solid #C6C6C6; border-top:none;">
	<table width="100%" border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3">	
		<tr>
			<td class="odd"  style="font-weight:bold"><b>ID:</b></td>
			<td class="even"><?=$selection[0]->id?></td>
		</tr>
		<tr>
			<td class="odd" width="100" style="font-weight:bold"><b>Species Count:</b></td>
			<td class="even"><?=count($taxon_concepts)?></td>
		</tr>
		<tr>
			<td class="odd"  style="font-weight:bold"><b>Selected By:</b></td>
			<td class="even"><?=BLL_users::get_user_name($selection[0]->user_id)?></td>
		</tr>
		<tr>
			<td class="odd"  style="font-weight:bold"><b>Comments:</b></td>
			<td class="even"><?=$selection[0]->comments?></td>
		</tr>
		<tr>
			<td class="odd"  style="font-weight:bold"><b>Date:</b></td>
			<td class="even"><?=date("d M Y H:i", strtotime($selection[0]->date_selected))?></td>
		</tr>
	</table>
	</div>
	&nbsp;
	 <br/>
	<input type="hidden" name="species_count" value="<?=count($taxon_concepts)?>" />
		<br/><br/>
	<div style="border:1px solid #C6C6C6;">
	<table border="0" style="border-collapse:collapse; text-align:center;" cellspacing="0" cellpadding="3">	
		<tr>
			<td class="table_head"><center>ID</center></td>
			<td class="table_head" width="300"><center>Species Name</center></td>			
			<td class="table_head"><center>Status</center></td>
			<td class="table_head"><center>Text</center></td>
			<td class="table_head"><center>Images/<br/>Videos</center></td>
		
			<td class="table_head" colspan="2"><center>Translator</center></td>
			<td class="table_head"><center>Linguistic Reviewer</center></td>
			<td class="table_head"><center>Scientific Reviewer</center></td>
			<td class="table_head" colspan="2"></td>
		</tr>
		<? 
		$td_class='odd';
		$users = new BLL_users();
		
		
		for ($i=$start_index; $i<$end_index; $i++) {					
			if ($td_class=='odd') $td_class='even'; else $td_class='odd';
			?>			
			<tr>
				<td class="<?=$td_class?>"><?=$taxon_concepts[$i]->id?></td>
				<td class="<?=$td_class?>">
					<a href="<?=$eol_site_url?>/pages/<?=$taxon_concepts[$i]->id?>" target="_blank">
						<?=$taxon_concepts[$i]->scientificName?>
					</a>
				</td>
				<td class="<?=$td_class?>">
					<?
					if ($taxon_concepts[$i]->taxon_status != '') 
						echo ($taxon_concepts[$i]->taxon_status);
					else 
						echo ('Pending Translation');
					?>
				</td>				
				<td class="<?=$td_class?>"><center><?=$taxon_concepts[$i]->total_text_objects?></center></td>
				<td class="<?=$td_class?>"><center><?=$taxon_concepts[$i]->total_image_objects + $taxon_concepts[$i]->total_other_objects?></center></td>
				
				<td class="<?=$td_class?>"><center><?=BLL_users::get_user_name($taxon_concepts[$i]->translator_id)?></center></td>
				<td class="<?=$td_class?>"><center>
					<?
						if ($taxon_concepts[$i]->translator_id != 0) {
							if ($taxon_concepts[$i]->translator_assigned == 1) 
								echo "Assigned";
							else
								echo "Picked";
						}
					?>
				</center></td>
				<td class="<?=$td_class?>"><center>
					<?=BLL_users::get_user_name($taxon_concepts[$i]->linguistic_reviewer_id)?>					
				</center></td>
				<td class="<?=$td_class?>"><center>
					<?=BLL_users::get_user_name($taxon_concepts[$i]->scientific_reviewer_id)?>						
				</center></td>		
				<td class="<?=$td_class?>"><center>
					<?if ($taxon_concepts[$i]->taxon_status_id <5) { // before scientific revision?>
						<a href="reassign_species.php?id=<?=$taxon_concepts[$i]->id?>&selection_id=<?=$id?>&page=<?=$current_page?>">Reassign</a>
					<?}?>
				</center></td>		
			</tr>
		<?}?>
		
	</table>	
	</div>
	</center>	
	<?=Pagination::get_links($current_page, $items_per_page, count($taxon_concepts), $_SERVER['PHP_SELF'],'&id='.$id)?>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
    <div style="clear:both; height:100px;"></div>
<? include ('../master/footer.php')?>
</body>
</html>
