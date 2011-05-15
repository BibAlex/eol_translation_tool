<?php

class Notifications {	
	
	static function notify_task_distributor($selection_id, $user_id, $taxon_count, $criteria, $comments) {
		$message = "Selector: ".BLL_users::get_user_name($user_id)." (<a href=\"mailto:".$_SESSION["email"]."\">".$_SESSION["email"]."</a>)<br />";
		$message .= "Species Count: ".strval($taxon_count)."<br />";
		$message .= "Date: ".date("F j, Y, g:i a")."<br />";
		$message .= "<br><b><u>Comments</u></b><br>".$comments;
		$message .= "<br><br><b><u>Criteria</u></b><br>".$criteria;
		
		$users = BLL_users::get_task_distributors();
		
		foreach ($users as $user) {
			if ($user->email != '') {
				SendMail::send_email($user->email, "AEOL: New Selection", $message);
			}
		}
	}
	
	static function notify_linguistic_review($taxon) {
		if($taxon->linguistic_reviewer_id>0)
		{		
			$user = BLL_users::load_by_id($taxon->linguistic_reviewer_id);
			$user = $user[0];
			$message = 'Dear '.$user->name .',<br/>';
			$message .= 'Species \'<b>'.$taxon->scientificName. '</b>\' has been finally translated. <br/>Please check it as a Linguistic reviewer.';
			if ($user->email != '' && $user->active==1) 
				SendMail::send_email($user->email, "AEOL: New Linguistic review species", $message);
		}
	}
	
	static function notify_scientific_review($taxon) {		
		if($taxon->scientific_reviewer_id>0){
			$user = BLL_users::load_by_id($taxon->scientific_reviewer_id);
			$user = $user[0];		
			$message = 'Dear '.$user->name .',<br/>';
			$message .= 'Species \'<b>'.$taxon->scientificName. '</b>\' has been finally linguistically reviewed. <br/>Please check it as a Scientific reviewer.';		
			if ($user->email != '' && $user->active==1) 
				SendMail::send_email($user->email, "AEOL: New Scientific Review Species", $message);
		}			
	}
	
	static function notify_final_editors($taxon) {	
		$users = BLL_users::get_users_by_type('final_editor');		
		foreach ($users as $user) {
			$message = 'Dear '.$user->name .',<br/>';
			$message .= 'Species \'<b>'.$taxon->scientificName. '</b>\' has been finally scientifically reviewed. <br/>Please check it for final editing.';
			if ($user->email != '' && $user->active==1) 
				SendMail::send_email($user->email, "AEOL: New Final Editing Species", $message);
		}	
	}
}
?>
