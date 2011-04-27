<div class="wrapper">
  <div class="banner">
    <div class="ba_logo">
      <p>Powered by:</p>
      <a href="http://www.bibalex.org" target="_blank"><img src="../images/BA_Logo.png" alt="Bibliotheca Alexandrina" /></a> </div>
    <div class="welcome">
      <ul>
        <li><a href="#"><img src="../images/Welcome_btn.jpg" /></a>
          <ul>
            <li style="background: url(../images/change_profile.jpg) no-repeat center top; height: 28px; width:141px;"><a href="../users/change_profile.php">Change Profile</a> </li>
            <li style="background: url(../images/change_password.jpg) no-repeat center top; height: 28px; width:141px;"><a href="../users/change_password.php">Change Password</a> </li>
            <li style="background: url(../images/logout.jpg) no-repeat center top; height: 28px; width:141px;"><a href="../users/logout.php">Logout</a> </li>

          </ul>
        </li>
      </ul>
      <span class="User_Name"><a name="Test"><?=$_SESSION['name']?></a></span>
      <p>Welcome</p>
    </div>    
  </div>
  <div>
    
    <div class="links">
      <ul>
        <?if ($_SESSION['selector'] == 1) {?>
        <li>
          <div id='select_l' class="left_side"></div>
          <div id='select_m' class="link_middle"><a href="../Selection/select.php">Selection</a></div>
          <div id='select_r' class="right_side"></div>
        </li>
        <?}?>
        <?if ($_SESSION['task_distributor'] == 1) {?>
        <li>
          <div id='task_l' class="left_side"></div>
          <div id='task_m' class="link_middle"><a href="../task_distribution/pending_species.php">Task Distribution</a></div>
          <div id='task_r' class="right_side"></div>
        </li>
        <?}?>
        <?if ($_SESSION['translator'] == 1) {?>
        <li>
          <div id='trans_l' class="left_side"></div>
          <div id='trans_m' class="link_middle"><a href="../list/mylist.php?process=2">Translation</a></div>
          <div id='trans_r' class="right_side"></div>
        </li>
        <?}?>
        <?
        if ($_SESSION['linguistic_reviewer'] == 1) {?>
        <li>
          <div id='ling_l' class="left_side"></div>
          <div id='ling_m' class="link_middle"><a href="../list/mylist.php?process=3">Linguistic Review</a></div>
          <div id='ling_r' class="right_side"></div>
        </li>
        <?}?>
        <? 
        if ($_SESSION['scientific_reviewer'] == 1) {?>
        <li>
          <div id='scien_l' class="left_side"></div>
          <div id='scien_m' class="link_middle"><a href="../list/mylist.php?process=4">Scientific Review</a></div>
          <div id='scien_r' class="right_side"></div>
        </li>
        <?}?>
        <?if ($_SESSION['final_editor'] == 1) {?>
        <li> 
          <div id='final_l' class="left_side"></div>
          <div id='final_m' class="link_middle"><a href="../list/mylist.php?process=5">Final Editing</a></div>
          <div id='final_r' class="right_side"></div>
        </li>
        <?}?>
        <?if ($_SESSION['task_distributor'] == 1) {?>
        <li>
          <div id='report_l' class="left_side"></div>
          <div id='report_m' class="link_middle"><a href="../report/summary.php">Report</a></div>
          <div id='report_r' class="right_side"></div>
        </li>
        <?}?>
         <?if ($_SESSION['super_admin'] == 1) {?>
        <li>
          <div id='user_l' class="left_side"></div>
          <div id='user_m' class="link_middle"><a href="../users/list_users.php">Users</a></div>
          <div id='user_r' class="right_side"></div>
        </li>
        <?}?>
      </ul>
    </div>
    <div style="clear:both;"></div>
    <div class="content">
    
     