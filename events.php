
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
//processing of the event objects in an array
$eventsList= array();
foreach($eventsList as $event){ //for each event
    array_push($eventsList, array( //add it to the event
        'no'=>$events[0]->getNo(),
        'mainTopic'=>$events[0]->getMainTopic(),
        'startingDate'=>$events[0]->getStartingDate(),
        'endingDate'=>$events[0]->getEndingDate(),
        'startingTime'=>$events[0]->getStartingTime(),
        'endingTime'=>$events[0]->getEndingTime(),
        'isArchived'=>$events[0]->getIsArchived(),
        'description'=>$events[0]->getDescription()));
}// end of foreach


//stock the events list in smarty
$smarty->assign('events', $eventsList);
//create an array containing all the first event datas
$firstEvent= array(
    'no'=>$events[0]->getNo(),
    'mainTopic'=>$events[0]->getMainTopic(),
    'startingDate'=>$events[0]->getStartingDate(),
    'endingDate'=>$events[0]->getEndingDate(),
    'startingTime'=>$events[0]->getStartingTime(),
    'endingTime'=>$events[0]->getEndingTime(),
    'isArchived'=>$events[0]->getIsArchived(),
    'description'=>$events[0]->getDescription());


//stock the first event in smarty
$smarty->assign('firstEvent', $firstEvent);



$smarty->assign('no_slot','getNo Slot');
$smarty->assign('startingTime_slot','getStartingTime Slot');
$smarty->assign('endingTime_slot','getEndingTime Slot');
$smarty->assign('positionSpeaker','getPosition Slot');
$smarty->assign('speakerName','getSpeaker Name');
$smarty->assign('locationNameEvent','getLocationName Event');
$smarty->display('events.tpl');
include 'userbar.php';
?>
