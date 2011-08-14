<?php
include_once '../../../classes/BLL/BLL_names.php';
include_once '../../../classes/DAL/DAL_names.php';
include_once '../../../classes/BLL/BLL_taxon_concept_names.php';
include_once '../../../classes/DAL/DAL_taxon_concept_names.php';

include_once '../../../classes/BLL/BLL_a_names.php';
include_once '../../../classes/DAL/DAL_a_names.php';

$actionType='';
$nameID=0;

if(isset($_POST['actionType'])) 	$actionType = $_POST['actionType'];//'acccept' or 'reject'
if(isset($_POST['nameID'])) 	$nameID = $_POST['nameID'];
if(isset($_POST['isNew'])) $isNew = $_POST['isNew'];//'yes' or 'no'
/********************Update Names************************************/
if($nameID>0)
{
	$status=2;//accepted
	if($actionType=='reject') $status=3;
	
	if($isNew=='no')//if names from Woods Hole
		BLL_taxon_concept_names::Update_TaxonNames($taxonID,$nameID,$status,$_SESSION['user_id']);		
	else //if names insert by this tool
		BLL_a_names::Update_a_names($nameID, $status, $_SESSION['user_id']);
	
}

/*******************Insert new name************************/
if(isset($_POST['commonname']) && trim($_POST['commonname'])!='')
{
	BLL_a_names::Insert_a_names($taxonID, $_POST['commonname'], $_SESSION['user_id']);
}

/***********************Check if read only common Names *************/
//Load the current taxon
$taxon = BLL_taxon_concepts::Select_taxon_concept('slave',$taxonID);
$readOnly=1;
if($taxon->taxon_status_id==$process)
	$readOnly=0;
	
?>
<form name="frm" id="frm"  method="post" action="species.php?tid=<?=$taxonID?><?=$otherparam?>" onsubmit="return validate_form(this)">
	<div class="form">
    	<h2>
          	<span style="float:left">
          		Species Common Names
          	</span>	
          	<span style="float:right">
          		<a href="../list/mylist.php?<?=$otherparam?>"><< Back to Species List</a>
          	</span>
          	<br/>      
        </h2>      
        <input type="hidden" id="actionType" name="actionType" value="" />          
        <input type="hidden" id="nameID" name="nameID" value="" />
        <input type="hidden" id="isNew" name="isNew" value="" />             
          
       <div style="border:1px solid #C6C6C6; border-top:none;">
          <table border="0" cellpadding="10" cellspacing="0" width="100%">
              <tr>
              	<td class="oddc">ID</td>
                <td class="odd">Comman Name</td>	               
                <td class="oddc">Status</td>		               
                <td class="oddc">User Name</td>
                <td class="oddc">Last Action</td>
                 <?php
	             if($readOnly==0){ 
	             ?>
                <td class="oddc">&nbsp;</td>
                <td class="oddc">&nbsp;</td>
                <?php }?>
              </tr>
              
              <!-- ********************Begin of Old common Names ********************************** -->
              <?
              	$names = BLL_names::Select_Names_ByTaxon_ID($taxonID);
		        foreach ($names as $name){         
  	  		  ?>	
              <tr>
              	<td class="evenc"><?=$name->id?></td>  
              	<td class="evenc"><?=$name->string?></td>
              	<?php
              	$taxon_concept_name = BLL_taxon_concept_names::Select_TaxonNames_ByTaxonID_AND_NameID($taxonID,$name->id);
		        $status='Not Viewed';
		        switch ($taxon_concept_name->name_status_id) {
		        	case 2: $status='Accepted';	break;
		        	case 3: $status='Rejected';	break;
		        } 
              	?>
              	<td class="evenc"><?=$status?></td>
              	<td class="evenc">
              	<? 
              		if($taxon_concept_name->name_status_id>1) 
              			echo 'By '.BLL_users::get_user_name($taxon_concept_name->last_modified_person);
              		else 
              			echo '&nbsp;';
              	?>
              	</td>
                <td class="evenc">
                <? 
                	if($taxon_concept_name->name_status_id>1) 
                		echo 'On '.$taxon_concept_name->last_modified_date;
                	else 
              			echo '&nbsp;';
                ?>
                </td>
                 <?php
	             if($readOnly==0){ 
	             ?>
                <td class="evenc">
                	<a href='javascript:void(0)' onclick='SetPostValues("accept","<?=$name->id?>","no");'>Accept</a>
                </td>
                <td class="evenc">
                	<a href='javascript:void(0)' onclick='SetPostValues("reject","<?=$name->id?>","no");'>Reject</a>
                </td>
                <?php }?>
              </tr>
              <?php 
		        }
		        ?>
		        <!-- ********************End of Old common Names ********************************** -->
		        <!-- ********************Begin of New common Names ********************************** -->
		        <?
              	$names = BLL_a_names::Select_a_names_ByTaxonID($taxonID);
		        foreach ($names as $name){         
  	  		  ?>	
              <tr>
              	<td class="evenc"><?=$name->id?></td>  
              	<td class="evenc"><?=$name->name?></td>
              	<?php
              	$status='Accepted';
		        if ($name->name_status_id==3) 
		        	$status='Rejected';		        
              	?>
              	<td class="evenc"><?=$status?></td>
              	<td class="evenc">
              	<? 
              		echo 'By '.BLL_users::get_user_name($name->last_modified_person);              		
              	?>
              	</td>
                <td class="evenc">
                <? 
                	echo 'On '.$name->last_modified_date;
                ?>
                </td>
                 <?php
	             if($readOnly==0){ 
	             ?>
                <td class="evenc">
                	<a href='javascript:void(0)' onclick='SetPostValues("accept","<?=$name->id?>","yes");'>Accept</a>
                </td>
                <td class="evenc">
                	<a href='javascript:void(0)' onclick='SetPostValues("reject","<?=$name->id?>","yes");'>Reject</a>
                </td>
                <?php }?>
              </tr>
              <?php 
		        }
		        ?>
		        <!-- ********************End of New common Names ********************************** -->
           </table>        
             <?php
             if($readOnly==0){ 
             ?>
             <div style="background-color:#E8E8E8;padding:10px">
	            &nbsp; <input type="text" id="TXT_Name" name="commonname"  style="width:300px"  value=""  onkeypress="if(event.keyCode==13){if(validate_form(this.form))document.frm.submit();}"/>
	             <input type="submit"  value="Add New" name="submitBut" />
	             <span id="error" class="error">Please add a valid Common Name</span>
	         </div>
             <?php }?>
       </div>
  </div> 
  
  <script type="text/javascript">

     function SetPostValues(actionType,nameID,isNew)
     {
         document.getElementById("actionType").value=actionType;
    	 document.getElementById("nameID").value=nameID;
    	 document.getElementById("isNew").value=isNew;
    	 document.frm.submit();
     }

     function validate_form(thisform)
     {
     	with (thisform)
       	{
       		if (trim(TXT_Name.value)=='')
         		{error.style.display="block"; TXT_Name.focus();return false;}
     		return true;
       }
     }
          
   </script>  
</form>
