
<?php
/*
* speakers.php
*
* Author : Noemie Sandoz et Andreane Mercier
* Date : 17.06.2013
*
* Description : list of all the speakers that participated in this TEDx
*/
include 'header.php';
include 'menu_frontend.php';
$smarty->assign('speakers_year', 'getSpeaker Year');
$smarty->assign('speaker_name', 'getSpeaker Name');
$smarty->display('speakers.tpl');
include 'userbar.php';
?>
