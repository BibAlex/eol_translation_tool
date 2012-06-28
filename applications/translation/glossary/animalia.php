<script type="text/javascript">
	function showGlossary(str){
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				document.getElementById("glossaryTable").innerHTML=xmlhttp.responseText;
				document.getElementById('A').className = "";
				document.getElementById('B').className = "";
				document.getElementById('C').className = "";
				document.getElementById('D').className = "";
				document.getElementById('E').className = "";
				document.getElementById('F').className = "";
				document.getElementById('G').className = "";
				document.getElementById('H').className = "";
				document.getElementById('I').className = "";
				document.getElementById('J').className = "";
				document.getElementById('K').className = "";
				document.getElementById('L').className = "";
				document.getElementById('M').className = "";
				document.getElementById('N').className = "";
				document.getElementById('O').className = "";
				document.getElementById('P').className = "";
				document.getElementById('Q').className = "";
				document.getElementById('R').className = "";
				document.getElementById('S').className = "";
				document.getElementById('T').className = "";
				document.getElementById('U').className = "";
				document.getElementById('V').className = "";
				document.getElementById('W').className = "";
				document.getElementById('X').className = "";
				document.getElementById('Y').className = "";
				document.getElementById('Z').className = "";
				document.getElementById(str).className = "Selected";
			}
		}
		xmlhttp.open("GET","gettable.php?q="+str,true);
		xmlhttp.send();
	}
</script>
<style type="text/css">
	.Letters 
	{
		margin: 0;
		padding: 0;
		width: 598px;
	}
	.Letters li
	{
		background-color: #D7E1EB;
		border: 1px solid #999999;
		color: #133252;
		float: left;
		height: 20px;
		line-height: 21px;
		list-style: none outside none;
		margin-right: 1px;
		text-align: center;
		width: 20px;
		border-bottom:none;
		position:relative;
		top:1px;
	}
	.Letters li:hover
	{
		cursor: pointer; cursor: hand; 
		font-weight:bold;
		background-color:#003366;
		color:#fff;
	}
	.Letters .Selected
	{
		background-color: #FFFFFF;
		border-bottom: 1px solid #FFFFFF;
		
		font-weight:bold;
	}
	.Glossary
	{
		background-color:#fff;
		border: 1px solid #999999;
		padding: 10px;
		/*display:none;*/
	}
	.Glossary_Container 
	{
		background-color:#fff;
		border: 1px solid #999999;
		padding: 10px;
		width: 612px;
		height:400px;
		overflow-y:auto;
	}
	.Glossary_Container h3 
	{
		background: none repeat scroll 0 0 #003366;
		color: #FFFFFF;
		display: block;
		font-size: 0.9em;
		font-weight: bold;
		margin-bottom: 10px;
		margin-top: 0;
		padding: 4px;
	}
	.Glossary_Container .column 
	{
		width: 171px;
		margin:0 10px;
		float:left;
	}
	.Glossary_Container p
	{
		color: #333333;
		float: left;
		font-family: Arial;
		font-size: 12px;
		margin: 5px 7px;
		width: 171px;
	}
	.Glossary_BTN:hover>.Glossary 
	{
		display:block;
	}
	table {
		background-color:#eeeeee;
		width: 595px;
	}
	table,th, td
	{
		border: 1px solid #FFFFFF;
	}
</style>

<form>
	<div class="Glossary">
		<ul class="Letters">
            <li id="A" class="Selected" onclick="showGlossary('A');">A</li>
            <li id="B" onclick="showGlossary('B');">B</li>
            <li id="C" onclick="showGlossary('C');">C</li>
            <li id="D" onclick="showGlossary('D');">D</li>
            <li id="E" onclick="showGlossary('E');">E</li>
            <li id="F" onclick="showGlossary('F');">F</li>
            <li id="G" onclick="showGlossary('G');">G</li>
            <li id="H" onclick="showGlossary('H');">H</li>
            <li id="I" onclick="showGlossary('I');">I</li>
            <li id="J" onclick="showGlossary('J');">J</li>
            <li id="K" onclick="showGlossary('K');">K</li>
            <li id="L" onclick="showGlossary('L');">L</li>
            <li id="M" onclick="showGlossary('M');">M</li>
            <li id="N" onclick="showGlossary('N');">N</li>
            <li id="O" onclick="showGlossary('O');">O</li>
            <li id="P" onclick="showGlossary('P');">P</li>
            <li id="Q" onclick="showGlossary('Q');">Q</li>
            <li id="R" onclick="showGlossary('R');">R</li>
            <li id="S" onclick="showGlossary('S');">S</li>
            <li id="T" onclick="showGlossary('T');">T</li>
            <li id="U" onclick="showGlossary('U');">U</li>
            <li id="V" onclick="showGlossary('V');">V</li>
            <li id="W" onclick="showGlossary('W');">W</li>
            <li id="X" onclick="showGlossary('X');">X</li>
            <li id="Y" onclick="showGlossary('Y');">Y</li>
            <li id="Z" onclick="showGlossary('Z');">Z</li>
            <div style="clear:both;"></div>
        </ul>
	</div>
</form>
<div class="Glossary_Container">
	<?php
		include ('../master/includes.php');
	
		include_once '../../../classes/BLL/BLL_glossary.php';
		include_once '../../../classes/DAL/DAL_glossary.php';
		
		$initglossary = BLL_glossary::Select_glossary_By_Letter('A');
	?>
	<span id="glossaryTable">
		<?=$initglossary->text?>
	</span>
</div>