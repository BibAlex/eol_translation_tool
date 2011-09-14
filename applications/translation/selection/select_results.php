<?php 

include_once ('../master/includes.php');
include_once '../../../classes/BLL/BLL_hierarchy_entries.php';
include_once '../../../classes/DAL/DAL_hierarchy_entries.php';
include_once '../../../classes/BLL/BLL_hierarchies.php';
include_once '../../../classes/DAL/DAL_hierarchies.php';
include_once '../../../classes/BLL/BLL_taxon_concepts.php';
include_once '../../../classes/DAL/DAL_taxon_concepts.php';


validate_session('selection');

if (!isset($_POST['lstHierarchy']))
    header('Location: select.php');

$hierarchy_id = intval($_POST['lstHierarchy']);
$hierarchy_entry_id = intval($_POST['hierarchy_entry_id']);
$have_text = intval($_POST['have_text']);
if ($have_text != 0) 
	$text_curated = intval($_POST['text_curated']);
else 
	$text_curated = -1;
	
$have_images = intval($_POST['have_images']);

if ($have_images != 0)
	$images_curated = intval($_POST['images_curated']);
else
	$images_curated = -1;

$select_hotlists = intval($_POST['select_hotlists']);

// getting vetted text checkboxes in one string
$vetted_text='-1';
if ($have_text != 0) { 
	$vetted_text_Array = $_POST['text_vetted'];
	
	
	if (!empty($vetted_text_Array)) {
	    for ($i=0; $i<count($vetted_text_Array); $i++) {
	        $vetted_text .= $vetted_text_Array[$i];
	        if ($i < count($vetted_text_Array)-1)
	            $vetted_text .= ',';
	    }
	}
}

$select_sub = intval($_POST["select_sub"]);

// getting vetted images checkboxes in one string

