<?php
include("Mail.php");


class SendMail 
{	
	 static function send_email($to, $subject, $message) {
		$recipients = $to;
		$headers["From"] = $GLOBALS['From_Mail'];
		$headers["Subject"] = $subject;
		$headers['Content-Type'] = 'text/html; charset=UTF-8';		
		if(strpos($recipients, '@bibalex.org')==true) {
			//$smtpinfo["host"] = "mail.bibalex.org";
			$smtpinfo["host"] =  $GLOBALS['Internal_Mail_Server'];
			$smtpinfo["port"] = "25";			
		} else {
			$smtpinfo["host"] =  $GLOBALS['External_Mail_Server'];
			$smtpinfo["port"] = "25";			
		}		
		$mail_object =& Mail::factory("smtp", $smtpinfo);
		return $mail_object->send($recipients, $headers, $message.$GLOBALS['Email_Signature']);		

	}
}
?>