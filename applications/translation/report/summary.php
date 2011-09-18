<?php 
include ('../master/includes.php');
//validate_session('users');
include_once '../../../classes/Pagination.php';
include_once '../../../classes/BLL/BLL_users.php';
include_once '../../../classes/DAL/DAL_users.php';
include_once '../../../classes/BLL/BLL_status.php';
include_once '../../../classes/DAL/DAL_status.php';
include_once '../../../classes/BLL/BLL_priorities.php';
include_once '../../../classes/DAL/DAL_priorities.php';
include_once '../../../classes/BLL/BLL_selection_batches.php';
include_once '../../../classes/DAL/DAL_selection_batches.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';
include_once '../../../classes/BLL/BLL_taxon_concept_assign_log.php';
include_once '../../../classes/DAL/DAL_taxon_concept_assign_log.php';
validate_session('task_distribution');
$page=0;

if(isset($_POST['spid'])) $spid = $_POST['spid']; 
else if(isset($_GET['spid']))  $spid = $_GET['spid'];   
else $spid='';

if(isset($_POST['spname'])) $spname = $_POST['spname'];
else if(isset($_GET['spname'])) $spname = $_GET['spname'];  
else $spname='';

if(isset($_POST['batch'])) $batch = $_POST['batch'];	
else if(isset($_GET['batch'])) $batch = $_GET['batch'];
else $batch=0;

if(isset($_POST['phase'])) $phase = $_POST['phase'];	
else if(isset($_GET['phase'])) $phase = $_GET['phase'];
else $phase=-1;

if(isset($_POST['translator'])) $translator = $_POST['translator'];	
else if(isset($_GET['translator'])) $translator = $_GET['translator'];
else $translator=0;

if(isset($_POST['translator_type'])) $translator_type = $_POST['translator_type'];	
else if(isset($_GET['translator_type'])) $translator_type = $_GET['translator_type'];
else $translator_type=-1;

if(isset($_POST['linguistic_reviewer'])) $linguistic_reviewer = $_POST['linguistic_reviewer'];	
else if(isset($_GET['linguistic_reviewer'])) $linguistic_reviewer = $_GET['linguistic_reviewer'];
else $linguistic_reviewer=0;

if(isset($_POST['scientific_reviewer'])) $scientific_reviewer = $_POST['scientific_reviewer'];	
else if(isset($_GET['scientific_reviewer'])) $scientific_reviewer = $_GET['scientific_reviewer'];
else $scientific_reviewer=0;

if(isset($_POST['final_editor'])) $final_editor = $_POST['final_editor']; 	
else if(isset($_GET['final_editor'])) $final_editor = $_GET['final_editor'];
else $final_editor=0;

if(isset($_POST['priority_id'])) $priority_id = $_POST['priority_id']; 	
else if(isset($_GET['priority_id'])) $priority_id = $_GET['priority_id'];
else $priority_id=0;

$total_items =  BLL_taxon_concepts::Search_Count_For_taxon_concepts($spid, $spname, $batch, $phase, $translator, $translator_type, $linguistic_reviewer, $scientific_reviewer, $final_editor, $priority_id);
$current_page = Pagination::get_current_page($total_items, $items_per_page);
$taxons = BLL_taxon_concepts::Search_For_taxon_concepts($spid, $spname, $batch, $phase, $translator, $translator_type, $linguistic_reviewer, $scientific_reviewer, $final_editor, $current_page, $items_per_page, $priority_id);

