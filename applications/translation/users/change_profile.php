<?php 
include ('../master/includes.php');
validate_session('');

include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_countries.php';
include_once '../../../classes/DAL/DAL_countries.php';

$id=$_SESSION["user_id"];
$message='';

$user = new DAL_users();

$temp = BLL_users::load_by_id($id);
$user = $temp[0];
if (!isset($user->id)) {
	?>
	<script type="text/javascript">
		alert('user does not exist!');
		window.location='home.php';
	</script>
	<?
	break;
}


if (isset($_POST["name"])) {
	if (trim(strtolower($_POST["email"])) == '') {
		$message .= '<br>Invalid email';		
	}
	if (BLL_users::email_exists($id, trim(strtolower($_POST["email"])))) {
		$message = 'Email already exists';		
	}	
	
	$user->name = trim($_POST["name"]);
	$_SESSION['name'] = $user->name;
	$user->email = trim(strtolower($_POST["email"]));	
	$user->country_id = $_POST["country_id"];		
	if ($user->id ==0) {
		$user->username = trim(strtolower($_POST["username"]));
		$user->password = trim(strtolower($_POST["password"]));
	}
	
	if ($message == '') {	
		BLL_users::save($user);		
		$message = '<script>alert("Changes have been saved");</script>';				
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


		<div style="clear:both;"><br/><br/></div>
		<?=$message?>		

	
	<form name=frm method=post action="change_profile.php" onSubmit="return validateForm(this)">
		<center>
		<div style="width:470px;">
		          <h2 style="text-align:left;">Profile</h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">			
			<tr>
				<td class="odd" width="120" style="text-align:right;">Name: </td>
				<td class="even">
					<input style="width:225px;" type="text" name="name" value="<?=$user->name?>" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td class="odd" style="text-align:right;">Email: </td>
				<td class="even">
					<input style="width:225px;" type="text" name="email" value="<?=$user->email?>" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td class="odd" style="text-align:right;">Country: </td>
				<td class="even">
					<select style="width:230px;" name="country_id">
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
				<td colspan="2" class="table_head" style="border:none; padding-left:180px;">
					<input type="submit" value="Save" class="btn" style="margin:5px;"  />
				</td>
			</tr>
		</table>
		</div>
	</div>
	</center>
	</form>	
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
		return true;
	}
	</script>
	
<? include ('../master/footer.php');?>
</body>
</html>