$vetted_images='-1';
if ($have_text != 0) {
	$vetted_images_Array = $_POST['images_vetted'];
	if (!empty($vetted_images_Array)) {
	    for ($i=0; $i<count($vetted_images_Array); $i++) {
	        $vetted_images = $vetted_images.$vetted_images_Array[$i];
	        if ($i < count($vetted_images_Array)-1)
	            $vetted_images .= ',';
	    }
	}
} 

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Selection Results</title> 	
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
	     <script type="text/javascript">
        	function check_all() {
        		with (document.frm) {
        			for (var i=0; i < elements.length; i++) {
	        			if (elements[i].type == 'checkbox' && elements[i].name == 'taxon_concept[]')
	        			elements[i].checked = true;
	        			}
        			}            	           	
        	}

        	function uncheck_all() {
        		with (document.frm) {
        			for (var i=0; i < elements.length; i++) {
	        			if (elements[i].type == 'checkbox' && elements[i].name == 'taxon_concept[]')
	        			elements[i].checked = false;
	        			}
        			}     	            	
        	}            
        </script>
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
		        <li class="toc" ><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;" href="select.php">New Selection</a></li>
		        <li class="toc"><a href="show_selections.php">Old Selections</a></li>		        	        
		    </ul>
	    </div>    
	    <form name="frm" method="post" action="select_save.php" onsubmit="return validateForm(this)">
			<div class="form"> 
		    	<h2>Search for</h2>
		        <div style="border:1px solid #C6C6C6; border-top:none;">
    
			        <input type="hidden" name="hierarchy_id" value="<?echo ($hierarchy_id)?>"/>
			        <input type="hidden" name="hierarchy_entry_id" value="<?echo ($hierarchy_entry_id)?>"/>
			        <input type="hidden" name="have_text" value="<?echo ($have_text)?>"/>
			        <input type="hidden" name="text_curated" value="<?echo ($text_curated)?>"/>
			        <input type="hidden" name="vetted_text" value="<?echo ($vetted_text)?>"/>
			        <input type="hidden" name="have_images" value="<?echo ($have_images)?>"/>
			        <input type="hidden" name="images_curated" value="<?echo ($images_curated)?>"/>
			        <input type="hidden" name="vetted_images" value="<?echo ($vetted_images)?>"/>		
				<input type="hidden" name="select_hotlists" value="<?echo ($select_hotlists)?>" />
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
						<td class="odd" colspan="2"><b>Only load hotlist species</b></td>
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

			
		        <?$hierarchy_entries = BLL_hierarchy_entries::search($hierarchy_id, $hierarchy_entry_id,
		                                     $have_text, trim($text_curated), preg_split("/,/",$vetted_text),
		                                     $have_images, trim($images_curated), preg_split("/,/",$vetted_images), $select_sub, $select_hotlists)?>
				<div style="clear:both;"><br/><br/></div>
        
       			 <h2>Search Results</h2>
		          	<div style="border:1px solid #C6C6C6; border-top:none;">

				        <table border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3" width="100%">
				            <tr>
				                <td class="table_head">ID</td>
				                <td class="table_head" width="200px">Species Name</td>
				                <td class="table_head" width="40px"><center>Status</center></td>
				                <td class="table_head" style="text-align:center;"><center>Text Objects</center></td>
				                <td class="table_head"><center>Images</center></td>
				                <td class="table_head"><center>Video/Audio</center></td>
				            </tr>
				            <?
				            $Count=0;
							$td_class='odd';
				            foreach ($hierarchy_entries as $hierarchy_entry) {
				            	if ($hierarchy_entry->total_text_objects > 0 || $hierarchy_entry->total_image_objects > 0) {
					            	if ($td_class=='odd') $td_class='even'; else $td_class='odd';	
					            	?>
					                <tr>
					                	<td class="<?=$td_class?>"><?=$hierarchy_entry->taxon_concept_id?></td>
					                    <td class="<?=$td_class?>">
					                    	<a href="<?=$eol_site_url?>/pages/<?=$hierarchy_entry->taxon_concept_id?>" target="_blank">
					                    		<?=$hierarchy_entry->string?>
					                    	</a>
					                    </td>
					                    <td class="<?=$td_class?>">
					                    <center>
					                        <? if (BLL_taxon_concepts::exists_on_slave($hierarchy_entry->taxon_concept_id)) {
					                            echo('Selected');
					                        } else {
					                            $Count++;
					                                ?><input type="checkbox" name="taxon_concept[]" value="<?=$hierarchy_entry->taxon_concept_id?>" /><?					                                                            
					                        }?>
											</center>
					                    </td>
					                    <td class="<?=$td_class?>"><center><?=$hierarchy_entry->total_text_objects?></center></td>
					                    <td class="<?=$td_class?>"><center><?=$hierarchy_entry->total_image_objects?></center></td>
					                    <td class="<?=$td_class?>"><center><?=$hierarchy_entry->total_other_objects?></center></td>
					                </tr>
					            <?}
				            
				            	}?>
				            <tr>
				            	<td class="table_head" colspan="6">
									<?echo strval($Count)." new species found";
									if ($Count>0) {					
									?>
									<br/>
									<a href="javascript:check_all()">Check all</a> / 
									<a href="javascript:uncheck_all()">Uncheck all</a>
									
				        			<br>
				        			<input type="submit" value="Save" class="btn"/>
				        			<?}?>
								</td>
				            </tr>
				        </table>
       				 </div>
        		</div>
        	</form>
        </div>
        
   
    <script>
    ActiveLink('select');

    function validateForm(frm) {
        <?if ($Count>0) {?>
        var SelectCount = 0;
        with (document.frm) {
			for (var i=0; i < elements.length; i++) {
    			if (elements[i].type == 'checkbox' && elements[i].name == 'taxon_concept[]')
    				if (elements[i].checked) {
                        SelectCount++;
                    }
    			}
			}    
           
            
            if (SelectCount==0) {
                alert("You must select at least one species");
                return false;
            }
            return confirm('Are you sure you want to proceed with the selected species');
            
        <?} else {?>
            return false;
        <?}?>

    }
    </script>
    <? include ('../master/footer.php');?>     
</body>
</html>
