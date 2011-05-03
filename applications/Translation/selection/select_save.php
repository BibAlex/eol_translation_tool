<?php 
include_once ('../master/includes.php');
include_once '../../../classes/BLL/BLL_hierarchy_entries.php';
include_once '../../../classes/DAL/DAL_hierarchy_entries.php';
include_once '../../../classes/BLL/BLL_hierarchies.php';
include_once '../../../classes/DAL/DAL_hierarchies.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';


validate_session('selection');


if (!isset($_POST['hierarchy_id']))
    header('Location: select.php');

$hierarchy_id = intval($_POST['hierarchy_id']);
$hierarchy_entry_id = intval($_POST['hierarchy_entry_id']);
$have_text = intval($_POST['have_text']);
$text_curated = intval($_POST['text_curated']);
$have_images = intval($_POST['have_images']);
$images_curated = intval($_POST['images_curated']);
$vetted_text = $_POST['vetted_text'];
$vetted_images = $_POST['vetted_images'];
$select_hotlists = $_POST['select_hotlists'];

$taxon_concept_Array = $_POST['taxon_concept'];

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Save Selection</title> 	
		 <? include ('../master/header.php');?> 
		 <link rel="stylesheet" type="text/css" href="../../../classes/modules/jsTree/source/tree_component.css" />
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/css.js"></script>
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/jquery.js"></script>
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/jquery.listen.js"></script>
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/tree_component.js"></script>	
	     <!-- required for xml data type -->
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/sarissa.js"></script>
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/sarissa_ieemu_xpath.js"></script>
	     <script type="text/javascript" src="../../../classes/modules/jsTree/source/_lib/jquery.xslt.js"></script>
	    
	</head>
   <body>
   <? include ('../master/top.php');?>
	<div style="clear:both; height:15px;"></div>
      <div class="form_table">	    
	    <div class="table_of_content">
	    	<h2>
	        	Selection Tool	          	
	        </h2>
		    <ul>
		        <li class="toc"><a href="select.php">New Selection</a></li>
		        <li class="toc"><a href="show_selections.php">Old Selections</a></li>		        	        
		    </ul>
	    </div>    
		<div class="form">
		          
		              
   			 <form name="frm" method="post" action="select_final.php">
		        <input type="hidden" name="hierarchy_id" value="<?echo ($hierarchy_id)?>"/>
		        <input type="hidden" name="hierarchy_entry_id" value="<?echo ($hierarchy_entry_id)?>"/>
		        <input type="hidden" name="have_text" value="<?echo ($have_text)?>"/>
		        <input type="hidden" name="text_curated" value="<?echo ($text_curated)?>"/>
		        <input type="hidden" name="vetted_text" value="<?echo ($vetted_text)?>"/>
		        <input type="hidden" name="have_images" value="<?echo ($have_images)?>"/>
		        <input type="hidden" name="images_curated" value="<?echo ($images_curated)?>"/>
		        <input type="hidden" name="vetted_images" value="<?echo ($vetted_images)?>"/>
			<input type="hidden" name="select_hotlists" value="<?echo ($select_hotlists)?>" />
		
		        <?for ($i=0; $i<count($taxon_concept_Array); $i++) { ?>
		        <input type="hidden" name="taxon_concept[]" value="<?echo ($taxon_concept_Array[$i])?>"/>
		        <?}?>

       		<h2>Search for</h2>
		          <div style="border:1px solid #C6C6C6; border-top:none;">
				<table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">	
				    <tr>
				    	<td class="odd">
				    		<b>- Hierarchy:</b>  
				    	</td>
				    	<td class="even">
				    		<?=BLL_hierarchies::get_name($hierarchy_id)?>
				    	</td>
				    </tr>
				    <tr>
				    	<td class="odd">
				    		<b>- Hierarchy entry:</b>  
				    	</td>
				    	<td class="even">
				    		<?=BLL_hierarchy_entries::get_name($hierarchy_entry_id)?>
				    	</td>
				    </tr>
				<?if ($select_hotlists == 1) {?>
                                    <tr>
                                        <td class="odd" colspan="2"><b>Only load hotlists</b></td>
                                    </tr>
                                <?}?>
				    <tr>
				    	<td class="odd">
				    		<b>- Have Text:</b>  
				    	</td>
				    	<td class="odd">
				    		<?
					            switch ($have_text) {
					                case -1:
					                    echo 'All';
					                    break;
					                case 0:
					                    echo 'No';
					                    break;
					                case 1:
					                    echo 'Yes';
					                    break;
					            }
					        ?>
				    	</td>
				    </tr>
				    <?if ($have_text != 0) {?>
				    <tr>
				    	<td class="odd">
				    		&nbsp;&nbsp;&nbsp;&nbsp;Vetted:  
				    	</td>
				    	<td class="even">
				    		<?  if (strrpos($vetted_text, "0")>0)
						            echo ("Unknown &nbsp;&nbsp;&nbsp;");
						        if (strrpos($vetted_text, "4")>0)
						            echo ("Untrusted &nbsp;&nbsp;&nbsp;");
						        if (strrpos($vetted_text, "5")>0)
						            echo ("trusted");?>
				    	</td>
				    </tr>
				    <tr>
				    	<td class="odd">
				    		&nbsp;&nbsp;&nbsp;&nbsp;Curated:  
				    	</td>
				    	<td class="even">
				    		<?  switch ($text_curated) {
					                case -1:
					                    echo 'All';
					                    break;
					                case 0:
					                    echo 'No';
					                    break;
					                case 1:
					                    echo 'Yes';
					                    break;
					            }?>
				    	</td>
				    </tr>
				    <?}?>
				    <tr>
				    	<td class="odd">
				    		<b>- Have Images:</b>  
				    	</td>
				    	<td class="odd">
				    		<?
					            switch ($have_images) {
					                case -1:
					                    echo 'All';
					                    break;
					                case 0:
					                    echo 'No';
					                    break;
					                case 1:
					                    echo 'Yes';
					                    break;
					            }
					        ?>
				    	</td>
				    </tr>
				    <?if ($have_images != 0) {?>
				    <tr>
				    	<td class="odd">
				    		&nbsp;&nbsp;&nbsp;&nbsp;Vetted:  
				    	</td>
				    	<td class="even">
				    		<?  if (strrpos($vetted_images, "0")>0)
						            echo ("Unknown &nbsp;&nbsp;&nbsp;");
						        if (strrpos($vetted_images, "4")>0)
						            echo ("Untrusted &nbsp;&nbsp;&nbsp;");
						        if (strrpos($vetted_images, "5")>0)
						            echo ("trusted");?>
				    	</td>
				    </tr>
				    <tr>
				    	<td class="odd">
				    		&nbsp;&nbsp;&nbsp;&nbsp;Curated:  
				    	</td>
				    	<td class="even">
				    		<?  switch ($images_curated) {
					                case -1:
					                    echo 'All';
					                    break;
					                case 0:
					                    echo 'No';
					                    break;
					                case 1:
					                    echo 'Yes';
					                    break;
					            }?>
				    	</td>
				    </tr>
				    <?}?>
				</table>    
     			</div>
     			<div style="clear:both"><br/><br/></div>
     			<h2>Species Results</h2>
     			<div style="border:1px solid #C6C6C6; border-top:none;">
		        <table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3"width="100%">
    
		            <tr>
			            <td class="even">
			            	<ul>       
			        		<?for ($i=0; $i<count($taxon_concept_Array); $i++) {?>	            
			                 	<li><a href="<?=$eol_site_url?>/pages/<?=$taxon_concept_Array[$i]?>" target="_blank">
			                   		<?=BLL_taxon_concepts::get_name($taxon_concept_Array[$i], $hierarchy_id)?>
			                   	</a></li>	                
			            	<?}?>
			            	</ul>
			        	</td>
		            </tr>
		        	<tr>
		            	<td class="table_head" style="padding-left: 20px;">Comments</td>
		            </tr>
		            <tr>
		            	<td style="padding-left: 20px;">
		            			<textarea name="comments" rows="4" cols="58"></textarea>
		            			<input type="submit" value="Save and submit to Task Distributor" class="btn"/>
		            	</td>
		            </tr>
		        </table>
        	</div>
        	</form>
        </div>
    </div>
    
    <script>
    ActiveLink('select');
    </script>
    <? include ('../master/footer.php');?>     
</body>
