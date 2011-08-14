<?php
	
	//Load current Object info	 
	$EnObj = BLL_data_objects::Select_DataObjects_ByID('slave',$objectID);       
	$ArObj = BLL_a_data_objects::Select_a_data_objects_ByID($objectID);//select latest version of that object at any process

	$object_title='';
	$rights_statement='';
	$rights_holder='';
	$description='';	
	$location='';
	
	//Load data of last data Object
	if($ArObj!=null)
	{
	   	$object_title = $ArObj->object_title;
	   	$rights_statement = $ArObj->rights_statement ;
	 	$rights_holder = $ArObj->rights_holder;
	 	$description = $ArObj->description;
	 	$location = $ArObj->location;
	}
	
	$onlyView = 1;    
?>
    <!-- -------------------------Begin of Data Object Form -------------------- -->


   
	<div class="form">
		<h2>
			<span style="float:left">
				Species Form   <span style="font-color:#666666;font-size:12px;font-weight: none;"> &nbsp;&nbsp;&nbsp;&nbsp;(<?php echo 'Form ID='.$EnObj->id?>)</span>
			</span>	
          	<br/>
          	<span style="font-size:10px; font-color:#666666; font-family: Arial,Helvetica,sans-serif; font-weight: none; text-transform:none;">
          		          	
          	<?			    
          		if($ArObj!=null){
          	?>
				<b>Last modified by</b>: <i><?echo BLL_users::get_user_name($ArObj->user_id)?></i>, <b>on </b><?echo $ArObj->modified_at?><i> (
					<?
          				if($ArObj->locked==0)
          					echo BLL_status::Select_Status_ByID($ArObj->process_id-1).' Finished';
          				else
          					echo 'Pending '.BLL_status::Select_Status_ByID($ArObj->process_id);
          			?>
          		)</i>
          	<? } else echo 'Not translated yet';?>
          	
          	</span>
          </h2>      
         
			<div style="border:1px solid #C6C6C6; border-top:none;">
				<table  border="0" cellpadding="10" cellspacing="0" width="100%">
             		<?php if(TRIM($EnObj->object_title)=='') $display="none"; else $display="block"; ?>
              		<tr >
                		<td class="odd_left" width="108">Title (En):</td>
                		<td class="odd" style="width:531px"><?=$EnObj->object_title?></td>
              		</tr>
              		<tr >
                		<td class="even_left" width="108">Title (Ar):</td>
                		<td class="even_border" style=" text-align:right; width:531px">
                			<?php echo $object_title.'&nbsp;'; ?>
                		</td>
              		</tr>
              		<tr>
                		<td class="odd_left" width="108">Location (En):</td>
                		<td class="odd">
                			<div style="overflow: auto; max-height: 200px; width:531px">
                				<?=$EnObj->location?> 
                			</div>
                		</td>
              		</tr>
              		<tr >
                		<td class="even_left"  width="108">Location (Ar):</td>
                		<td class="even_border" style="text-align:right; width:531px; direction:rtl;">
        	    			<div style="overflow: auto; max-height: 200px; width:531px"">
          						<?php echo  $location.'&nbsp;';?>
          					</div>          		
                		</td>
              		</tr>
              		<tr >
                		<td class="odd_left"  width="108">Rights Stat. (En):</td>
                		<td class="odd"  style="width:531px"><?=$EnObj->rights_statement?></td>
              		</tr>
              		<tr>
                		<td class="even_left"  width="108">Rights Stat. (Ar):</td>
                		<td class="even_border" style=" text-align:right; width:531px">                   
	                   		<?php
								//If only view so do not display buttons
	          					echo $rights_statement.'&nbsp;';          				
							?>
                		</td>
              		</tr>
              		<tr >
                		<td class="odd_left" width="108">Rights Holder (En):</td>
                		<td class="odd" style="width:531px"><?=$EnObj->rights_holder?></td>                				   
              		</tr>
              		<tr >
                		<td class="even_left"  width="108">Rights Holder (Ar):</td>
                		<td class="even_border" style=" text-align:right; width:531px">
	                    	<?php                    
								echo $rights_holder.'&nbsp;';          			
							?>
                		</td>
              		</tr>
              		<tr>
                		<td class="odd_left" width="108">Details (En):</td>
                		<td class="odd">
                			<div style="overflow: auto; max-height: 200px; width:531px">
                				<?=$EnObj->description?> 
                			</div>
                		</td>
              		</tr>
              		<tr >
                		<td class="even_left"  width="108">Details (Ar):</td>
                		<td class="even_border" style="text-align:right; width:531px; direction:rtl;">
        	    			<div style="overflow: auto; max-height: 200px; width:531px"">
          						<?php echo  $description.'&nbsp;';?>
          					</div>          		
                		</td>
              		</tr>
            	</table>
			</div>          
		</div>
    
       <!-- -------------------------End of Data Object Form-------------------- -->
        
