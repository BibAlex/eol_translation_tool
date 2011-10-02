<?php

class Pagination {
	static function get_paging_limit($items_per_page, $current_page) {        
        if($current_page) 
			$start = ($current_page - 1) * $items_per_page; 			//first item to display on this page
		else
			$start = 1;

		$query = ' LIMIT '.strval($start).', '.strval($items_per_page);		
		
		return $query;
		
    }
    
 
    
    static function get_links($current_page, $items_per_page, $total_count, $targetpage, $otherparam) {
    	
    	/* Setup page vars for display. */
		if ($current_page == 0) $current_page = 1;			//if no page var is given, default to 1.
		$prev = $current_page - 1;							//previous page is page - 1
		$next = $current_page + 1;							//next page is page + 1
		$lastpage = ceil($total_count/$items_per_page);		//lastpage is = total pages / items per page, rounded up.
		$lpm1 = $lastpage - 1;								//last page minus 1
		$adjacents = 3;										// How many adjacent pages should be shown on each side?
		
		/* 
			Now we apply our rules and draw the pagination object. 
			We're actually saving the code to a variable in case we want to draw it more than once.
		*/
		$pagination = "";
		if($lastpage > 1)
		{	
			$pagination .= "<div class=\"pages\">";
			//previous button
			if ($current_page > 1) 
				$pagination.= "<a href=\"$targetpage?page=$prev$otherparam\" class=\"nextprev\">Previous</a>";
			else
				$pagination.= "<span class=\"nextprev\">Previous</span>";	
			
			//pages	
			if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
			{	
				for ($counter = 1; $counter <= $lastpage; $counter++)
				{
					if ($counter == $current_page)
						$pagination.= "<span class=\"current\">$counter</span>";
					else
						$pagination.= "<a href=\"$targetpage?page=$counter$otherparam\">$counter</a>";					
				}
			}
			elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
			{
				//close to beginning; only hide later pages
				if($current_page < 1 + ($adjacents * 2))		
				{
					for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
					{
						if ($counter == $current_page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?page=$counter$otherparam\">$counter</a>";					
					}
					$pagination.= "<span>...</span>";
					$pagination.= "<a href=\"$targetpage?page=$lpm1$otherparam\">$lpm1</a>";
					$pagination.= "<a href=\"$targetpage?page=$lastpage$otherparam\">$lastpage</a>";		
				}
				//in middle; hide some front and some back
				elseif($lastpage - ($adjacents * 2) > $current_page && $current_page > ($adjacents * 2))
				{
					$pagination.= "<a href=\"$targetpage?page=1$otherparam\">1</a>";
					$pagination.= "<a href=\"$targetpage?page=2$otherparam\">2</a>";
					$pagination.= "<span>...</span>";
					for ($counter = $current_page - $adjacents; $counter <= $current_page + $adjacents; $counter++)
					{
						if ($counter == $current_page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?page=$counter$otherparam\">$counter</a>";					
					}
					$pagination.= "<span>...</span>";
					$pagination.= "<a href=\"$targetpage?page=$lpm1$otherparam\">$lpm1</a>";
					$pagination.= "<a href=\"$targetpage?page=$lastpage$otherparam\">$lastpage</a>";		
				}
				//close to end; only hide early pages
				else
				{
					$pagination.= "<a href=\"$targetpage?page=1$otherparam\">1</a>";
					$pagination.= "<a href=\"$targetpage?page=2$otherparam\">2</a>";
					$pagination.= "<span>...</span>";
					for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
					{
						if ($counter == $current_page)
							$pagination.= "<span class=\"current\">$counter</span>";
						else
							$pagination.= "<a href=\"$targetpage?page=$counter$otherparam\">$counter</a>";					
					}
				}
			}
			
			//next button
			if ($current_page < $counter - 1) 
				$pagination.= "<a href=\"$targetpage?page=$next$otherparam\" class=\"nextprev\">Next</a>";
			else
				$pagination.= "<span class=\"nextprev\">Next</span>";
			$pagination.= "</div>\n";		
		}
		return $pagination;
    }
	
    static function get_current_page($total_count, $items_per_page) {
    	$current_page=1;
    	if (isset($_GET["page"]))
    	{
    		if (!is_numeric($_GET["page"]))
    			return $current_page;
    		if (intval($_GET["page"]) <0)
    			return $current_page;
    		$current_page = intval($_GET["page"]);
    	}
    	
    	else if (isset($_POST["page"]))
    	{
    		if (!is_numeric($_POST["page"]))
    			return $current_page;
    		if (intval($_POST["page"]) <0)
    			return $current_page;
    		$current_page = intval($_POST["page"]);
    	}
    	else
    		return $current_page;
    	
    	$lastpage = ceil($total_count/$items_per_page);	
    	
    	if ($lastpage<$current_page)
    		$current_page = $lastpage;
    		
    	return $current_page;
    		
    }
}
?>