
<?php
/*
* event.php
*
* Author : Andreane et Noemie, Flavien Knuchel
* Date : 17.06.2013
*
* Description : page describing the actual event and the old events
*/


include 'header.php';
include 'menu_frontend.php';

/*------------------------------The event------------------------------*/
//if the event number is set in the url
if(isset($_GET['eventNo'])){
    //if an event with this number exists
    if($tedx_manager->getEvent($_GET['eventNo'])->getStatus()){
        //asign this event to a variable
        $actualEvent=$tedx_manager->getEvent($_GET['eventNo'])->getContent();
        $smarty->assign('actualEvent', $actualEvent);
    }//if
}//if

/*-------------------- Are inscriptions open? (participation button display)--------------------*/
if(isset($actualEvent)){
    if($actualEvent->getStartingDate()>=date('Y-m-d')){
        $inscriptionStatus=true;
    }
    else{
        $inscriptionStatus=false;
    }
}
else{
    $inscriptionStatus=false;
}
$smarty->assign('inscriptionStatus',$inscriptionStatus);

/*------------------------------ Where did the user come from? (return button) ------------------------------*/
$userCameFrom=$_SERVER['HTTP_REFERER'];
$smarty->assign('userCameFrom',$userCameFrom);

/*------------------------------ event slots and speakers------------------------------*/
//get the slots of the first event
$messageSlots=$tedx_manager->getSlotsFromEvent($actualEvent);
//if the message is not an error message
if($messageSlots->getStatus()){
    //get back the list of all the slots
    $slots=$messageSlots->getContent();
    //declare the general slots list
    $slotsAndSpeakers=array();
    // initializing the counter
    $counter=0;
    //for each slot
    foreach($slots as $slot){
        //get back the places of this slot
        $places=$tedx_manager->getPlacesBySlot($slot)->getContent();
        //initialize the array of speakers of this slot
        $thisSlotSpeakers=array();

        if($places!=null){// if there are places in this slot
            //for each place in this slot
            foreach($places as $aPlace){
                // Catch the Speaker's Message with the $aPlace
                $messageGetSpeakerByPlace = $tedx_manager->getSpeakerByPlace($aPlace);
                // Get the Speaker, if existing
                if($messageGetSpeakerByPlace->getStatus()) {
                    // get the Speaker from message
                    $aSpeaker = $messageGetSpeakerByPlace->getContent();
                    //add the speaker to the list
                    array_push($thisSlotSpeakers, $aSpeaker);
                }//if
            }//foreach
            //create an array containing the slot and the list of speakers of that slot
            $thisSlotAndSpeakers=array('slot'=>$slot, 'speakers'=>$thisSlotSpeakers);
            //add the array we just created to the general slot and speakers list
            array_push($slotsAndSpeakers, $thisSlotAndSpeakers);
        }//if
        //increments the counter
        $counter++;
        $thisSlotSpeakers=array();
    }//foreach
    //stock the array of slots in smarty
    $smarty->assign('slots',$slots);


    //stock the general slots list in smarty
    $smarty->assign('slotsAndSpeakers',$slotsAndSpeakers);
}//if
else{
    if(!is_null($messageSlots)){ //if the database connection is OK, but there is no slot
        //set the slots array empty
        $slots=array();
        //stock it in smarty
        $smarty->assign('slots', $slots);
    }//if
}//else

/*------------------------------ event location------------------------------*/
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

//display the template
$smarty->display('event_detail.tpl');

//display the bottom userbar
include 'userbar.php';
?>
