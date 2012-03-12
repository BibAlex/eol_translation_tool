<?php
/*
 * Created on Feb 13, 2012
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
	require_once "Text/Diff.php";
	require_once "Text/Diff/Renderer.php";
	require_once "Text/Diff/Renderer/inline.php";
	
	class Text_Compare {
		static function compare_objects($text, $newText){
			// perform diff
				$array1 = explode("^[1234567890]",$text);
				$array2 = explode("^[1234567890]", $newText);
				$diff = &new Text_Diff($array1, $array2);

				$renderer = &new Text_Diff_Renderer_inline();
				$output = $renderer->render($diff);
				
				if($output == '')
					return $text;
				return str_replace('</ins>', '</font>', 
					str_replace('<ins>', '<font color="green">', 
					str_replace('</del>', '</del></font>', 
					str_replace('<del>', '<font color="red"><del>', $output))));		
			
		}
		
		static function clean_string($str)
		{
			$clean_str = strtolower($str); //change to lower case 
			$clean_str = str_replace('&nbsp;',' ',$str); //replace html spaces tags	
			$clean_str = strip_tags($clean_str,'<img>'); //remove html tags except images
			$pattern= "/[^A-Za-z0-9 ]/";	
			$clean_str = preg_replace($pattern, '', $clean_str);//Perform a regular expression search and remove all non alphabet and non numeric characters 
			$clean_str = str_replace(' ','',$clean_str);//remove all spaces
			$clean_str = str_replace('\r\n','',$clean_str);//remove new lines
			$clean_str = str_replace('\n','',$clean_str);//remove new lines
			return $clean_str;	
		}
		
//		static function diff($old, $new){
//			$maxlen = 0;
//			foreach($old as $oindex => $ovalue){
//				$nkeys = array_keys($new, $ovalue);
//				foreach($nkeys as $nindex){
//					$matrix[$oindex][$nindex] = isset($matrix[$oindex - 1][$nindex - 1]) ?
//						$matrix[$oindex - 1][$nindex - 1] + 1 : 1;
//					if($matrix[$oindex][$nindex] > $maxlen){
//						$maxlen = $matrix[$oindex][$nindex];
//						$omax = $oindex + 1 - $maxlen;
//						$nmax = $nindex + 1 - $maxlen;
//					}
//				}	
//			}
//			if($maxlen == 0) return array(array('d'=>$old, 'i'=>$new));
//			return array_merge(
//				diff(array_slice($old, 0, $omax), array_slice($new, 0, $nmax)),
//				array_slice($new, $nmax, $maxlen),
//				diff(array_slice($old, $omax + $maxlen), array_slice($new, $nmax + $maxlen)));
//		}
//		
//		static function cmpHtmlDiff($old, $new){
//			$ret = '';
//			$diff = Text_Compare::diff(explode(' ', $old), explode(' ', $new));
//			foreach($diff as $k){
//				if(is_array($k))
//					$ret .= (!empty($k['d'])?"<del>".implode(' ',$k['d'])."</del> ":'').
//						(!empty($k['i'])?"<ins>".implode(' ',$k['i'])."</ins> ":'');
//				else $ret .= $k . ' ';
//			}
//			return $ret;
//		}
	}
?>
