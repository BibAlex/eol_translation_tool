<?php
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';


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
    <title>Assign tasks</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
    	function validateForm(frm) {
        	var species_count = parseInt(frm.species_count.value);
        	     	
			for (var i=0; i<species_count; i++) {
				if (document.getElementById('linguistic_reviewer'+i).value ==0) {
					alert('Missing linguistc reviewer');
					document.getElementById('linguistic_reviewer'+i).focus();
					return false;
				}

				if (document.getElementById('scientific_reviewer'+i).value ==0) {
					alert('Missing scientific reviewer');
					document.getElementById('scientific_reviewer'+i).focus();
					return false;
				}
			}        	
			return confirm('Are you sure you want to proceed?');
    	}
    	/*
    	function showIE6Tooltip(e){
            if(!e){var e = window.event;}
            var obj = e.srcElement;
            var objHeight = obj.offsetHeight;
            var optionCount = obj.options.length;
            var eX = e.offsetX;
            var eY = e.offsetY;

            //vertical position within select will roughly give the moused over option...
            var hoverOptionIndex = Math.floor(eY / (objHeight / optionCount));

            var tooltip = document.getElementById('ie6SelectTooltip');
            tooltip.innerHTML = obj.options[hoverOptionIndex].title;
            tooltip.style.display = 'block';
        }
        function hideIE6Tooltip(e){
            var tooltip = document.getElementById('ie6SelectTooltip');
            tooltip.innerHTML = '';
            tooltip.style.display = 'none';
        }
        */
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
	
	
	<form name="frm" method="post" action="save_batch.php" onsubmit="return validateForm(this)">
	<input type="hidden" name="selection_id" value="<?=$id?>" />
	<?
	$hierarchy_id = $selection[0]->hierarchy_id;	
	
	$taxon_concepts = BLL_selection_batches::get_selected_taxons($id) ;	
	
	$taxon_ids = '';
	
	foreach ($taxon_concepts as $taxon_concept) {
		if ($taxon_ids != '') $taxon_ids .= ',';
		$taxon_ids .= $taxon_concept->id;	
	}	
	$master_taxon_concepts = BLL_taxon_concepts::get_taxons_list($taxon_ids, $hierarchy_id);		
	?>
	<input type="hidden" name="hierarchy_id" value="<?=$hierarchy_id?>" />
		          <h2>Assign Tasks</h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		            
	<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">	
		<tr>
			<td class="odd"><b>ID:</b></td>
			<td class="even"><?=$selection[0]->id?></td>
		</tr>
		<tr>
			<td class="odd" width="100"><b>Species Count:</b></td>
			<td class="even"><?=count($master_taxon_concepts)?></td>
		</tr>
		<tr>
			<td class="odd"><b>Selected By:</b></td>
			<td class="even"><?=BLL_users::get_user_name($selection[0]->user_id)?></td>
		</tr>
		<tr>
			<td class="odd"><b>Comments:</b></td>
			<td class="even"><?=$selection[0]->comments ?></td>
		</tr>
		<tr>
			<td class="odd"><b>Date:</b></td>
			<td class="even"><?=date("d M Y H:i", strtotime($selection[0]->date_selected))?></td>
		</tr>
	</table>
	 </div>
	<input type="hidden" name="species_count" value="<?=count($master_taxon_concepts)?>" />
	<div style="clear:both;"><br/><br/></div>
	<div style="border:1px solid #C6C6C6;">
	<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">	
		<tr>
			<td class="table_head"><center>ID</center></td>
			<td class="table_head"><center>Species Name</center></td>			
			<td class="table_head"><center>Text</center></td>
			<td class="table_head"><center>Images/<br/>Videos</center></td>
			
			<td class="table_head" style="width:50px;"><center>Translator</center></td>
			<td class="table_head"><center>Linguistic Reviewer</center></td>
			<td class="table_head"><center>Scientific Reviewer</center></td>
		</tr>
		<? 
		$td_class='odd';
		$users = new BLL_users();
		for ($i=0; $i<count($master_taxon_concepts); $i++) {			
			$record_index = get_record_index($taxon_concepts, $master_taxon_concepts[$i]->id);
			if ($td_class=='odd') $td_class='even'; else $td_class='odd';
			?>
			<input type="hidden" name="taxon_concept_id<?=$i?>" value="<?=$master_taxon_concepts[$i]->id?>" />
			<tr>
				<td class="<?=$td_class?>">
					<?=$master_taxon_concepts[$i]->id?>
				</td>	
				<td class="<?=$td_class?>">
					<a href="<?=$eol_site_url?>/pages/<?=$master_taxon_concepts[$i]->id?>" target="_blank">
						<?=$master_taxon_concepts[$i]->scientificName?>
					</a>
				</td>				
				<td class="<?=$td_class?>"><center><?=$master_taxon_concepts[$i]->total_text_objects?></center></td>
				<td class="<?=$td_class?>"><center><?=$master_taxon_concepts[$i]->total_image_objects+$master_taxon_concepts[$i]->total_other_objects?></center></td>
				
				<td class="<?=$td_class?>">
				<center>
					<select  style="width:100px;" name="translator<?=$i?>" id="translator<?=$i?>">
						<?=$users->get_translators_options($taxon_concepts[$i]->translator_id)?>
					</select>
					</center>
				</td>
				<td class="<?=$td_class?>">
				<center>
					<select  style="width:100px;" name="linguistic_reviewer<?=$i?>" id="linguistic_reviewer<?=$i?>">
						<?=$users->get_linguistic_reviewers_options($taxon_concepts[$i]->linguistic_reviewer_id)?>
					</select>
					</center>
				</td>
				<td class="<?=$td_class?>">
				<center>
					<select  style="width:125px;" name="scientific_reviewer<?=$i?>" id="scientific_reviewer<?=$i?>">
						<?=$users->get_scientific_reviewers_options($taxon_concepts[$i]->scientific_reviewer_id)?>
					</select>
					</center>	
				</td>				
			</tr>
		<?}?>	
		<tr>
			<td class="table_head" colspan="8" align="center">
				<center><input type="submit" class="btn" value="Save & Finish" style="text-align: center" /></center>
			</td>
		</tr>
	</table>	
<div id="ie6SelectTooltip" style="display:none;position:absolute;padding:1px;border:1px solid #333333;;background-color:#fffedf;font-size:smaller;"></div>
	</div>
	</form>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
<? include ('../master/footer.php')?>
</body>
</html>
