<?php include ('../master/includes.php');
if (isset($_SESSION['user_id']))
	header('location:../users/home.php');	
	
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';



$username = '';
$password = '';

$error_message = '';

if(isset($_POST['username']))
{
	$username = $_POST['username'];
	$password = $_POST['password'];
	
    $user = BLL_users::validate_user($username, $password);
    
    if (!isset($user->id)) {    	
    	$error_message = 'Error: Invalid username and password';
    } else {    	    	
    	$_SESSION['user_id'] = $user->id;
    	$_SESSION['name'] = $user->name;
	$_SESSION['email'] = $user->email;
    	$_SESSION['super_admin'] = $user->super_admin;
    	$_SESSION['selector'] = $user->selector;
    	$_SESSION['task_distributor'] = $user->task_distributor;
    	$_SESSION['translator'] = $user->translator;
    	$_SESSION['linguistic_reviewer'] = $user->linguistic_reviewer;
    	$_SESSION['scientific_reviewer'] = $user->scientific_reviewer;
    	$_SESSION['final_editor'] = $user->final_editor;    	
    	header('Location: home.php');
    }
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login</title>
    <? include ('../master/header.php');?> 
</head>
<body>
<? include ('../master/login_top.php');?>
<form name="frm" method="post" action="login.php" onsubmit="return validateForm(this)">

	<center>
	  <fieldset id="Login_FieldSet">
   <legend>Login</legend>
   <p></p>
  
   <table width="100%" border="0" style="border-collapse:collapse;" cellspacing="0" cellpadding="4">	
		
		<tr>
			<td style="text-align:right;" class="odd" width="100">Username: </td>
			<td class="even">
				<input style="width:150px;" type="text" name="username" value="<?=$username?>" maxlength="100" />
			</td>
		</tr>
		<tr>
			<td style="text-align:right;" class="odd" width="100">Password: </td>
			<td class="even">
				<input class="input" type="password" name="password" maxlength="100" />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:left; color:red;">
	<?
		if ($error_message != '') {
			echo $error_message;
		}
		
	?></td>
		</tr>
		<tr>
			<td colspan="2">
				<input style="width:50px; margin:5px 0 0;" type="submit" class="btn" value="Login" />
			</td>
		</tr>
		
	</table>	  
	
   
   </fieldset>
   </center>
	
		
	<center></center>	

	
	<center>
	
	
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
		if (emptyField(frm.username)) {
			alert("Please enter your username");
			frm.username.focus();
			return false;
		}
		if (emptyField(frm.password)) {
			alert("Please enter your password");
			frm.password.focus();
			return false;
		}
		return true;
	}
	</script>
</form>

<? include ('../master/login_footer.php');?>
</body>
</html>
