<?php

	require_once "Text/Diff.php";
	require_once "Text/Diff/Renderer.php";
	require_once "Text/Diff/Renderer/inline.php";
	require_once "simplediff.php";

	//$array1 = preg_split("(gif|jpg)","awerweS gif erere jpg eldin&werwer");
	//$array2 = preg_split("(gif|jpg)", "yosra gif erere jpg eldin&srerwe");
	$array1 = explode(" ","awerweS gif erere jpg eldin&werwer");
	$array2 = explode(" ","yosra gif erere jpg eldin&srerwe");
	
	//$diff = &new Text_Diff($array1, $array2);
	
	$html_1 = "<html><head></head><body>Something</body></html>";
	$html_2 = "<html><head></head><body><p id='abc'>Something Else</p></body></html>";
	
	//Below code taken from http://www.go4expert.com/forums/showthread.php?t=4189.
	//Not sure if/how it works exactly
	
	//$diff = &new Text_Diff(htmlentities($html_1), htmlentities($html_2));
	$diff = &new Text_Diff($html_1, $html_2);
	$renderer = &new Text_Diff_Renderer_inline();
	//echo $renderer->render($diff);
//<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1> 
//</?\w+\s+[^>]*>
//
//	$renderer = &new Text_Diff_Renderer_inline();
//	$output = $renderer->render($diff);

	

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  <body>
  	<?php echo str_replace('</ins>', '</font>', 
		str_replace('<ins>', '<font color="green">', 
		str_replace('</del>', '</del></font>', 
		str_replace('<del>', '<font color="red"><del>', $renderer->render($diff)))));

		?>
  </body>
 </html>