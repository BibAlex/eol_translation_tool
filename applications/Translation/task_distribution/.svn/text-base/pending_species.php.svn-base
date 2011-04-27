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

$sort_by = '';

if (isset($_GET["sort"])) {
	if (strtolower($_GET['sort']) == 'id')
		$sort_by = 'id';
	elseif (strtolower($_GET['sort']) == 'date')
		$sort_by = 'date';
	elseif (strtolower($_GET['sort']) == 'user')
		$sort_by = 'user';
}

$pending_count = BLL_taxon_concepts::get_pending_distribution_count();

$current_page = Pagination::get_current_page($pending_count, $items_per_page);

$taxon_concepts = BLL_taxon_concepts::get_pending_distribution($current_page, $items_per_page, $sort_by);
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
			<h2>Pending Species (<?=$pending_count?>)</h2>
		    <div style="border:1px solid #C6C6C6; border-top:none;">
	 	</div>
		<div style="border:1px solid #C6C6C6;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">	
			<tr>
				<td class="table_head"><center>
				<?if ($sort_by == 'id') {?>
					ID
				<?} else {?>
					<a href="<?=$_SERVER['PHP_SELF'].'?sort=id'?>">ID</a>
				<?}?></center></td>
				<td class="table_head"><center>
				<?if ($sort_by == '') {?>
					Species Name
				<?} else {?>
					<a href="<?=$_SERVER['PHP_SELF'].'?sort=name'?>">Species Name</a>
				<?}?></center></td>			
				<td class="table_head"><center>
				<?if ($sort_by == 'date') {?>
					Date Selected
				<?} else {?>
					<a href="<?=$_SERVER['PHP_SELF'].'?sort=date'?>">Date Selected</a>
				<?}?></center></td>
				<td class="table_head"><center>
				<?if ($sort_by == 'user') {?>
					Selected By
				<?} else {?>
					<a href="<?=$_SERVER['PHP_SELF'].'?sort=user'?>">Selected By</a>
				<?}?></center></td>
				<td class="table_head"><center>Text</center></td>
				<td class="table_head"><center>Images</center></td>			
				<td class="table_head"><center>Assign</center></td>
			</tr>
			<? 
			$td_class='odd';
			foreach ($taxon_concepts as $taxon_concept) {						
				$selection_batch = BLL_selection_batches::load_by_id($taxon_concept->selection_id);			
				
				if ($td_class=='odd') $td_class='even'; else $td_class='odd';
				?>			
				<tr>
					<td class="<?=$td_class?>">
						<?=$taxon_concept->id?>
					</td>	
					<td class="<?=$td_class?>">
						<a href="<?=$eol_site_url?>/pages/<?=$taxon_concept->id?>" target="_blank">
							<?=$taxon_concept->scientificName?>
						</a>
					</td>				
					<td class="<?=$td_class?>"><center><?=$taxon_concept->getSelection_date()?></center></td>
					<td class="<?=$td_class?>"><center><?=$taxon_concept->selected_by?></center></td>
					<td class="<?=$td_class?>"><center><?=BLL_taxon_concepts::get_text_count($taxon_concept->id)?></center></td>
					<td class="<?=$td_class?>"><center><?=BLL_taxon_concepts::get_images_count($taxon_concept->id)?></center></td>
					<td class="<?=$td_class?>"><center><a href="assign_species.php?id=<?=$taxon_concept->id?>&selection_id=<?=$taxon_concept->selection_id?>&page=<?=$current_page?>">Assign</a></center></td>
								
				</tr>
			<?}?>
			
		</table>	
		<div id="ie6SelectTooltip" style="display:none;position:absolute;padding:1px;border:1px solid #333333;;background-color:#fffedf;font-size:smaller;"></div>
		</div>	
		
		<div class="pages"> 
            <?=Pagination::get_links($current_page, $items_per_page, $pending_count, $_SERVER['PHP_SELF'],'&sort='.$sort_by);?> 
        </div>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
<? include ('../master/footer.php')?>
</body>
</html>
