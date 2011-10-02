<?php 
include ('../master/includes.php');
validate_session('users');

include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
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
   <legend>Users</legend>
  
		<div class="btn" style="margin:15px 0 20px;">
			<div class="link_middle">
				<a href="form.php?id=0">Add New</a>
			</div>
		</div>	
		<div style="clear: both;"></div>	
		<div style="border:1px solid #C6C6C6; border-top:none;">
		<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3">            
            <tr>
                <td class="table_head" align="center">Name</td>
                <td class="table_head" align="center">Username</td>
                <td class="table_head" align="center">Status</td>
                <td class="table_head" align="center">Super admin</td>
                <td class="table_head" align="center">Selector</td>
                <td class="table_head" align="center">Task Distributor</td>
                <td class="table_head" align="center">Translator</td>
                <td class="table_head" align="center">Scientific Reviewer</td>
                <td class="table_head" align="center">Linguistic Reviewer</td>
                <td class="table_head" align="center">Final Editor</td>                
                <td class="table_head" align="center">Edit</td>
            </tr>
            <?
            $td_class='odd';
            
            $users = BLL_users::load_all();
            
            foreach ($users as $user) {
            	if ($td_class=='odd') $td_class='even'; else $td_class='odd';            
            	?>
            	<tr>
            		<td class="<?=$td_class?>"><?=$user->name?></td>
            		<td class="<?=$td_class?>"><?=$user->username?></td>
            		<td class="<?=$td_class?>" style="text-align: center"><?
            			if ($user->active==1) echo('Active'); else echo('Inactive');     
            		?></td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->super_admin) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->selector) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->task_distributor) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->translator) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->scientific_reviewer) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->linguistic_reviewer) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		<td class="<?=$td_class?>" style="text-align: center">
            			<?if ($user->final_editor) {?>
            				<img src="../images/finished.png" />
            			<?}?>
            		</td>
            		
            		<td class="<?=$td_class?>" style="text-align: center"><a href="form.php?id=<?=$user->id?>">Edit</a></td>
            	</tr>
            
            <?}?>
            
        </table>
        </div>
	</fieldset>
	
	<script>
    ActiveLink('user');
    </script>	
<? include ('../master/footer.php');?>
</body>
</html>