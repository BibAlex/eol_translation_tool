<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_priorities.php';
include_once '../../../classes/DAL/DAL_priorities.php';

validate_session('task_distribution');

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pending Tasks</title>
    <? include ('../master/header.php');?> 
</head>
<body>
<? include ('../master/top.php');?>

	<div style="clear:both; height:15px;"></div>
      <div class="form_table">	    
	    <div class="table_of_content">
	    	<h2>
	        	Pending Tasks
	        </h2>
		    <ul>
		        <?include_once 'links.php';?>       	        
		    </ul>
	    </div>    
		<div class="form">
		
			
	  

<? 
$total_items =  BLL_selection_batches::get_pending_batches_count();

//echo $total_items." pending batches found";

$current_page = Pagination::get_current_page($total_items, $items_per_page);

$selections = BLL_selection_batches::load_all($current_page, $items_per_page, 0); ?>	
<h2><?=count($selections)?> Pending tasks</h2>
<div style="border:1px solid #C6C6C6; border-top:none;">

<table width="100%" border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3">
	<!-- 
	<tr>
		<td rowspan="2" class="table_head" align="center">ID</td>
		<td rowspan="2" class="table_head" align="center">Selection Date</td>
		<td colspan="2" class="table_head" align="center">Translator</td>
		<td colspan="2" class="table_head" align="center">Linguistic Reviewer</td>
		<td colspan="2" class="table_head" align="center">Scientific Reviewer</td>
		<td rowspan="2" class="table_head" align="center"></td>
	</tr>	
	<tr>
		<td class="table_head"><center>Assigned</center></td>
		<td class="table_head"><center>Unassigned</center></td>
		<td class="table_head"><center>Assigned</center></td>
		<td class="table_head"><center>Unassigned</center></td>
		<td class="table_head"><center>Assigned</center></td>
		<td class="table_head"><center>Unassigned</center></td>
	</tr>
	 -->
	 <tr>
		<td class="table_head" align="center">ID</td>
		<td class="table_head" align="center">Selection Date</td>
		<td class="table_head" align="center">Priority</td>
		<td class="table_head" align="center">Selected by</td>
		<td class="table_head" align="center">Species Count</td>
		<td class="table_head" align="center"></td>
	</tr>	
	<? 
	$td_class='odd';
	foreach ($selections as $selection) {
		$id = $selection->id;
		if ($td_class=='odd') $td_class='even'; else $td_class='odd';
		?>
		<tr>
			<td style="text-align:center;" class="<?=$td_class?>"><?=$selection->id?></td>
			<td style="text-align:center;" class="<?=$td_class?>"><?=date("d M Y H:i", strtotime($selection->date_selected))?></td>
			<td style="text-align:center;" class="<?=$td_class?>">
				<?=BLL_priorities::find_label($selection->priority_id)?>
			</td>
			<td class="<?=$td_class?>"><center><?=BLL_users::get_user_name($selection->user_id)?></center></td>
			<td class="<?=$td_class?>"><center><?=BLL_selection_batches::get_species_count($id)?></center></td>
			<td class="<?=$td_class?>"><center><a href="show_taxons.php?id=<?=$id?>">Show Species</a></center></td>
		</tr>
	<?}?>	
</table>	
	<?=Pagination::get_links($current_page, $items_per_page, $total_items, $_SERVER['PHP_SELF'],'')?>		
	

</div>
</div></div>
	<script>
    ActiveLink('task');
    </script>		
<? include ('../master/footer.php');?>     
</body>
</html>