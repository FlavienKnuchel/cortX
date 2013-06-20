
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

/*------------------------------Upcoming events------------------------------*/
//prepare the upcoming event SQL request
$searchArgsUpcomingEvents = array(
    'where'       => "StartingDate >= '".date('Y-m-d')."'",
    'orderBy' => 'StartingDate',
    'orderByType' => 'ASC'
);
//get the upcoming Event
$messsageUpcomingEvent= $tedx_manager->searchEvents($searchArgsUpcomingEvents);
//if the message is not an error message
if($messsageUpcomingEvent->getStatus()){
    //get back the list of all the events
    $upcomingEvents=$messsageUpcomingEvent->getContent();
    //stock the events list in smarty
    $smarty->assign('upcomingEvents', $upcomingEvents);
}//if
else{
    if($messsageUpcomingEvent->getNo()==501){ //if the database connection is OK, but there is no upcoming event
        //set the upcoming events array empty
        $upcomingEvents=array();
        //stock it in smarty
        $smarty->assign('upcomingEvents', $upcomingEvents);
    }//if
    else{//if the error is a real problematic error
        //stock the error in smarty
        $smarty->assign('errorUpcomingEvents', $messsageUpcomingEvent->getMessage());
    }//else
}//else


/*------------------------------Old events------------------------------*/
//prepare the old event SQL request
$searchArgsOldEvents = array(
    'where'       => "StartingDate < '".date('Y-m-d')."'",
    'orderBy' => 'StartingDate',
    'orderByType' => 'ASC'
);
//get the actual Event
$messageOldEvents= $tedx_manager->searchEvents($searchArgsOldEvents);
//if the message is not an error message
if($messageOldEvents->getStatus()){
    //get back the list of all the events
    $oldEvents=$messageOldEvents->getContent();
    //stock the events list in smarty
    $smarty->assign('oldEvents', $oldEvents);
}//if
else{
    if($messageOldEvents->getNo()==501){ //if the database connection is OK, but there is no upcoming event
        //set the upcoming events array empty
        $oldEvents=array();
        //stock it in smarty
        $smarty->assign('oldEvents', $oldEvents);
    }//if
    else{//if the error is a real problematic error
        //stock the error in smarty
        $smarty->assign('errorOldEvents', $messageOldEvents->getMessage());
    }//else
}//else

/*------------------------------actual event------------------------------*/
if(isset($upcomingEvents)){//if the upcoming events array exists
    //get the actual Event
    $actualEvent= $upcomingEvents[0];
    //stock it in smarty
    $smarty->assign('actualEvent', $actualEvent);
}//if
else{ //if the array doesn't exist
    //no set of the actual event
}//else



/*------------------------------actual event slots------------------------------*/
//get the slots of the first event
$messageSlots=$tedx_manager->getSlotsFromEvent($actualEvent);
//if the message is not an error message
if($messageSlots->getStatus()){
    //get back the list of all the slots
    $slots=$messageSlots->getContent();
    //stock the array of slots in smarty
    $smarty->assign('slots',$slots);
}//if
else{
    if($messageSlots->getNo()==501){ //if the database connection is OK, but there is no slot
        //set the slots array empty
        $slots=array();
        //stock it in smarty
        $smarty->assign('slots', $slots);
    }//if
    else{//if the error is a real problematic error
        //stock the error variable in smarty
        $smarty->assign('errorSlot', $messageSlots->getMessage());
    }//else
}//else

/*------------------------------actual event location------------------------------*/
//get the actual event location
$messageActualEventLocation=$tedx_manager->getLocationFromEvent($actualEvent);
//if the message is not an error
if($messageActualEventLocation->getStatus()){
    //get the location object
    $actualEventLocation=$messageActualEventLocation->getContent();
    //store the location in smarty
    $smarty->assign('actualEventLocation', $actualEventLocation);
}//if
else{
    //set the actual Event array empty
    $actualEventLocation=array();
    //stock it in smarty
    $smarty->assign('actualEventLocation', $actualEventLocation);
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
