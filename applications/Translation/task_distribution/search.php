<?php

include_once '../master/includes.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';


validate_session('task_distribution');

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Task Distribution - Search</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
    function emptyField(textObj)
	{
		if (textObj.value.length == 0) return true;
		for (var i=0; i<textObj.value.length; ++i)  {
			var ch = textObj.value.charAt(i);
			if (ch != ' ' && ch != '\t') return false;
		}
		return true;
	}
	
   	function validateForm(frm) {
       	if (emptyField(frm.keyword)) {
           	alert("Please enter species name");
           	frm.keyword.focus();
           	return false;
       	}
       	return true;
    }
    </script> 
</head>
<body>
<? 
include ('../master/top.php');

$keyword='';

if (isset($_POST['keyword'])) {
	$keyword = trim($_POST['keyword']);
		
	$taxon_concepts = BLL_taxon_concepts::taxon_search($keyword);	
}

?>

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
			<h2>Search for species</h2>
			<form name="frm" method="post" action="search.php" onSubmit="return validateForm(this)">
			<div style="border:1px solid #C6C6C6; border-top:none;">
				<table width="100%" border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3">
					<tr>
						<td class="even" width="100">Species Name</td>
						<td class="even"><input style="margin-left:5px;width:200px;" type="text" name="keyword" value="<?=$keyword?>" /></td>
					</tr>	
					<tr>
						<td colspan="2" class="odd">
							<center><input type="submit" value="Search" /></center>
						</td>
					</tr>
	 			</table>
	 			<?if (isset($_POST['keyword'])) {?>
	 			<br/>
	 			<table border="0" style="border-collapse:collapse; text-align:center;" cellspacing="0" cellpadding="3">	
					<tr>
						<td colspan="8" class="table_head"><center><?=count($taxon_concepts)?> result(s) found</center></td>
					</tr>
					<tr>
						<td class="table_head"><center>ID</center></td>
						<td class="table_head" width="300"><center>Species Name</center></td>			
						<td class="table_head"><center>Status</center></td>
						<td class="table_head" colspan="2"><center>Translator</center></td>
						<td class="table_head"><center>Linguistic Reviewer</center></td>
						<td class="table_head"><center>Scientific Reviewer</center></td>
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
							<?=BLL_users::get_user_name($taxon_concepts[$i]->linguistic_reviewer_id)?>					
						</center></td>
						<td class="<?=$td_class?>"><center>
							<?=BLL_users::get_user_name($taxon_concepts[$i]->scientific_reviewer_id)?>						
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
				<?}?>
	 		</div>
	 		</form>
		</div>
	  </div>
	<script>
    ActiveLink('task');
    </script>		
<? include ('../master/footer.php');?>     
</body>
</html>