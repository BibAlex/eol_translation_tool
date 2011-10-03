<?php
include_once '../master/includes.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/Pagination.php';
include_once '../../../classes/SendMail.php';
include_once '../../../classes/Notifications.php';


validate_session('task_distribution');

if (!$_GET['selection_id'])
	header('Location: show_selections.php');

if (!is_numeric($_GET['selection_id']))
	header('Location: show_selections.php');

$selection_id = intval($_GET['selection_id']);

$selection = BLL_selection_batches::load_by_id($selection_id);

if (count($selection) == 0)
	header('Location: show_selections.php');

if (!$_GET['id'])
	header('Location: show_selections.php');

if (!is_numeric($_GET['id']))
	header('Location: show_selections.php');

$id = intval($_GET['id']);


$taxon_concept = BLL_taxon_concepts::get_by_id($id);

$page='';
if (isset($_GET["page"]))
	$page=$_GET["page"];

if (!isset($taxon_concept->id))
	header('Location: show_selections.php');

if ($taxon_concept->selection_id != $selection_id)
	header('Location: show_selections.php');

$old_translator_id = $taxon_concept->translator_id;
$old_scientific_reviewer_id = $taxon_concept->scientific_reviewer_id;
$old_linguistic_reviewer_id = $taxon_concept->linguistic_reviewer_id;
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reassign taxon</title>
    <? include ('../master/header.php');?>
    <script type="text/javascript">
		function validateForm(frm) {
			<?if ($taxon_concept->taxon_status_id <5) {?>
			if (frm.scientific_reviwer.value == 0) {
				alert('Missing scientific reviewer');
				frm.scientific_reviwer.focus();
				return false;
			}
			<?}?>
			<?if ($taxon_concept->taxon_status_id <4) {?>
			if (frm.linguistic_reviewer.value == 0) {
				alert('Missing linguistc reviewer');
				frm.linguistic_reviewer.focus();
				return false;
			}
			<?}?>			
		}
	</script>
</head>
<body>
<? include ('../master/top.php');?>

<?
if (isset($_POST["id"])) {
	
	if ($taxon_concept->taxon_status_id <3) {
		if ($taxon_concept->translator_id != intval($_POST["translator"])) {
			$taxon_concept->translator_id = $_POST["translator"];
			if (intval($_POST["translator"]) == 0) {
				$users = BLL_users::load_all();
				foreach ($users as $user) {
					if ($user->active == 1 && $user->translator==1 && $user->email != '') {
						$message = 'New species ready for translation <br><br>'.$taxon_concept->scientificName;
						SendMail::send_email($user->email, 'AEOL: New species ready for translation', 'New species ready for translation<br><br>'.$taxon_concept->scientificName);
					}		
				}		
			} else {
				$user = BLL_users::load_by_id(intval($_POST["translator"]));
				if ($user[0]->active == 1 && $user[0]->email != '') {
					$message = 'New species ready for translation <br><br>'.$taxon_concept->scientificName;
					SendMail::send_email($user[0]->email, 'AEOL: New species have been assigned', 'New species have been assigned<br><br>'.$taxon_concept->scientificName);
				}
			}
			
			BLL_taxon_concepts::taxon_concept_assign_log($id, 
														 intval($_POST["translator"]), 
														 2, 
														 $_SESSION['user_id']);
				
		}
		
	}
	
	if ($taxon_concept->taxon_status_id <4) {
		if ($taxon_concept->scientific_reviewer_id != intval($_POST["scientific_reviwer"])) {
			$taxon_concept->scientific_reviewer_id = $_POST["scientific_reviwer"];
			if ($taxon_concept->taxon_status_id == 3) {
				// Pending scientific Reviewer
				// Notify new user				
				$user = BLL_users::load_by_id(intval($_POST["scientific_reviwer"]));
				if ($user[0]->active == 1 && $user[0]->email != '') {
					$message = 'New species ready for revision <br><br>'.$taxon_concept->scientificName;
					SendMail::send_email($user[0]->email, 'AEOL: New species have been assigned for revision', 'New species have been assigned for revision<br><br>'.$taxon_concept->scientificName);
				}
				
			}	
			BLL_taxon_concepts::taxon_concept_assign_log($id, 
														 intval($_POST["scientific_reviwer"]), 
														 3, 
														 $_SESSION['user_id']);	
		}
		
	}
	
	if ($taxon_concept->taxon_status_id <5) {
		if ($taxon_concept->linguistic_reviewer_id != intval($_POST["linguistic_reviewer"])) {
			$taxon_concept->linguistic_reviewer_id = $_POST["linguistic_reviewer"];
			if ($taxon_concept->taxon_status_id == 4) {
				// Pending Linguistic Reviewer
				// Notify new user				
				$user = BLL_users::load_by_id($taxon_concept->linguistic_reviewer_id);
				if ($user[0]->active == 1 && $user[0]->email != '') {
					
					$message = 'New species ready for revision <br><br>'.$taxon_concept->scientificName;
					SendMail::send_email($user[0]->email, 'AEOL: New species have been assigned for revision', 'New species have been assigned for revision<br><br>'.$taxon_concept->scientificName);
				}
				
			}
			BLL_taxon_concepts::taxon_concept_assign_log($id, 
														 intval($_POST["linguistic_reviewer"]), 
														 4, 
														 $_SESSION['user_id']);	
		}
		
	}
	
	
	
	BLL_taxon_concepts::reassign_taxon($taxon_concept->id, 
							   $taxon_concept->translator_id,
							   $old_translator_id, 	
							   $taxon_concept->linguistic_reviewer_id,
							   $old_linguistic_reviewer_id,
							   $taxon_concept->scientific_reviewer_id,
							   $old_scientific_reviewer_id);
	?>
	<script type="text/javascript">
		alert("Changes have been saved");
		/*window.location="show_taxons.php?id=<?=$selection_id?>";*/
	</script>
	<?
	/*exit;*/
}
	
