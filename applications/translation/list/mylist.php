<?php include ('../master/includes.php');

include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/Pagination.php';

	$userID=$_SESSION['user_id'];
	$process = 2;//by default translation
	$spid='';
	$spname='';
	$trstatus='2';//by default see your pending species
	$page=0;
	
	//Get the current Process
	if(isset($_GET['process'])) $process = $_GET['process'];
	else if(isset($_POST['process'])) $process = $_POST['process'];
	else header('location:../users/login.php');
	
	//get species ID
	if(isset($_POST['spid'])) 	$spid = $_POST['spid'];
	else if (isset($_GET['spid'])) $spid = $_GET['spid'];	
	//Get species Name
	if(isset($_POST['spname'])) $spname = $_POST['spname'];
	else if (isset($_GET['spname'])) $spname = $_GET['spname'];
	//Get species Status
	if(isset($_POST['trstatus'])) 	$trstatus = $_POST['trstatus'];
	else if (isset($_GET['trstatus'])) $trstatus = $_GET['trstatus'];
	//GetPage
	if(isset($_POST['page'])) 	$page = $_POST['page'];
	else if (isset($_GET['page'])) 	$page = $_GET['page'];	
	
	//Check privilege of the page
	$total_items=0;
	switch ($process) 
	{
	    case 2://pending translation
    		validate_session('translation');
    		$total_items =  BLL_taxon_concepts::Count_taxon_concepts_ForTranslation_ByTranslator('slave',$userID,$spid,$spname,$trstatus);
    		$current_page = Pagination::get_current_page($total_items, $items_per_page);
    		$taxons = BLL_taxon_concepts::Select_taxon_concepts_ForTranslation_ByTranslator('slave',$userID,$spid,$spname,$trstatus,$current_page,$items_per_page);  
    		break;
	    case 3:	    	
    		validate_session('scientific_review');
    		$total_items =  BLL_taxon_concepts::Count_taxon_concepts_ForScienReview_ByUser('slave',$userID,$spid,$spname,$trstatus);
    		$current_page = Pagination::get_current_page($total_items, $items_per_page);
    		$taxons = BLL_taxon_concepts::Select_taxon_concepts_ForScienReview_ByUser('slave',$userID,$spid,$spname,$trstatus,$current_page,$items_per_page);  
    		break;	    	
	    case 4:  
    		validate_session('linguistic_review');
    		$total_items =  BLL_taxon_concepts::Count_taxon_concepts_ForLingReview_ByUser('slave',$userID,$spid,$spname,$trstatus);
    		$current_page = Pagination::get_current_page($total_items, $items_per_page);
    		$taxons = BLL_taxon_concepts::Select_taxon_concepts_ForLingReview_ByUser('slave',$userID,$spid,$spname,$trstatus,$current_page,$items_per_page);  
    		break;
	    case 5:  
    		validate_session('final_edit');
    		$total_items =  BLL_taxon_concepts::Count_taxon_concepts_ForFinalEditing('slave',$spid,$spname,$trstatus);
    		$current_page = Pagination::get_current_page($total_items, $items_per_page);
    		$taxons = BLL_taxon_concepts::Select_taxon_concepts_ForFinalEditing('slave',$spid,$spname,$trstatus,$current_page,$items_per_page);
    		break;	    		
	}		
		
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<title>My Translated Species List</title> 	
		 <? include ('../master/header.php');?>	
  </head>
  <body>
  
		<? include ('../master/top.php');?>
		  
		  <div class="title">
	        Select species you need to work on from the list
	      </div>
	      <div style="clear:both;"></div>
	      <div class="form_table">
	        <div class="table_of_content">
	          <h2>
	          	<?php if($process!=5) echo 'Your'?> Species List	          	
	          </h2>
	          <div>
	            <ul>	  
	            	<?php
		            	if($trstatus=='2')//pending
		            	{ 
		            		$pending_style= 'style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"';
		            		$completed_style= '';
		            	}
		            	else
		            	{
		            		$pending_style= '';
		            		$completed_style= 'style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"';
		            	} 
	            	?>        
	              <li class="toc" > 
	              	<a <?=$pending_style?>  href="mylist.php?process=<?=$process?>&trstatus=2">
		              	Pending Species
		            </a>
		           </li>
		           <li class="toc" >
		            <a <?=$completed_style?> href="mylist.php?process=<?=$process?>&trstatus=1">
		              	Completed Species
		            </a>
		          </li>	              	 
	              <?php if($process==2){?>
	              <li class="toc"> <a href="poollist.php?process=<?=$process?>"> Pick new Species </a> </li>
	              <?php }?>
	            </ul>
	          </div>
	        
	        </div>
	        
	        <form name="frm" id="frm" method="post" action="mylist.php?process=<?=$process?>&trstatus=<?=$trstatus?>" >
		        <div class="form">
		          <h2>
		          	<?=$total_items?> 
		          	<?php if($trstatus==2) echo 'Pending'; else if ($trstatus==1) echo 'Completed'?>		          	
		           Specie(s)
		          </h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
		            <table border="0" cellpadding="10" cellspacing="0" width="100%">
		              <tr>
		              	<td class="oddc"  style="width:74px;padding:3px; border-top:1px solid gray;">ID</td>
		                <td class="odd"  style="padding:3px; border-top:1px solid gray; text-align:center;">Species Name</td>
		                <td class="odd"  style="padding:3px; border-top:1px solid gray; text-align:center;">Priority</td>		 
		                <td class="oddc"  style="padding:3px; border-top:1px solid gray;">Text</td>
		                <td class="oddc"  style="padding:3px; border-top:1px solid gray;">Images/ Videos</td>	               
		                <td class="oddc"  style="width:90px;padding:3px; border-top:1px solid gray;">Action</td>
		                <?php if($process==2){?>
		                	<td class="oddc"  style="padding:3px; border-top:1px solid gray;">	&nbsp;	</td>                	
		                <?php }?>
		              </tr>
		              <tr>
		              	<td style="padding:3px; border-bottom:1px solid gray;" class="oddc">
		                    <input type="text" name="spid"  style="width:70px"  value="<?=$spid?>"  onkeypress="if(event.keyCode==13){document.frm.submit();}"/>
		                </td>
		                <td style="padding:3px; border-bottom:1px solid gray;" class="oddc" style="text-align:left">
		                    <input type="text" name="spname" style="width:260px"  value="<?=$spname?>" onkeypress="if(event.keyCode==13){document.frm.submit();}"/>
		                </td>
		                <td style="padding:3px; border-bottom:1px solid gray;" class="odd" >	&nbsp;	              		
		                </td>
		                <td style="padding:3px; border-bottom:1px solid gray;" class="odd" >	&nbsp;	              		
		                </td>
		                <td style="padding:3px; border-bottom:1px solid gray;" class="odd">	&nbsp;			                	
		                </td>		                
		                <td style="padding:3px; border-bottom:1px solid gray;" class="oddc">
		                	<center><input type="submit"  value="Filter" name="submitBut"/>
		                	<a href='mylist.php?process=<?=$process?>&trstatus=<?=$trstatus?>'>Clear</a></center>
		                </td>
		                <?if($process==2){?>
		                <td style="padding:3px; border-bottom:1px solid gray;" class="odd">	&nbsp;	</td>
		                <?}?>
		              </tr>
		              <?		             
		              	$otherparam ='';
		            	if(trim($spid)!='')
		            		$otherparam .= '&spid='.$spid;
		            	if(trim($spname)!='')
		            		$otherparam .= '&spname='.$spname;
		            	if($trstatus>0)
		            		$otherparam .= '&trstatus='.$trstatus;
		            	if(trim($process)!='')
		            		$otherparam .= '&process='.$process;	
		            			            		
		            	$potherparam = $otherparam;	
		            	if($page!=0)
		            		$potherparam .= '&page='.$page;
		              foreach ($taxons as $taxon){
		              		$CText = BLL_taxon_concepts::Count_DataObjects_ByTaxonID_ByType($taxon->id,'text'); 
		                  	$CMedia = BLL_taxon_concepts::Count_DataObjects_ByTaxonID_ByType($taxon->id,'media');
		              		$status = '<img src="../images/pending.png" title="pending species"/>';
		              		$update = '<img src="../images/update.png" title="updated species"/>';
		              		if($process==2) $action = 'Translate';
		              		else $action = 'Review';	
		              		$assigned = 'Assigned';	              		
		              		if($taxon->taxon_status_id>$process)
		              		{
		              			$status = '<img src="../images/finished.png" title="finished species"/>';
		              			$action = 'View';
		              		}
		              		if($process==2 && $taxon->translator_assigned==0)
		              			$assigned = 'Picked';
  	  				  ?>	
		              <tr>
		                <td class="evenc"><?=$taxon->id?></td>
		                <td class="even" >
		                	<?
		                		if ($taxon->taxon_update == 2){
		                			echo $update;
		                		}
		                		else{
		                			echo $status;
		                		}
		                	?>
		                	<a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>">		                		
		                		<?=$taxon->scientificName?>
		                	</a>
		                </td>
		                <td class="evenc"><?=$taxon->priority?></td>
		                <td class="evenc"><?=$CText?></td>
		                <td class="evenc"><?=$CMedia?></td>		                	                
		                <td class="evenc" ><a href="../details/species.php?tid=<?=$taxon->id?><?=$potherparam?>"><?=$action?></a></td>
		                <?php if($process==2){?>
		                <td class="evenc"  ><?=$assigned?></td>
		                <?php }?>
		              </tr>
		               <?
		              }
		              ?>
		            </table>
		          </div>
		          <div class="pages"> 
		            <?
		            	echo Pagination::get_links($current_page, $items_per_page, $total_items, $_SERVER['PHP_SELF'],$otherparam);
		            ?> 
		          
		          </div>
		          <br />
		         
		       </div>
		     </form>
	     </div>
		  
     	<? include ('../master/footer.php');?>   
     	 <script type="text/javascript">
     	 	<?php switch ($process) {
     	 		case 2:	echo "ActiveLink('trans');";break;
     	 		case 3:	echo "ActiveLink('scien');";break;
     	 		case 4:	echo "ActiveLink('ling');";break;
     	 		case 5:	echo "ActiveLink('final');";break;
     	 	}?>			
		 </script>  
  </body>
  
</html> 
 