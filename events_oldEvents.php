
<?php
/*
* events_oldEvents.php
*
* Author : Andreane et Noemie
* Date : 17.06.2013
*
* Description : page describing the previous events
*/
include 'header.php';
include 'menu_frontend.php';
$smarty->assign('startingDateEvent','getStartingDate Event');
$smarty->assign('descriptionEvent','getDescription Event');
$smarty->assign('no_slot','getNo Slot');
$smarty->assign('startingTime_slot','getStartingTime Slot');
$smarty->assign('endingTime_slot','getEndingTime Slot');
$smarty->assign('positionSpeaker','getPosition Slot');
$smarty->assign('speakerName','getSpeaker Name');
$smarty->display('events_oldEvents.tpl');
include 'userbar.php';
?>
