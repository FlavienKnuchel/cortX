
<?php
/*
* user_inscriptions.php
*
* Author : Andréane et Noémie
* Date : 18.06.2013
*
* Description : user inscriptions, with old events
*/
include 'header.php';
$smarty->assign('startingDateEvent','getStartingDate Event');
$smarty->assign('event_name','getName Event');
$smarty->display('user_inscriptions.tpl');
include 'userbar.php';
?>
