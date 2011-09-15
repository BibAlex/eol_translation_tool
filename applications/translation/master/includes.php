<?php
include_once '../../../classes/PDO_Connection.php';
include_once '../../../config/constants.php';

	function validate_session($section_name) 
	{
		if (!isset($_SESSION['user_id']))
			header('location:../users/login.php');	
			
		switch ($section_name) {
		    case 'selection':
		        if (!isset($_SESSION['selector']) || $_SESSION['selector'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
		    case 'task_distribution':
		        if (!isset($_SESSION['task_distributor']) || $_SESSION['task_distributor'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
		    case 'translation':
		        if (!isset($_SESSION['translator'])|| $_SESSION['translator'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
		    case 'linguistic_review':
		        if (!isset($_SESSION['linguistic_reviewer'])|| $_SESSION['linguistic_reviewer'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
	        case 'scientific_review':
		        if (!isset($_SESSION['scientific_reviewer'])|| $_SESSION['scientific_reviewer'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
	        case 'final_edit':
		        if (!isset($_SESSION['final_editor'])|| $_SESSION['final_editor'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
	        case 'users':
		        if (!isset($_SESSION['super_admin'])|| $_SESSION['super_admin'] != 1)
		        	header('location:../users/unauthorized.php');
		        break;
		}//end case
	}
	
	
	
	function validate_taxon_access($process, $taxon_id) 
	{
		try {
			if (!isset($_SESSION['user_id']))
				header('location:../users/login.php');
		
			$taxon = BLL_taxon_concepts::Select_taxon_concept('slave', $taxon_id);
			if($taxon==null)
				header('location:../users/unauthorized.php');
			switch ($process) 
			{	   
			    case 2: //'translation': assigned or picked
			       	if($taxon->translator_id!=$_SESSION['user_id'])
			        	header('location:../users/unauthorized.php');
			        break;
		        case 3: //'scientific_review': assigned
			        if($taxon->scientific_reviewer_id!=$_SESSION['user_id'])
			        	header('location:../users/unauthorized.php');
			        break;
		        case 4: //'linguistic_review' assigned
			        if($taxon->linguistic_reviewer_id!=$_SESSION['user_id'])
			        	header('location:../users/unauthorized.php');
			        break;
		        case 5: //'final_edit':   From pool
			       //No special handling since can select from pool if he has that privilege
			        break;
			}//end case
	
		} catch (Exception $e) {
			echo 'sara';
            header('location:../users/unauthorized.php');
        }		
	}
	
	function processName($process) 
	{
		switch ($process) 
		{	   
		    case 2: 'Translation'; break;
	        case 3: 'Linguistically Reviewed';   break;
	        case 4: 'Scientifically Reviewed';   break;
	        case 5: 'Final Editing';   break;
		}//end case
	}

?>