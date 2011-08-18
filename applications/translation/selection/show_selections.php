<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_priorities.php';
include_once '../../../classes/DAL/DAL_priorities.php';


validate_session('selector');

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Old Selections</title>
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
		        <li class="toc"><a href="select.php">New Selection</a></li>
		        <li class="toc" >
		        	<a href="show_selections.php" style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;">Old Selections</a>
		        </li>		        	        
		    </ul>
	    </div>    
		<div class="form"> 

<? 
$total_items =  BLL_selection_batches::get_batches_count_by_user(BLL_users::get_user_id());

//echo $total_items." pending batches found";

$current_page = Pagination::get_current_page($total_items, $items_per_page);

$selections = BLL_selection_batches::load_all_by_user($current_page, $items_per_page, BLL_users::get_user_id()); ?>	

<h2><?=count($selections)?> Old Selections</h2>
<div style="border:1px solid #C6C6C6;">
<table border="0" style="text-align:center; border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">
	<!-- 
	<tr>
		<td rowspan="2" class="table_head" style="border-bottom:1px solid #C6C6C6;">ID</td>
		<td rowspan="2" class="table_head" style="border-bottom:1px solid #C6C6C6;">Selection Date</td>
		<td rowspan="2" class="table_head" style="border-bottom:1px solid #C6C6C6;">Selected by</td>
		<td colspan="2" class="table_head">Translator</td>
		<td colspan="2" class="table_head">Linguistic Reviewer</td>
		<td colspan="2" class="table_head">Scientific Reviewer</td>
		<td rowspan="2" class="table_head" style="border-bottom:1px solid #C6C6C6;"></td>
		<td rowspan="2" class="table_head" style="border-bottom:1px solid #C6C6C6;"></td>
	</tr>	
	<tr>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Assigned</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Unassigned</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Assigned</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Unassigned</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Assigned</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Unassigned</td>
	</tr>
	 -->
	 <tr>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">ID</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Selection Date</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Selected by</td>		
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;">Priority</td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;"></td>
		<td class="table_head" style="border-bottom:1px solid #C6C6C6;"></td>
	</tr>	
	<? 
	$td_class='odd';
	foreach ($selections as $selection) {
		$id = $selection->id;
		if ($td_class=='odd') $td_class='even'; else $td_class='odd';
		?>
		<tr>
			<td class="<?=$td_class?>"><center><?=$selection->id?></center></td>
			<td class="<?=$td_class?>"><center><?=date("d M Y H:i", strtotime($selection->date_selected))?></center></td>
			<td class="<?=$td_class?>"><center><?=BLL_users::get_user_name($selection->user_id)?></center></td>
			<td class="<?=$td_class?>"><center><?=BLL_priorities::find_label($selection->priority_id)?></center></td>			
			<td class="<?=$td_class?>">
				<center><a href="show_taxons.php?id=<?=$id?>">Show taxons</a></center>
			</td>			
			<td class="<?=$td_class?>">				
				<?if ($selection->total_taxon_count == 0) {?>
					<center><a href="delete_batch.php?id=<?=$id?>">Delete</a></center>
				<?}?>
			</td>
			
		</tr>
	<?}?>	
</table>	
	
</div>	
	
	<?=Pagination::get_links($current_page, $items_per_page, $total_items, $_SERVER['PHP_SELF'],'')?>		
	

</div>
</div>

	<script>
    ActiveLink('select');
    </script>		
<? include ('../master/footer.php');?>     
</body>
</html>