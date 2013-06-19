
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
//declare the request arguments for events
$searchArgs= array();
//get back the result of the events request
$messageSearchEvents = $tedx_manager->searchEvents($searchArgs);
//if the message is not an error message
if($messageSearchEvents->getStatus()){
    //get back the list of all the events
    $events=$messageSearchEvents->getContent();
    //stock the events list in smarty
    $smarty->assign('eventsObjects', $events);
}//if
else{
    //display the error message
    print ('<p class="error_msg">');
    print ($messageSearchEvents->getMessage()."</p>");
}//else

//get the slots of the first event
$messageSlots=$tedx_manager->getSlotsFromEvent($events[0]);
//if the message is not an error message
if($messageSlots->getStatus()){
    //get back the list of all the slots
    $slots=$messageSlots->getContent();
    //stock the array of slots in smarty
    $smarty->assign('slots',$slots);
}
else{
    //display error message
    print ('<p class="error_msg">');
    print ($messageSlots->getMessage()."</p>");
}

//get the first event location
$messageFirstEventLocation=$tedx_manager->getLocationFromEvent($events[0]);
//if the message is not an error
if($messageSearchEvents->getStatus()){
    //get the location object
    $firstEventLocation=$messageFirstEventLocation->getContent();
    //store the location in smarty
    $smarty->assign('firstEventLocation', $firstEventLocation);
}//if
else{
    //display the error message
    print ('<p class="error_msg">');
    print ($messageFirstEventLocation->getMessage()."</p>");
}//else






$smarty->assign('no_slot','getNo Slot');
$smarty->assign('startingTime_slot','getStartingTime Slot');
$smarty->assign('endingTime_slot','getEndingTime Slot');
$smarty->assign('positionSpeaker','getPosition Slot');
$smarty->assign('speakerName','getSpeaker Name');
$smarty->assign('locationNameEvent','getLocationName Event');
$smarty->display('events.tpl');
include 'userbar.php';
?>
