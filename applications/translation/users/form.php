<?php 
include ('../master/includes.php');
//validate_session('users');

include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_countries.php';
include_once '../../../classes/DAL/DAL_countries.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

$id=0;
$message='';

if (isset($_GET["id"])) {
	if (is_numeric($_GET['id'])) {
		$id = intval($_GET['id']);
	}	
}

$user = new DAL_users();

if ($id!=0) {
	$temp = BLL_users::load_by_id($id);
	$user = $temp[0];
	if (!isset($user->id)) {
		?>
		<script type="text/javascript">
			alert('user does not exist!');
			window.location='list_users.php';
		</script>
		<?
		break;
	}
}

if (isset($_POST["name"])) {
	if (trim(strtolower($_POST["email"])) == '') {
		$message .= '<br>Invalid email';		
	}
	if (BLL_users::email_exists($id, trim(strtolower($_POST["email"])))) {
		$message = 'Email already exists';		
	}	
	
	if ($id == 0) {
		if (trim(strtolower($_POST["username"])) == '') {
			$message .= '<br>Invalid username';		
		}
		if (BLL_users::username_exists($id, trim(strtolower($_POST["username"])))) {
			$message .= '<br>Username already taken';		
		}	
		
		if (trim(strtolower($_POST["password"])) == '') {
			$message .= '<br>Invalid password';		
		}	
	}
	
	
	if ($id!=0) {
		if ($message == '') {				
			
			
			if ($user->translator == 1 && $_POST["translator"]==0) {
				$pending_translation = BLL_taxon_concepts::Select_pending_taxon_concepts_ForTranslation_ByTranslator('slave',$id,'','','2',1,100000);  
				echo(count($pending_translation));
				if (count($pending_translation)>0) {
					$message .= 'One or more species are assigned/picked to this user for translation, please reassign and click save<br>';
					if ($_SESSION['task_distributor'] == 1) {
						foreach($pending_translation as $taxon_concept) {
							$message .= '<li><a href="../task_distribution/reassign_species.php?id='.$taxon_concept->id.'&selection_id='.$taxon_concept->selection_id.'" target="_blank">'.$taxon_concept->scientificName.'</a></li>';
						}	
						$message .= '<br/>';
					}
				}
				
			
			}
			
			if ($user->linguistic_reviewer == 1 && $_POST["linguistic_reviewer"]==0) {
				$pending_ling_review = BLL_taxon_concepts::Select_pending_taxon_concepts_ForLingReview_ByUser('slave',$id,0,'','2',1,100000);  
				
				if (count($pending_ling_review)>0) {
					$message .= 'One or more species are assigned to this user for linguistic reviewing, please reassign and click save<br>';
					if ($_SESSION['task_distributor'] == 1) {
						foreach($pending_ling_review as $taxon_concept) {
							$message .= '<li><a href="../task_distribution/reassign_species.php?id='.$taxon_concept->id.'&selection_id='.$taxon_concept->selection_id.'" target="_blank">'.$taxon_concept->scientificName.'</a></li>';
						}	
						$message .= '<br/>';
					}
				}
				
			
			}
			
			if ($user->scientific_reviewer == 1 && $_POST["scientific_reviewer"]==0) {
				$pending_scientific_review = BLL_taxon_concepts::Select_pending_taxon_concepts_ForScienReview_ByUser('slave',$id,0,'','2',1,100000);  
				
				if (count($pending_scientific_review)>0) {
					$message .= 'One or more species are assigned to this user for scientific reviewing, please reassign and click save<br>';
					if ($_SESSION['task_distributor'] == 1) {
						foreach($pending_scientific_review as $taxon_concept) {
							$message .= '<li><a href="../task_distribution/reassign_species.php?id='.$taxon_concept->id.'&selection_id='.$taxon_concept->selection_id.'" target="_blank">'.$taxon_concept->scientificName.'</a></li>';
						}	
						$message .= '<br/>';
					}
				}
				
			
			}		
		}
	}
	
	if ($message == '')	{
		if ($user->id ==0) {
			$user->username = trim(strtolower($_POST["username"]));
			$user->password = trim(strtolower($_POST["password"]));
		}
		$user->name = trim($_POST["name"]);
		$user->email = trim(strtolower($_POST["email"]));		
		$user->active = $_POST["active"];
		$user->country_id = $_POST["country_id"];
		$user->super_admin=$_POST["super_admin"];
		$user->selector=$_POST["selector"];  
		$user->task_distributor=$_POST["task_distributor"];	
		$user->translator=$_POST["translator"];
		$user->linguistic_reviewer=$_POST["linguistic_reviewer"];
		$user->scientific_reviewer=$_POST["scientific_reviewer"];
		$user->final_editor=$_POST["final_editor"];				
		BLL_users::save($user);		
		?>
		<script>
			alert('Changes have been saved');
			window.location='list_users.php';
		</script>
		<?
		break;
		
	}
	
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Users</title>
    <? include ('../master/header.php');?> 
</head>
<body>
<? include ('../master/top.php');?>	
<fieldset>
   <legend>Users - <?if ($user->id > 0) echo("Edit User"); else echo("Add User");?>
		
		</legend>		
	
	<form name=frm method=post action="form.php?id=<?=$id?>" onSubmit="return validateForm(this)">
	<div style="clear:both;"></div>
	<div style="width:500px;">
	<span style="color:red; font-weight:normal; font-size:12px; text-transform:none;"><?=$message?></span>
	<br/><br/>
		          <h2>Profile </h2>
	<div style="border:1px solid #C6C6C6; border-top:none; border-bottom:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="8" width="100%">			

			<tr>
				<td style="text-align:right;" class="odd" width="150">Name: </td>
				<td class="even">
					<input class="input" type="text" name="name" value="<?=$user->name?>" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Email: </td>
				<td class="even">
					<input class="input" type="text" name="email" value="<?=$user->email?>" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Country: </td>
				<td class="even">
					<select name="country_id">
						<?
						$countries = BLL_countries::load_all();						
						
						foreach ($countries as $country) {
							echo "<option value=\"".$country->id."\" ";
							if ($user->country_id == $country->id) echo ("selected");
							echo ">".$country->name."</option>";
						}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Status</td>
				<td class="even">
					<input type="radio" name="active" value="1" <?if ($user->active == 1) echo "checked"?> /> Active
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="active" value="0" <?if ($user->active == 0) echo "checked"?> /> Inactive					
				</td>
			</tr>
			
			<? if ($user->id==0) {?>
			</table>
			<h2>Login Info</h2>
			<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="8" width="100%">
			<tr>
				<td style="text-align:right;" class="odd" width="150">Username: </td>
				<td class="even">
					<input class="input" type="text" name="username" value="<?=$user->username?>" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Password: </td>
				<td class="even">
					<input class="input" type="password" name="password" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Confirm Password: </td>
				<td class="even">
					<input class="input" type="password" name="cpassword" maxlength="100" />
				</td>
			</tr>			
			<?}?>
			</table>
			</div>
			<h2>Privileges</h2>
			<div style="border:1px solid #C6C6C6; border-top:none;">
			<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="8" width="100%">
			<tr>
				<td style="text-align:right;" class="odd" width="150">Super admin</td>
				<td class="even">
					<input type="radio" name="super_admin" value="1" <?if ($user->super_admin == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="super_admin" value="0" <?if ($user->super_admin == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Selector</td>
				<td class="even">
					<input type="radio" name="selector" value="1" <?if ($user->selector == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="selector" value="0" <?if ($user->selector == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Task distributor</td>
				<td class="even">
					<input type="radio" name="task_distributor" value="1" <?if ($user->task_distributor == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="task_distributor" value="0" <?if ($user->task_distributor == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Translator</td>
				<td class="even">
					<input type="radio" name="translator" value="1" <?if ($user->translator == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="translator" value="0" <?if ($user->translator == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Lingustic reviewer</td>
				<td class="even">
					<input type="radio" name="linguistic_reviewer" value="1" <?if ($user->linguistic_reviewer == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="linguistic_reviewer" value="0" <?if ($user->linguistic_reviewer == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Scientific reviewer</td>
				<td class="even">
					<input type="radio" name="scientific_reviewer" value="1" <?if ($user->scientific_reviewer == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="scientific_reviewer" value="0" <?if ($user->scientific_reviewer == 0) echo "checked"?> /> No
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" class="odd">Final editor</td>
				<td class="even">
					<input type="radio" name="final_editor" value="1" <?if ($user->final_editor == 1) echo "checked"?> /> Yes
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="final_editor" value="0" <?if ($user->final_editor == 0) echo "checked"?> /> No
				</td>
			</tr>
			
		</table>
		
	</div>
	</div>
	<input style="margin-left:180px;" type="submit" value="Save" class="btn" />
	</form>	
	</fieldset>
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

	function isValidEmail(s) {
		var i = 1;
	    var sLength = s.length;

	    while ((i < sLength) && (s.charAt(i) != "@"))
	    { i++
	    }

	    if ((i >= sLength) || (s.charAt(i) != "@")) return false;
	    else i += 2;

	    while ((i < sLength) && (s.charAt(i) != "."))
	    { i++
	    }

	    if ((i >= sLength - 1) || (s.charAt(i) != ".")) return false;
	    else return true;

	}

	function validateForm(frm) {
		if (emptyField(frm.name)) {
			alert("Enter name");
			frm.name.focus();
			return false;
		}

		if (!isValidEmail(frm.email.value)) {
			alert("Invalid email address");
			frm.email.focus();
			return false;
		}
		<?if ($user->id==0) {?>
			if (emptyField(frm.username)) {
				alert("Enter username");
				frm.username.focus();
				return false;
			}
	
			if (frm.username.value.length < 8) {
				alert("Username length must be larger than or equal 8");
				frm.username.focus;
				return false;
			}
	
			if (emptyField(frm.password)) {
				alert("Enter password");
				frm.password.focus();
				return false;
			}
	
			if (frm.password.value.length < 8) {
				alert("Password length must be larger than or equal 8");
				frm.password.focus;
				return false;
			}
			if (frm.password.value != frm.cpassword.value) {
				alert("Two password must be identical");
				frm.cpassword.focus();
				return false;
			}		
		<?}?>
		
		return true;
	}
	</script>
	<script>
    ActiveLink('user');
    </script>	
<? include ('../master/footer.php');?>
</body>
</html>