
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
//declare the request arguments
$searchArgs= array();
//get back the result of the request
$messageSearchEvents = $tedx_manager->searchEvents($searchArgs);
//get back the list of all the events
$events=$messageSearchEvents->getContent();
//stock the events list in smarty
$smarty->assign('eventsObjects', $events);
//create an array containing all the slots of the first event
$smarty->assign('slots',array($tedx_manager->getSlotsFromEvent($events[0])));


//test location
echo $tedx_manager->getLocationFromEvent($events[0])->getContent();



$smarty->assign('no_slot','getNo Slot');
$smarty->assign('startingTime_slot','getStartingTime Slot');
$smarty->assign('endingTime_slot','getEndingTime Slot');
$smarty->assign('positionSpeaker','getPosition Slot');
$smarty->assign('speakerName','getSpeaker Name');
$smarty->assign('locationNameEvent','getLocationName Event');
$smarty->display('events.tpl');
include 'userbar.php';
?>
