<div class="form" align="center">
<h2>


<?php
	
	if($updatedTaxon){
		?>
			Thank you for your effort
			<br/><br/>However, <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a> has got new updated objects. 
			<br/><br/>It will be redistributed for Translation.
		<?php 
	}
	else{
		if($process==2){
			?>
			Thank you for your effort
			<br/><br/>Translation of <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a> has been completed. 
			<br/><br/>No further modifications are allowed. 
			<br/><br/>Now the translated material will be submitted to Scientific
		Review. 
		<?php }else if($process==3){?>
			Thank you for your effort
			<br/><br/>Scientific review of <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a> has been completed. 
			<br/><br/>No further modifications are allowed. 
			<br/><br/>Now the scientifically reviewed material will be submitted to
		Linguistic Review.
		<?php }else if($process==4){?>
			Thank you for your effort
			<br/><br/>Linguistic review of <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a> has been completed. 
			<br/><br/>No further modifications are allowed. 
			<br/><br/>Now the linguistically reviewed material will be submitted to the final editing phase.
		<?php }else if($process==5){?>
			Thank you for your effort
			<br/><br/>Final Editing of <a target="_blank" href="<?=$eol_site_url?>/pages/<?=$taxon->id?>"><?=$taxon->scientificName?></a> has been completed. 
			<br/><br/>No further modifications are allowed. 
			<br/><br/>Now the finally edited material will be waiting to be published.
		<?php }	
	}
	?>
</h2>
</div>
