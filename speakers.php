
<?php
/*
* speakers.php
*
* Author : Noémie Sandoz et Andréane Mercier
* Date : 17.06.2013
*
* Description : list of all the speakers that participated in this TEDx
*/
include 'header.php';
$smarty->assign('year', 'getYear Speaker');
$smarty->assign('name_speaker', 'getName Speaker');
$smarty->display('speakers.tpl');
include 'userbar.php';
?>
