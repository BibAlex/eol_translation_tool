<?php 
include_once ('../master/includes.php');
include_once ('../../../classes/BLL/BLL_users.php');
include_once ('../../../classes/DAL/DAL_users.php');


validate_session('');

$message='';

if (isset($_POST["old_password"])) {
	$temp = BLL_users::load_by_id($_SESSION['user_id']);
	$user = $temp[0];
	
	if ($user->password == trim(strtolower($_POST["old_password"]))) {
		$user->password = trim(strtolower($_POST["password"]));		
		BLL_users::save($user);
		$message = '<script>alert("Your password has been changed successfully");</script>';		
	}
	else {
		$message = '<script>alert("Invalid old password!");</script>';		
	} 
	
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Password</title>
    <? include ('../master/header.php');?> 
</head>
<body>
<? include ('../master/top.php');?>	

	
		<div style="clear:both;"><br/><br/></div>
		
		<?=$message?>
	
	<form name=frm method=post action="change_password.php" onsubmit="return validateForm(this)">
		<center>
		<div style="width:470px;">
		          <h2 style="text-align:left;">Change Password</h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">			
			<tr>
				<td class="odd"  width="150">Old Password: </td>
				<td class="even">
					<input type="password" name="old_password" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td class="odd">New Password: </td>
				<td class="even">
					<input type="password" name="password" maxlength="100" />
				</td>
			</tr>
			<tr>
				<td class="odd">Confirm Password: </td>
				<td class="even">
					<input type="password" name="cpassword" maxlength="100" />
				</td>
			</tr>			
			<tr>
				<td colspan="2" class="table_head" style="border:none; padding-left:180px; ">
					<input type="submit" value="Change" class="btn" style="margin:5px;" />
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

	function validateForm(frm) {
		if (emptyField(frm.old_password)) {
			alert("Enter old password");
			frm.old_password.focus();
			return false;
		}
				
		if (emptyField(frm.password)) {
			alert("Enter new password");
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
		
		
		return true;
	}
	</script>

<? include ('../master/footer.php');?>
</body>
</html>