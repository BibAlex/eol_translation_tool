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

$items_per_page = $GLOBALS['items_per_page'];
$keyword = '';

$pending_count = BLL_taxon_concepts::get_finished_distribution_count($keyword);

$current_page = Pagination::get_current_page($pending_count, $items_per_page);

$taxon_concepts = BLL_taxon_concepts::get_finished_distribution($keyword, $current_page, $items_per_page);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Assign tasks</title>
    <? include ('../master/header.php');?>   
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
			<h2>Distributed Species (<?=$pending_count?>)</h2>
		    <div style="border:1px solid #C6C6C6; border-top:none;">
	 	</div>
		<div style="border:1px solid #C6C6C6;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">	
			<tr>
				<td class="table_head"><center>ID</center></td>
				<td class="table_head" width="300"><center>Species Name</center></td>			
				<td class="table_head"><center>Priority</center></td>
				<td class="table_head"><center>Status</center></td>
				<td class="table_head" colspan="2"><center>Translator</center></td>				
				<td class="table_head"><center>Scientific Reviewer</center></td>
				<td class="table_head"><center>Linguistic Reviewer</center></td>
				<td class="table_head" colspan="2"></td>
			</tr>
			<? 
			$td_class='odd';
			$users = new BLL_users();
					
				
				for ($i=0; $i<count($taxon_concepts); $i++) {					
					if ($td_class=='odd') $td_class='even'; else $td_class='odd';
					$selections = BLL_selection_batches::load_by_id($taxon_concepts[$i]->selection_id);
					$selection = $selections[0];
					?>
				<tr>
					<td class="<?=$td_class?>"><?=$taxon_concepts[$i]->id?></td>
					<td class="<?=$td_class?>">
						<a href="<?=$eol_site_url?>/pages/<?=$taxon_concepts[$i]->id?>" target="_blank">
							<?=$taxon_concepts[$i]->scientificName?>
						</a>
					</td>
					<td class="<?=$td_class?>">
						<?=$taxon_concepts[$i]->priority?>
					</td>				
					<td class="<?=$td_class?>">
						<?=$taxon_concepts[$i]->taxon_status?>
					</td>				
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
						<?=BLL_users::get_user_name($taxon_concepts[$i]->scientific_reviewer_id)?>						
					</center></td>		
					<td class="<?=$td_class?>"><center>
						<?=BLL_users::get_user_name($taxon_concepts[$i]->linguistic_reviewer_id)?>					
					</center></td>
					<td class="<?=$td_class?>"><center>
						<?if ($taxon_concepts[$i]->taxon_status_id <5 && $taxon_concepts[$i]->taxon_status_id>1) { // before scientific revision?>
							<a target="_blank" href="reassign_species.php?id=<?=$taxon_concepts[$i]->id?>&selection_id=<?=$taxon_concepts[$i]->selection_id?>">Reassign</a>
						<?}
						
						if ($taxon_concepts[$i]->taxon_status_id <=1) { ?>
						<a target="_blank" href="assign_species.php?id=<?=$taxon_concepts[$i]->id?>&selection_id=<?=$taxon_concepts[$i]->selection_id?>">Assign</a>
						<?}?>
					</center></td>		
				</tr>
				<?}?>
			
		</table>	
		<div id="ie6SelectTooltip" style="display:none;position:absolute;padding:1px;border:1px solid #333333;;background-color:#fffedf;font-size:smaller;"></div>
		</div>	
		
		<div class="pages"> 
            <?=Pagination::get_links($current_page, $items_per_page, $pending_count, $_SERVER['PHP_SELF'],'');?> 
        </div>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
<? include ('../master/footer.php')?>
</body>
</html>
