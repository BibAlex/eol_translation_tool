<?php 

include ('../master/includes.php');

include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';

include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';

include_once '../../../classes/BLL/BLL_templates.php';
include_once '../../../classes/DAL/DAL_templates.php';

include_once '../../../classes/BLL/BLL_data_objects.php';
include_once '../../../classes/DAL/DAL_data_objects.php';

include_once '../../../classes/BLL/BLL_a_data_objects.php';
include_once '../../../classes/DAL/DAL_a_data_objects.php';

include_once '../../../classes/BLL/BLL_archived_a_data_objects.php';
include_once '../../../classes/DAL/DAL_archived_a_data_objects.php';

include_once '../../../classes/BLL/BLL_data_objects_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_data_objects_taxon_concepts.php';

include_once '../../../classes/BLL/BLL_status.php';
include_once '../../../classes/DAL/DAL_status.php';

include_once '../../../classes/Notifications.php';
include_once '../../../classes/SendMail.php';


/////////////////////////////////////////////////////////////////////////////////
	$process = 2;//by default translation
	$spid='';
	$spname='';
	$trstatus='0';
	$page=0;
	$UpdateTaxonStatus=0;//This is used to check if display form or to confirm that species has been finished

	//Get the current Process
	if(isset($_GET['process'])) 	$process = $_GET['process'];
	else if(isset($_POST['process'])) $process = $_POST['process'];
	else header('location:../users/login.php');
		
	//Get the Taxon
	if(isset($_GET['tid'])) $taxonID = $_GET['tid'];
	else  header('location:../users/login.php');
		
	//Get Object ID
	if(isset($_GET['oid'])) $objectID = $_GET['oid'];
	else  $objectID=0;
	
	//Check privilege of the page in terms of user privileges
	switch ($process) {
	    case 2:  validate_session('translation');  break;
	    case 3:  validate_session('linguistic_review');  break;
	    case 4:  validate_session('scientific_review');  break;
	    case 5:  validate_session('final_edit');  break;
	}
	
	//Check privilege of the page in terms of Taxon and process
	validate_taxon_access($process, $taxonID);
	$userID=$_SESSION['user_id'];
	
	
	//Set the other params to return to that page
	if(isset($_GET['spid'])) $spid = $_GET['spid'];
	if(isset($_GET['spname'])) $spname = $_GET['spname'];
	if(isset($_GET['trstatus'])) $trstatus = $_GET['trstatus'];
	if(isset($_GET['page'])) $page = $_GET['page'];
		
	$otherparam ='';
    if(trim($spid)!='')
    	$otherparam .= '&spid='.$spid;
    if(trim($spname)!='')
    	$otherparam .= '&spname='.$spname;
    if($trstatus>0)
    	$otherparam .= '&trstatus='.$trstatus;
    if(trim($process)!='')
    	$otherparam .= '&process='.$process;
    if($page!=0)
    	$otherparam .= '&page='.$page;	

/////////////////////////////////////////////////////////////////////////////////
		
	//Load the current taxon
	$taxon = BLL_taxon_concepts::Select_taxon_concept('slave',$taxonID);
	
////////////////////////////////////////////////////////////////////////////////
//If form is posted to save or finish so save information before loading menu
	if(isset($_POST['actionType']) && isset($_POST['SP_title']) && isset($_POST['LOC_editor']) && isset($_POST['RH_editor']) && isset($_POST['RS_editor']) && isset($_POST['D_editor']))
	{
		if($_POST['actionType']=='1' || $_POST['actionType']=='0')//if finish or save
		{
			BLL_a_data_objects::SubmitAction($objectID,$userID,$process, @$_POST['actionType'], $_POST['SP_title'], $_POST['LOC_editor'],  $_POST['RS_editor'], $_POST['RH_editor'], $_POST['D_editor'],$taxonID);
			
		}			
						
		
		else if($_POST['actionType']=='2')//if finish all
		{
			/*Save current Object*/
			BLL_a_data_objects::SubmitAction($objectID,$userID,$process, 0/*action_type=0 to Only Save current*/, $_POST['SP_title'], $_POST['LOC_editor'],  $_POST['RS_editor'], $_POST['RH_editor'], $_POST['D_editor'],$taxonID);
			/*Finish all objects*/ 
			BLL_a_data_objects::FinishAll($taxonID,$process,$userID);
		}			
	}
	
/////////////////////////////////////////////////////////////////////////////////

	//Get names of the species users
	$translatedBy='none';
	$lingRevBy='none';
	$ScienRevBy='none';
	$trans_assigned = $taxon->translator_assigned=='0'?'Picked' : 'Assigned';
	
	if($taxon->translator_id>0)
		$translatedBy = BLL_users::get_user_name($taxon->translator_id)	.' (<i>'.$trans_assigned.'</i>)';
	if($taxon->linguistic_reviewer_id>0)
		$lingRevBy = BLL_users::get_user_name($taxon->linguistic_reviewer_id).' (<i>Assigned</i>)';
	if($taxon->scientific_reviewer_id>0)
		$ScienRevBy = BLL_users::get_user_name($taxon->scientific_reviewer_id).' (<i>Assigned</i>)';

