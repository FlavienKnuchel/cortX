
<?php
/*
* event.php
*
* Author :
* Date : 14.06.2013
*
* Description : page describing the actual event and the old events
*/
include '../header.php';
$smarty->assign('EventID','getNo Event');
$smarty->display('events.tpl');
include '../userbar.php';
?>