function DisplayHistory($cur_taxon) {
	$result="<ul>";
	$result .= "<li><b>ID:</b> " . $cur_taxon->id;
	$result .= "<li><b>Scientific Name:</b> " . $cur_taxon->scientificName;
	$result .= "<li><b>Current status:</b> " . BLL_status::Select_Status_ByID($cur_taxon->taxon_status_id);
	if($cur_taxon->taxon_status_id>=2 )
		$result .= '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;('.$cur_taxon->total_ArabicObjects.'/'.$cur_taxon->total_EnglishObjects.' are done)';
	$result .= "<table>";		
	$result .= '<tr><td><b>Selector:</b></td><td>'. $cur_taxon->getSelectorName()
				.'</td><td><b>Selected at: </b></td><td>'.$cur_taxon->getSelection_date().'</td></tr>';
	$result .= '<tr><td><b>Distributed at:</b></td><td>'. $cur_taxon->getTaskdistribution_date().'</td><td/><td/></tr>';	
	$result .= '<tr><td><b>Translator:</b></td><td>'.$cur_taxon->getTranslatorName()
				.'</td><td><b>Assigned at: </b></td><td>'.BLL_taxon_concept_assign_log::Select_assignLog($cur_taxon->id,2,$cur_taxon->translator_id)
				.'</td><td><b>Finished at: </b></td><td>'.$cur_taxon->getTranslation_date().'</td></tr>';				
	$result .= '<tr><td><b>Scientific reviewer by:</b></td><td>'. $cur_taxon->getScientificReviewerName() 
				.'</td><td><b>Assigned at: </b></td><td>'.BLL_taxon_concept_assign_log::Select_assignLog($cur_taxon->id,3,$cur_taxon->scientific_reviewer_id)
				.'</td><td><b>Finished at:</td><td>'.$cur_taxon->getScientificreview_date().'</td></tr>';				
	$result .= '<tr><td><b>Linguistic reviewer:</b></td><td>'. $cur_taxon->getLinguisticReviewerName()
				.'</td><td><b>Assigned at: </b></td><td>'.BLL_taxon_concept_assign_log::Select_assignLog($cur_taxon->id,4,$cur_taxon->linguistic_reviewer_id)
				.'</td><td><b>Finished at:</td><td>'.$cur_taxon->getLinguisticreview_date().'</td></tr>';
	$result .= '<tr><td><b>Final editor:</b></td><td>'. $cur_taxon->getFinalEditorName()
				.'</td><td><b>Finished at:</b></td><td>'.$cur_taxon->getFinalediting_date().'</td></tr>';
	//$result .= '<tr><td><b>Published at:</b></td><td>'. $cur_taxon->getPublish_date().'</td><td/><td/></tr>';	
	return $result.'</table></ul>'; 
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reporting Tool</title>
    <? include ('../master/header.php');?>
    <style >
    	.custom-mask-div-opaque {opacity:0.5;filter:alpha(opacity=50);}
		.custom-mask-div {background-color:#D0D0D0;border:0 none;height:100%;left:0;margin:0;padding:0;position:fixed;top:0;width:100%;}
		.custom-content {background-color:#FFFFFF;padding:2px;border:1px solid #9D986D;}
		.custom-text {background-color:white;background-image:none;border:medium none;color:#B51D01;display:block;font-family:Georgia,"Times New Roman",Times,serif;font-size:14px;font-weight:bold;}
		.custom-controls {position:absolute;right:3px;top:3px;z-index:1;}
		.custom-header {background-color:white;border-color:#D4CFC7;background-position:left top;background-repeat:repeat-x;border-width:0px;padding:2px;}
		.custom-body {background-color:#D8D7CC;border:1px solid #A3A29C;color:#333333;font-family:Arial,Verdana,sans-serif;font-size:12px;padding:5px;}
    </style>
</head>
<body>
<? include ('../master/top.php');?>	
	<form name="frm" id="frm" method="post" action="summary.php" >
	
	  	<fieldset>
	   		<legend>Reporting Tool</legend>
	  
			<div style="clear: both;"></div>	
			<br/>
			<div style="border:1px solid #C6C6C6;">
			<table border="0" cellpadding="10" cellspacing="0" width="100%">
				<tr>
					<td class="oddr">Species ID:</td>
					<td class="even2"><input type="text" name="spid"  style="width:150px"  value="<?=$spid?>" /></td>
					<td style="width:10px"></td>
					<td class="oddr">Species Name:</td>
					<td class="even2"><input type="text" name="spname"  style="width:300px"  value="<?=$spname?>" /></td>				
				</tr>
				<tr>
					<td class="oddr">Selection Batch:</td>
					<td class="even2">
						<select name="batch" id="batch" style="width:150px">
							<option  value="0" >--All--</option>
							<?php
								$batches = BLL_selection_batches::select_all_batches();								
								foreach ($batches as $ibatch) {
									$selected='';
									if($batch==$ibatch->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected ?> value="<?echo $ibatch->id?>"><?echo '['.$ibatch->id.'] . '.$ibatch->date_selected?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					
					<td class="oddr">Current Phase:</td>
					<td class="even2">
						<select name="phase" id="phase"   style="width:150px">
							<option value="-1">--All--</option>
							<?php
								$phases = BLL_status::Select_Status();	
													
								foreach ($phases as $iphase) {
									$selected='';
								if($iphase->id==1)
								{					
									$iphase->id=0;
									$iphase->label='Distribution';
								}
								if($iphase->id==$phase)
									$selected='selected';
									
							?>
							<option <?php echo $selected?> value="<?echo $iphase->id?>"> <?echo $iphase->label?></option>
							<?php }?>
						</select>
					</td>
					
				</tr>
				<tr>
					<td class="oddr">Translator:</td>
					<td class="even2">
						<select name="translator" id="translator"   style="width:150px">
							<option  value="0">--All--</option>
							<?php
								$users = BLL_users::Select_Users_ByRole(2);								
								foreach ($users as $user) {
									$selected='';
									if($translator==$user->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected?>  value="<?echo $user->id?>"><?echo $user->name?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					<td class="oddr">Translator Type:</td>
					<td class="even2">		
						<?php if($translator_type=='1')	$checked='checked'; else $checked='';?> 			
					    <input type="radio" name="translator_type" value="1" <?php echo $checked?> /> Assigned
					    <?php if($translator_type=='0')	$checked='checked'; else $checked='';?>
					    <input type="radio" name="translator_type" value="0" <?php echo $checked?>/> Picked
					    <?php if($translator_type=='-1')	$checked='checked'; else $checked='';?>
					    <input type="radio" name="translator_type" value="-1" <?php echo $checked?>/> Both
					</td>
				</tr>
				<tr>
					<td class="oddr">Scientific Reviewer:</td>
					<td class="even2">
						<select name="scientific_reviewer" id="scientific_reviewer"   style="width:150px">
							<option  value="0">--All--</option>
							<?php
								$users = BLL_users::Select_Users_ByRole(3);
								foreach ($users as $user) {
									$selected='';
									if($scientific_reviewer==$user->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected?>  value="<?echo $user->id?>"><?echo $user->name?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					<td class="oddr"></td>
					<td class="even2"></td>
				</tr>
				
				<tr>
					<td class="oddr">Linguistic Reviewer:</td>
					<td class="even2">
						<select name="linguistic_reviewer" id="linguistic_reviewer"   style="width:150px">
							<option  value="0">--All--</option>
							<?php
								$users = BLL_users::Select_Users_ByRole(4);
								foreach ($users as $user) {
									$selected='';
									if($linguistic_reviewer==$user->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected?>  value="<?echo $user->id?>"><?echo $user->name?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					<td class="oddr"></td>
					<td class="even2"></td>
				</tr>
				<tr>
					<td class="oddr">Final Editor:</td>
					<td class="even2">
						<select name="final_editor" id="final_editor"   style="width:150px">
							<option  value="0">--All--</option>
							<?php
								$users = BLL_users::Select_Users_ByRole(5);
								foreach ($users as $user) {
									$selected='';
									if($final_editor==$user->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected?>  value="<?echo $user->id?>"><?echo $user->name?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					<td class="oddr"></td>
					<td class="even2"></td>
				</tr>
				<tr>
					<td class="oddr">Priority:</td>
					<td class="even2">
						<select name="priority_id" id="priority_id"   style="width:150px">
							<option  value="0">--All--</option>
							<?php
								$priorities = BLL_priorities::load_all();
								foreach ($priorities as $priority) {
									$selected='';
									if($priority_id==$priority->id)
										$selected = 'selected';
							?>
							<option <?php echo $selected?>  value="<?echo $priority->id?>"><?echo $priority->label?></option>
							<?php }?>
						</select>
					</td>
					<td style="width:10px"></td>
					<td class="oddr"></td>
					<td class="even2"></td>
				</tr>
			</table>
			</div>
			<div align="center" style="background-color:red; margin-left:200px">
				<div class="btn">
		            <div class="link_middle">
		            	<a href="javascript:void(0);" onclick='document.frm.submit();'>
		            		Search
		            	</a>
		            </div>
		        </div>
		        <div class="btn">
		            <div class="link_middle">
		            	<a href="summary.php" >
		            		Reset
		            	</a>
		            </div>
		        </div>
			
			</div>
			  
			
		</fieldset>
		<fieldset>
		<legend><?php echo $total_items.' Species Result(s)'?></legend>
		<br/>
		<div style="border:1px solid #C6C6C6;">
			<table  border="0" cellpadding="10" cellspacing="0" width="100%">            
	            <tr>
	                <td class="oddc"  style="padding:7px; ">Species ID</td>
	                <td class="oddc"  style="padding:7px; text-align:left;" >Scientific Name</td>
	                <td class="oddc"  style="padding:7px; " >Priority</td>
	                <td class="oddc"  style="padding:7px; " >Phase</td>
	                <td class="oddc"  style="padding:7px;">Done</td>
	                <? if ($_SESSION['it_admin'] == 1) { ?>
	                <td class="oddc"  style="padding:7px;">Words count</td>
	                <td class="oddc"  style="padding:7px;">Distinct Words Count</td>
	                <?}?>
	                <td class="oddc"  style="padding:7px;"></td>
	                <td class="oddc"  style="padding:7px"></td> 
	                <td class="oddc"  style="padding:7px"></td> 
	                <td class="oddc"  style="padding:7px">Translator Email</td>
	            </tr>
	            <?php 
	            $otherparam ='';
            	if(trim($spid)!='')
            		$otherparam .= '&spid='.$spid;
            	if(trim($spname)!='')
            		$otherparam .= '&spname='.$spname;
            	if($batch>0)
            		$otherparam .= '&batch='.$batch;
            	if($phase>-1)
            		$otherparam .= '&phase='.$phase;	
            	if($translator>0)
            		$otherparam .= '&translator='.$translator;	
            	if($translator_type>-1)
            		$otherparam .= '&translator_type='.$translator_type;	
            	if($linguistic_reviewer>0)
            		$otherparam .= '&linguistic_reviewer='.$linguistic_reviewer;
            	if($scientific_reviewer>0)
            		$otherparam .= '&scientific_reviewer='.$scientific_reviewer;
            	if($final_editor>0)
            		$otherparam .= '&final_editor='.$final_editor;	
            			            		
            	$potherparam = $otherparam;	
            	if($page!=0)
            		$potherparam .= '&page='.$page;
	            foreach($taxons as $taxon){?>
	            <tr>
	            	<td class="evenc"><?php echo $taxon->id?></td>
	            	<td class="even">
	            		<a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a>
	            	</td>
	            	<td class="evenc"><?=$taxon->priority?></td>
	            	<td class="evenc">
	            		<?php	            			 
	            			echo BLL_status::Select_Status_ByID($taxon->taxon_status_id);
	            		?>
	            	</td>
	            	<td class="evenc">
	            		<? 
	            			if($taxon->taxon_status_id>=2)
	            				echo $taxon->total_ArabicObjects.'/'.$taxon->total_EnglishObjects;
	            		?>
	            	</td>
	            	<? if ($_SESSION['it_admin'] == 1) { ?>
	            	<td class="evenc">
	            		<? 
	            			if($taxon->taxon_status_id>2)
	            				echo BLL_taxon_concepts::All_words_count($taxon->id);
	            		?>
	            	</td>
	            	<td class="evenc">
	            		<?php 
	            			if($taxon->taxon_status_id>2)
	            				echo BLL_taxon_concepts::Unique_words_count($taxon->id);
	            		?>
	            	</td>
	            	<?}?>
	            	<td class="evenc">
	            		<?php 
	            			if($taxon->taxon_status_id>=2){
	            		?>
	            		<a href='species.php?tid=<?=$taxon->id?>' target="_blank">View</a>
	            		<?php }?>
	            	</td>
	            	<td class="evenc">
	            		<?php 
	            			if($taxon->taxon_status_id>=2){
	            		?>
	            		<a target="_blank" href='../task_distribution/reassign_species.php?id=<?=$taxon->id?>&selection_id=<?=$taxon->selection_id?>'>Reassign</a>
	            		<?php }?>
	            	</td>
	            	<td class="evenc">	            		
	            		<a href="javascript:void(0);" onclick="ShowHistory('<?php echo DisplayHistory($taxon);?>');" >Info</a>	            		
	            	</td>
	            	<td class="evenc">
                       <?php
                            echo $taxon->email;
                       ?>
                    </td>	            	
	            </tr>	            	
	            <?php }?>
	        </table>
	    </div>   
            <div class="pages"> 
	            <?
	            	echo Pagination::get_links($current_page, $items_per_page, $total_items, $_SERVER['PHP_SELF'],$otherparam);
	            ?> 
	       </div>
	      <br />
		</fieldset>
				
		<div id="info"  style="display:none;">
			<div class="custom-mask-div-opaque custom-mask-div"  style="z-index: 500;"></div>
			<div id='infoDiv'  class="feedback-container"  style="position: absolute; width: 730px; height: 300px; z-index: 501;" >
				<div class="custom-content">
					<div class="custom-text custom-controls">
						<img  src="../images/closepanel.jpg" class="hidelink" style="cursor: pointer;" onclick="document.getElementById('info').style.display='none';"/>
					</div>
					<table style="height:306px;width: 724px;" cellspacing="0" cellpadding="0" border="0" class="custom-content-table">
						<tbody>
							<tr style="height: 1%;">
								<td class="custom-header-cell">
									<div class="custom-text custom-header" style="white-space: nowrap; ">Species History</div>
								</td>
							</tr>
							<tr >
								<td valign="top" class="custom-body">
									<div id='infoContent' style="overflow: auto; width:700px; height:300px">										
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
	</form>
	
	<script>
    ActiveLink('report');

    function ShowHistory(Msg)
    {
    	document.getElementById('info').style.display='block';
    	showDiv(document.getElementById('infoDiv'));
    	document.getElementById('infoContent').innerHTML=Msg;
    }
    function f_scrollTop() {
		
		return f_filterResults (
			window.pageYOffset ? window.pageYOffset : 0,
			document.documentElement ? document.documentElement.scrollTop : 0,
			document.body ? document.body.scrollTop : 0
		);
	}
	function f_scrollLeft() {
		return f_filterResults (
			window.pageXOffset ? window.pageXOffset : 0,
			document.documentElement ? document.documentElement.scrollLeft : 0,
			document.body ? document.body.scrollLeft : 0
		);
	}
	function f_clientWidth() {
		return f_filterResults (
			window.innerWidth ? window.innerWidth : 0,
			document.documentElement ? document.documentElement.clientWidth : 0,
			document.body ? document.body.clientWidth : 0
		);
	}
	function f_clientHeight() {
		return f_filterResults (
			window.innerHeight ? window.innerHeight : 0,
			document.documentElement ? document.documentElement.clientHeight : 0,
			document.body ? document.body.clientHeight : 0
		);
	}
	function showDiv(obj){	
		var w = f_clientWidth();
		var h = f_clientHeight();
		var popW = parseInt(obj.style.width);
		var popH = parseInt(obj.style.height) ;
		var leftPos = (w-popW)/2;
		var topPos = (h-popH)/2;         
	    obj.style.top = parseInt(topPos - 80 + f_scrollTop())+ 'px'; 
	    obj.style.left = parseInt(leftPos + f_scrollLeft()) + 'px';
	}	
	window.onresize = function()
	{   
		if(document.getElementById('info').style.display=='block'){
			showDiv(document.getElementById('infoDiv'));
		}	
	};	
	window.onscroll = function()
	{   
		if(document.getElementById('info').style.display=='block'){
			showDiv(document.getElementById('infoDiv'));
		}
	};	
	function f_filterResults(n_win, n_docel, n_body) {
		var n_result = n_win ? n_win : 0;
		if (n_docel && (!n_result || (n_result > n_docel)))
			n_result = n_docel;
		return n_body && (!n_result || (n_result > n_body)) ? n_body : n_result;
	}
    </script>	
<? include ('../master/footer.php');?>
</body>
</html>