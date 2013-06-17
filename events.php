
<?php
/*
* event.php
*
* Author : Andréane et Noémie
* Date : 17.06.2013
*
* Description : page describing the actual event and the old events
*/
include 'header.php';
$smarty->assign('mainTopicEvent','getMainTopic Event');
$smarty->assign('startingDateEvent','getStartingDate Event');
$smarty->assign('descriptionEvent','getDescription Event');
$smarty->assign('no_slot','getNo Slot');
$smarty->assign('startingTime_slot','getStartingTime Slot');
$smarty->assign('endingTime_slot','getEndingTime Slot');
$smarty->assign('positionSpeaker','getPosition Slot');
$smarty->assign('speakerName','getSpeaker Name');
$smarty->assign('eventName','getEvent Name');
$smarty->assign('locationNameEvent','getLocationName Event');
$smarty->display('events.tpl');
include 'userbar.php';
?>
