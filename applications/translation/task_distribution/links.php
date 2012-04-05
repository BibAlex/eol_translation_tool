<?if (basename($_SERVER['PHP_SELF']) == 'pending_species.php') {?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="pending_species.php">Pending species</a></li>
<?} else {?>
<li class="toc"><a href="pending_species.php">Pending species</a></li>
<?}
if (basename($_SERVER['PHP_SELF']) == 'show_finished_species.php') {
?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="show_finished_species.php">Reassign species</a></li>
<?} else {?>
<li class="toc"><a href="show_finished_species.php">Reassign species</a></li>
<?}
if (basename($_SERVER['PHP_SELF']) == 'updated_taxons.php') {
?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="updated_taxons.php">Updated Species</a></li>
<?} else {?>
<li class="toc"><a href="updated_taxons.php">Updated Species</a></li>
<?}
if (basename($_SERVER['PHP_SELF']) == 'show_selections.php') {
?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="show_selections.php">Pending tasks</a></li>
<?} else {?>
<li class="toc"><a href="show_selections.php">Pending tasks</a></li>
<?}
if (basename($_SERVER['PHP_SELF']) == 'finished_selections.php') {
?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="finished_selections.php">Finished tasks</a></li>
<?} else {?>
<li class="toc"><a href="finished_selections.php">Finished tasks</a></li>
<?}
if (basename($_SERVER['PHP_SELF']) == 'search.php') {
?>
<li class="toc"><a style="background: url(../images/toc_hover.gif) scroll transparent no-repeat 25px 3px;background-color:#E8E8E8;"
					 href="search.php">Search for species</a></li>
<?} else {?>
<li class="toc"><a href="search.php">Search for species</a></li>
<?}?>