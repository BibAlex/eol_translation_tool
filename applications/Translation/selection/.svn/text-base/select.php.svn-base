<?php 

require_once '../master/includes.php';
include_once '../controls/HierarchyList.php';

validate_session('selection');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Selection Page</title> 	
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
		        <li class="toc">
		        	<a href="select.php" style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;">New Selection</a>
		        </li>
		        <li class="toc"><a href="show_selections.php">Old Selections</a></li>		        	        
		    </ul>
	    </div>    
		<div class="form">  
		  <h2>Classification</h2> 
 <form name="frm" id="frm" method="post" action="select_results.php" onsubmit="return validateForm(this)">
        <input type="hidden" name="hierarchy_entry_id" value="0" />
       
    
   	<div style="border:1px solid #C6C6C6; border-top:none;">
   	 
    <table width="100%" border="0" style="border-collapse:collapse" cellspacing="0" cellpadding="3">	
	    <tr>
	    	<td class="even" colspan="2">
	    		<?php LoadHierarchyList(false, 'changeClassification', $default_hierarchy_id);?>  
	    	</td>
	    </tr>
	    
	    <tr>
	    	<td class="even" colspan="2">
	    		<div id="h_container" style="height: 250px; width: 100%; overflow: scroll"></div>
	    		<script type="text/javascript">
	
				    var tree = new tree_component();
				
				    function initTree(id) {
				        //alert(id);
				        tree.init($("#h_container"), {
				            data  : {
				              type : "json",
				              async : true,
				              url : "hierarchy_entries_xml.php?h_id=" + id
				            },
				            callback : {
				                onchange : function(NODE,TREE_OBJ) {
				                    var node_id = NODE.id;
				                    if (isNaN(node_id))
				                        document.frm.hierarchy_entry_id.value=0;
				                    else
				                        document.frm.hierarchy_entry_id.value=node_id;
				                }
				            },
				            ui : { dots : true, theme_name : "apple" }
				          });
				    }					
				    initTree(document.frm.lstHierarchy.value);
			    </script>
	    	</td>
	    </tr>	
	    <tr>
	    	<td class="odd" colspan="2" >
	    		<div id="dpath" style="min-height:34px">
	    		
	    		</div>	    		
	    	</td>
	    </tr>
	    <tr>
	    	<td class="even" colspan="2" style="text-align: center" >
	    		<input type="radio" name="select_sub" value="0" /> Select this entry only
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		<input type="radio" name="select_sub" value="1" checked/> Select this entry and all sub entries	    		
	    	</td>
	    </tr>
	    <tr>
	    	<td class="table_head">Text data objects</td>
	    	<td class="table_head">Image data objects</td>
	    </tr>
		<tr>
	    	<td class="even">
	    		<b>Species Have Text:</b>
			    <input type="radio" name="have_text" value="-1" checked onclick="show_text(true)"/> All
			    <input type="radio" name="have_text" value="1" onclick="show_text(true)"/> Yes
			    <input type="radio" name="have_text" value="0" onclick="show_text(false)"/> No
			    <br/><br/>
			    <b>Vetted:</b> <input type="checkbox" name="text_vetted[]" value="5" checked/> trusted
			            <input type="checkbox" name="text_vetted[]" value="4" checked/> untrusted
			            <input type="checkbox" name="text_vetted[]" value="0" checked/> unknown
			    <br/><br/>
			    <b>Curated:</b> <input type="radio" name="text_curated" value="-1" checked/> All
			             <input type="radio" name="text_curated" value="1"/> Yes
			             <input type="radio" name="text_curated" value="0"/> No
	    	</td>	    
			<td class="even">
				<b>Species Have Images:</b>
			    <input type="radio" name="have_images" value="-1" checked checked onclick="show_images(true)"/> All
			    <input type="radio" name="have_images" value="1"  onclick="show_images(true)"/> Yes
			    <input type="radio" name="have_images" value="0"  onclick="show_images(false)"/> No
			    <br/><br/>
			    <b>Vetted:</b> <input type="checkbox" name="images_vetted[]" value="5" checked/> trusted
			            <input type="checkbox" name="images_vetted[]" value="4" checked/> untrusted
			            <input type="checkbox" name="images_vetted[]" value="0" checked/> unknown
			    <br/><br/>
			    <b>Curated:</b> <input type="radio" name="images_curated" value="-1" checked/> All
			             <input type="radio" name="images_curated" value="1"/> Yes
			             <input type="radio" name="images_curated" value="0"/> No
			</td>
		</tr>
		<tr>
			<td class="table_head" colspan="2"><input type="submit" name="SubmitBtn" id="SubmitBtn" value="Search" class="btn" /></td>
		</tr>
    </table>    
   
   </div>
    </div>
  </form>
</div>
    <script type="text/javascript">
    function changeClassification(id) {
        tree.destroy();
        document.getElementById("h_container").innerHTML = '';
        document.getElementById("h_container").innerHTML = '<img src="../images/throbber.gif" />';
        initTree(id);
    }

    function validateForm(frm) {
        if (frm.hierarchy_entry_id.value == "0") {
            alert("Please select a hierarchy entry");
            return false;
        }

        if (!validateCheckboxGroup(frm, 'text_vetted[]')) {
			alert("You must have at least one text vetted option selected");
			return false;
        }

        if (!validateCheckboxGroup(frm, 'images_vetted[]')) {
			alert("You must have at least one image vetted option selected");
			return false;
        }
        
        frm.SubmitBtn.value='Searching ...';
        frm.SubmitBtn.disabled=true;        
        return true;
    }

    function validateCheckboxGroup(frm, chkboxControl) {
    	with (frm) {
    		for (var i=0; i < elements.length; i++) {
    			if (elements[i].type == 'checkbox' && elements[i].name == chkboxControl)
            		if (elements[i].checked)
                		return true;
    		}
        }
        return false;
    }

    function show_text(isShow) {		
    	with (document.frm) {			
    		for (var i=0; i < elements.length; i++) {
				
    			if (elements[i].type == 'checkbox' && elements[i].name == 'text_vetted[]') 					
    				elements[i].disabled = !isShow;
    			
    			if (elements[i].type == 'radio' && elements[i].name == 'text_curated')
    				elements[i].disabled = !isShow;
    		}
        }
    }

    function show_images(isShow) {		
    	with (document.frm) {			
    		for (var i=0; i < elements.length; i++) {
				
    			if (elements[i].type == 'checkbox' && elements[i].name == 'images_vetted[]') 					
    				elements[i].disabled = !isShow;
    			
    			if (elements[i].type == 'radio' && elements[i].name == 'images_curated')
    				elements[i].disabled = !isShow;
    		}
        }
    }
    

    function getRadioValue(radioControl) {
        for (var i=0; i<radioControl.length; i++) {
            if (radioControl[i].checked)
                return radioControl[i].value;
        }
        return -1;
    }
 
	ActiveLink('select');    
 
    </script>
		  
		  
     	 <? include ('../master/footer.php');?>     
	</body>
  
</html> 
 