/////////////////////////////////////////////////////////////////////////////////	
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<title><? echo $taxon->scientificName; ?></title> 	
		 <? include ('../master/header.php');?>
		 		 	
  </head>
  <body>
		<? include ('../master/top.php');?>
		  		  
			<div class="title">
        <p> <img id='thumb' src=""/>
       
        	<h1><em> <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a></em></h1>
	        <br />
	        <br />
	         <br />
	        <div class="Translated_Reviewed" >
	        <span style="font-weight:bold">Species ID: </span><?=$taxon->id?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        </div>
	       
	        <div class="Translated_Reviewed" >
	        <span style="font-weight:bold">Species Status:</span>
	         <span>
	         <?php switch ($taxon->taxon_status_id) {
	         	case 3:	echo 'Translation done, Linguisitically review in progress';break;	         	
	         	case 4:	echo 'Linguisitically review done, Scientific review in progress';break;
	         	case 5:	echo 'Scientific review done, Final Editing in progress';break;
	         	case 6:	echo 'Final Edition done, Waiting to be published';break;
	         	case 7:	echo 'Published';break;	         	
	         	default:echo 'Translation in progress';break;/*case 2*/	         		
	         }?></span></div>
	        <br />
	        <?php if($process>=2){?>
	        	<div class="Translated_Reviewed"><span style="font-weight:bold">Translator: </span> <span><?php echo $translatedBy?></span></div>
	        <?php } if($process>=3){?>
	        	<div class="Translated_Reviewed"><span style="font-weight:bold">Linguisitic Reviewer: </span><span><?php echo $lingRevBy?></span></div>
	        <?php } if($process>=4){?>
	        	<div class="Translated_Reviewed"><span style="font-weight:bold">Scientific Reviewer: </span><span><?php echo $ScienRevBy?></span></div><br/>
	        <?php }?>
	      <br/> 
        </p>
        
      </div>
     
     <div style="clear:both"/>
      <div class="form_table">
      
     
        <?php
        	if($objectID==0)
        		include ('commonname.php');
        	else if($UpdateTaxonStatus==1)
        		include ('finishedtaxon.php');
        	else
        		include ('speciesform.php')	 
        ?>
        
         <!-- -------------------------Begin of Left Menu-------------------- -->
        <div class="table_of_content">
          
           <h2 style="height:15px">
          	<span style="float:left;">
          		<a href='species.php?tid=<?=$taxonID?><?=$otherparam?>'>Common Names</a>
          	</span>          
          </h2>
          <br/>
          <?php
          	$object_cache_url ='';//The main image url 
          	$types = array(1 => 'Table of Contents', 2 => 'Images', 3 => 'Video/Audio');
          	
          	foreach ($types as $type){
          		$Objs = BLL_data_objects::Select_Light_DataObjects_ByTaxonConceptID_ByType('slave',$taxonID,$type);
		  ?>
          
          <h2 style="height:15px">
          	<span style="float:left;">
          		<?php echo $type ?> (<?php echo count($Objs)?>)
          	</span>
          	<?php if(count($Objs)>0){?>
          	<img  src="../images/up.png" class="float_right" onclick='adjustMenu(this,"<?=$type?>");'/>
          	<?php }?>
          </h2>
          <div id='<?=$type?>'  style="display:block">
            <ul>
              <?
		        foreach ($Objs as $Obj){
		        	$class = '';
		        	
		        	$astatus = BLL_a_data_objects::Condition_a_data_objects_ByID_Process($Obj->id,$process);
		        	switch ($astatus) {
		        		case 1: $class='new'; 		$tooltip="Not Viewed";	break;
		        		case 2: $class='pending'; 	$tooltip="Pending";		break;
		        		case 3: $class='finished'; 	$tooltip="Finished";	break;
		        		case 4: $class='locked'; 	$tooltip="Locked";		break;
		        	}
		        	
		        			
          			//Load the thumbnail image as the current image
          			if($type=='Images' && $objectID == $Obj->id)
          				$object_cache_url = $Obj->object_cache_url;
          				
          			//If the current object is not image so load first image
          			if($type=='Images' && $object_cache_url == '')
          				$object_cache_url = $Obj->object_cache_url;
          			
          			if(TRIM($Obj->object_title)=='')
          				$Obj->object_title = '[No Title]';
          				
       				//set the current object as active style
          			if($objectID == $Obj->id)
          			
          				$class = 'active_'.$class;
          			
          				       					
          			
		      	?>		      
              	<li class="<?=$class?>"> 
              		<a title="<?=$tooltip?>" href="species.php?tid=<?=$taxonID?>&oid=<?=$Obj->id?><?=$otherparam?>"> <?=$Obj->object_title?></a> 
              	</li>
              <?}//end of foreach objs?>
             
            </ul>
          </div>    
   
        	<? }//end of foreach type?> 
          
        </div>
        
        <script type="text/javascript">
			document.getElementById('thumb').src ='<? echo $eol_site_content.substr($object_cache_url,0,4).'/'.substr($object_cache_url,4,2).'/'.substr($object_cache_url,6,2).'/'.substr($object_cache_url,8,2).'/'.substr($object_cache_url,10).'_small.jpg'?>';
			if(document.getElementById('thumb').src.indexOf('/////')>0) document.getElementById('thumb').style.display='none';  
				 
		 </script>  
        <!-- -------------------------End of Left Menu-------------------- -->
       	
       
      </div>
		  	<? include ('../master/footer.php');?>   
     	<script type="text/javascript">
     	 	<?php switch ($process) {
     	 		case 2:	echo "ActiveLink('trans');";break;
     	 		case 3:	echo "ActiveLink('ling');";break;
     	 		case 4:	echo "ActiveLink('scien');";break;
     	 		case 5:	echo "ActiveLink('final');";break;
     	 	}?>			

     	 	function adjustMenu(Img,type)
     	 	{
         	 	if(document.getElementById(type).style.display=="block")
         	 	{
             	 	document.getElementById(type).style.display="none";
     	 			Img.src = '../images/Down.png';
         	 	}
         	 	else
         	 	{
         	 		document.getElementById(type).style.display="block";
     	 			Img.src = '../images/up.png';
         	 	}
     	 	}
		 </script>  
  </body>
  
</html> 
 
