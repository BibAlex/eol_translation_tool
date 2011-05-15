<?php include ('../master/includes.php');
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/Pagination.php';

	$userID=$_SESSION['user_id'];
	$process = 2;//by default translation
	$spid='';
	$spname='';
	$pickedID='';
	$page=0;
	
	//Get the current Process
	if(isset($_GET['process'])) 	$process = $_GET['process'];
	else if(isset($_POST['process'])) $process = $_POST['process'];
	else header('location:../users/login.php');	
	//get species ID
	if(isset($_POST['spid'])) 	$spid = $_POST['spid'];
	else if (isset($_GET['spid'])) 	$spid = $_GET['spid'];		
	//Get species Name
	if(isset($_POST['spname'])) 	$spname = $_POST['spname'];
	else if (isset($_GET['spname'])) 	$spname = $_GET['spname'];
	//GetPage
	if(isset($_POST['page'])) 	$page = $_POST['page'];
	else if (isset($_GET['page'])) 	$page = $_GET['page'];		

	//Check privilege of the page
	switch ($process) {
	    case 2:  validate_session('translation');  break;
	    case 3:  validate_session('linguistic_review');  break;
	    case 4:  validate_session('scientific_review');  break;
	    case 5:  validate_session('final_edit');  break;
	}

	//if a species has been picked so update DB
	if(isset($_POST['pickedID']))
	{
		$pickedID = $_POST['pickedID'];		
		BLL_taxon_concepts::Update_taxon_concepts_TranslationStatus($pickedID,$userID,0);
		//To set the assign log
		BLL_taxon_concepts::taxon_concept_assign_log($pickedID, $userID, $process, $userID);		
	} else {
		if (isset($_GET['id']) && is_int($_GET['id'])) {
			$pickedID = $_GET['id'];		
			BLL_taxon_concepts::Update_taxon_concepts_TranslationStatus($pickedID,$userID,0);
			//To set the assign log
			BLL_taxon_concepts::taxon_concept_assign_log($pickedID, $userID, $process, $userID);				
		} 
		
	}
	
	
	//Pagination
	$total_items =  BLL_taxon_concepts::Count_taxon_concepts_ForTranslation_FromPool('slave',$spid,$spname);
	$current_page = Pagination::get_current_page($total_items, $items_per_page);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<title>Unassigned Species</title> 	
		 <? include ('../master/header.php');?>		 	
		
  </head>
   
  <body>
  
		<? include ('../master/top.php');?>
		  
		  
		  <div class="title">
	        Select species you need to translate from the list
	      </div>
	      <div style="clear:both;"></div>
	      <div class="form_table">
	        <div class="table_of_content">
	          <h2>Your Species List</h2>
	          <div>
	          	<ul>	          
	              <li class="toc" > 
	              	<a href="mylist.php?process=<?=$process?>&trstatus=2">
		              	Pending Species
		            </a>
		           </li>
		           <li class="toc" >
		            <a  href="mylist.php?process=<?=$process?>&trstatus=1">
		              	Completed Species
		            </a>
		          </li>
		          
	              <li class="toc"> 
	              	<a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;" href="poollist.php?process=<?=$process?>"> Pick new Species </a> 
	              </li>
	            </ul>
	          </div>
	        
	        </div>
	        
	        <form name="frm" id="frm" method="post" action="poollist.php">	         		
	        	<input type="hidden" id="pickedID" name="pickedID" value="<?=$pickedID?>" />
	        	<input type="hidden" id="process" name="process" value="<?=$process?>" />
	        	<input type="hidden" id="page" name="page" value="<?=$current_page?>" />
	        	<?
	        		if($total_items>0)	        		
		              $taxons = BLL_taxon_concepts::Select_taxon_concepts_ForTranslation_FromPool('slave',$spid,$spname,$current_page,$items_per_page);		             
  	  			?>
		        <div class="form">
		          <h2><?=$total_items?> Unassigned Specie(s) </h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		            <table border="0" cellpadding="10" cellspacing="0" width="100%">
		              <tr>
		              	<td class="oddc"  style="padding:3px; border-top:1px solid gray;">ID</td>
		                <td class="odd"  style="padding:3px; border-top:1px solid gray; text-align:center;">Species Name</td>
		                <td class="oddc"  style="padding:3px; border-top:1px solid gray;">Text</td>
		                <td class="oddc"  style="padding:3px; border-top:1px solid gray;">Images/ Videos</td>		               
		                <td class="oddc"  style="padding:3px; border-top:1px solid gray;">Action</td>		               
		              </tr>
		              <tr>
		              	<td class="evenc" style="padding:3px; border-bottom:1px solid gray;" >
		                     <input type="text" name="spid"  style="width:70px"  value="<?=$spid?>"  onkeypress="if(event.keyCode==13){document.frm.submit();}"/>
		                 </td>
		                <td class="even" style="padding:3px; border-bottom:1px solid gray;" >
		                    <center><input type="text" name="spname" style="width:300px" value="<?=$spname?>" onkeypress="if(event.keyCode==13){document.frm.submit();}"/></center>
		                 </td>	
		                
		                 <td class="evenc" style="padding:3px; border-bottom:1px solid gray;" >&nbsp;
		                 </td>
		                 <td class="evenc" style="padding:3px; border-bottom:1px solid gray;" >&nbsp;
		                 </td>		                 	               
		                <td class="evenc" style="padding:3px; border-bottom:1px solid gray;" >
		                	<input type="submit"  value="Filter" name="submitBut"/>
		                	&nbsp;<a href='poollist.php?process=<?=$process?>'>Clear</a>
		                </td>
		              </tr>
		              <?
		              	if($total_items>0)	   
			              	foreach ($taxons as $taxon){			              	
		                  		$CText = BLL_taxon_concepts::Count_DataObjects_ByTaxonID_ByType($taxon->id,'text'); 
		                  		$CMedia = BLL_taxon_concepts::Count_DataObjects_ByTaxonID_ByType($taxon->id,'media');
		                 
  	  				  ?>	
		              <tr>
		                <td class="oddc"><?=$taxon->id?></td>
		                <td class="odd"><a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a></td>
		                <td  class="oddc"><?=$CText?></td>
		                <td  class="oddc"><?=$CMedia?></td>
		                <td class="oddc"><a href="javascript:void(0);"  onclick="document.getElementById('pickedID').value=<?=$taxon->id?>;document.frm.submit();">Pick</a></td>
		              </tr>
		               <?
		              	}		              	
		              ?>
		            </table>
		          </div>
		          <div class="pages"> 
		            <?
		             	$otherparam ='';
		            	if(trim($spid)!='')
		            		$otherparam .= '&spid='.$spid;
		            	if(trim($spname)!='')
		            		$otherparam .= '&spname='.$spname;
		            	if(trim($process)!='')
		            		$otherparam .= '&process='.$process;			            	
		            
		            	echo Pagination::get_links($current_page, $items_per_page, $total_items, $_SERVER['PHP_SELF'],$otherparam);
		            ?> 
		          
		          </div>
		          <br />
		         
		       </div>
		     </form>
	     </div>
		  
     	<? include ('../master/footer.php');?>   
     	 <script type="text/javascript">
			ActiveLink('trans');   
		 </script>  
  </body>
  
</html> 
 