$users = new BLL_users();

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
		<h2>Reassign Species</h2>
	<form name="frm" method="post" action="reassign_species.php?id=<?=$id?>&selection_id=<?=$selection_id?>&page=<?=$page?>" onSubmit="return validateForm(this)">
		<input type="hidden" name="id" value="<?=$id?>" />
<div style="border:1px solid #C6C6C6; border-top:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">			
			<tr>
				<td colspan="2" class="table_head">
					<a href="<?=$eol_site_url?>/pages/<?=$taxon_concept->id?>" target="_blank">
						<?=$taxon_concept->scientificName?>
					</a>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Translator:</b> </td>
				<td class="even">					
					<?if ($taxon_concept->taxon_status_id >=3) {?>
						<?=BLL_users::get_user_name($taxon_concept->translator_id)?>
						<input type="hidden" name="translator" value="<?=$taxon_concept->translator_id?>" />
					<?}else{?>						
						<select name="translator" id="translator">
							<?=$users->get_translators_options($taxon_concept->translator_id)?>
						</select>
					<?}?>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Scientific Reviewer:</b> </td>
				<td class="even">					
					<?if ($taxon_concept->taxon_status_id >=4) {?>
						<?=BLL_users::get_user_name($taxon_concept->scientific_reviewer_id)?>
						<input type="hidden" name="scientific_reviwer" value="<?=$taxon_concept->scientific_reviewer_id?>" />
					<?}else{?>	
						<select name="scientific_reviwer" id="scientific_reviwer">
							<?=$users->get_scientific_reviewers_options($taxon_concept->scientific_reviewer_id)?>
						</select>
					<?}?>
				</td>
			</tr>
			<tr>
				<td class="odd" width="150"><b>Linguistic Reviewer:</b> </td>
				<td class="even">					
					<?if ($taxon_concept->taxon_status_id >=5) {?>
						<?=BLL_users::get_user_name($taxon_concept->scientific_reviewer_id)?>
						<input type="hidden" name="linguistic_reviewer" value="<?=$taxon_concept->linguistic_reviewer_id?>" />
					<?}else{?>	
						<select name="linguistic_reviewer" id="linguistic_reviewer">
							<?=$users->get_linguistic_reviewers_options($taxon_concept->linguistic_reviewer_id)?>
						</select>
					<?}?>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="table_head">
					<input type="submit" value="Submit" class="btn" />
				</td>
			</tr>
		</table>
	</div>
	</form>
	
	<script>
    ActiveLink('task');
    </script>
    </div></div>
<? include ('../master/footer.php')?>
</body>
</html>
