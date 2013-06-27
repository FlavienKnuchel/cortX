<?php

/*
 * backend_validation_inscriptions.php
 *
 * Author : Andreane et Noemie
 * Date : 18.06.2013
 *
 * Description : page to manage the inscriptions
 */
include 'header.php';
if ($tedx_manager->isLogged() && ($tedx_manager->isAdministrator() || $tedx_manager->isSuperadmin()) ) {
$_SESSION['ariane2']="Registrations";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
include 'menu_backend.php';
$error='';
$goodMessage='';
/* ------------------------------Upcoming events------------------------------ */
//prepare the upcoming event SQL request
$searchArgsUpcomingEvents = array(
    'where' => "StartingDate >= '" . date('Y-m-d') . "'",
    'orderBy' => 'StartingDate',
    'orderByType' => 'ASC'
);
//get the upcoming Event
$messsageUpcomingEvent = $tedx_manager->searchEvents($searchArgsUpcomingEvents);
//if the message is not an error message
if ($messsageUpcomingEvent->getStatus()) {
    //get back the list of all the events
    $upcomingEvents = $messsageUpcomingEvent->getContent();
    //stock the events list in smarty
    $smarty->assign('upcomingEvents', $upcomingEvents);
}//if
else {
    if (!is_null($messsageUpcomingEvent)) { //if the database connection is OK, but there is no upcoming event
        //set the upcoming events array empty
        $error="no upcoming events";
    }//if
}//else

if(isset($_POST['select'])){
    $messageEvent=$tedx_manager->getEvent($_POST['select']);
    if($messageEvent->getStatus()){
        $event=$messageEvent->getContent();
        $smarty->assign('anEvent',$event);

        $messageRegistrations=$tedx_manager->getRegistrationsByEvent($event);
        if($messageRegistrations->getStatus()){
            $registrations=$messageRegistrations->getContent();
            $acceptedOrRejectedRegistrations=array();
            $sentRegistrations=array();
            foreach ($registrations as $registration) {//for each registrations, tests if
                switch ($registration->getStatus()) {//the status of the registration
                    case 'Pending':
                        break;
                    case 'Sent'://is sent or
                        array_push($sentRegistrations,$registration);
                        break;
                    case 'Accepted' || 'Rejected'://is already accepted
                        array_push($acceptedOrRejectedRegistrations, $registration);
                        break;
                }//for each creates an array of registrations which are processed in Smarty
            }
            $customOldRegistrations=array();
            foreach($acceptedOrRejectedRegistrations as $reg){
                $personNo=$reg->getParticipantPersonNo();
                $person=$tedx_manager->getPerson($personNo)->getContent();
                array_push($customOldRegistrations,array('registration'=>$reg,'person'=>$person));
            }
            $smarty->assign('acceptedOrRejectedRegistrations', $customOldRegistrations);
            $customRegistrations=array();
            foreach($sentRegistrations as $reg){
                $personNo=$reg->getParticipantPersonNo();
                $person=$tedx_manager->getPerson($personNo)->getContent();
                array_push($customRegistrations,array('registration'=>$reg,'person'=>$person));
            }
            $smarty->assign('sentRegistrations', $customRegistrations);
        }
        else{
            $error=$messageRegistrations->getMessage();
        }
    }
    else{
        $error=$messageEvent->getMessage();
    }
}

if(isset($_GET['eventNo'])){
    $event=$tedx_manager->getEvent($_GET['eventNo'])->getContent();
    $participant=$tedx_manager->getParticipant($_GET['personNo'])->getContent();
    $person=$tedx_manager->getPerson($_GET['personNo'])->getContent();
    $args=array('participant'=>$participant,'event'=>$event);
    $smarty->assign('anEvent',$event);
    $args = array(
        'status'       => $_GET['registrationStatus'],
        'event'        => $event,
        'participant'  => $participant
    );
    $registration=$tedx_manager->getRegistration($args)->getContent();
    $messageMotivation=$tedx_manager->getMotivationsByParticipantForEvent($args);
    $motivations=$messageMotivation->getContent();
    $motivation=$motivations[0];
    $smarty->assign('msgMotivation',$messageMotivation);
    $smarty->assign('motivation',$motivation);
    $smarty->assign('registration',$registration);
    $smarty->assign('person',$person);
}



if (isset($_POST['Accept']) && $_POST['Accept'] == 'Accept') {
    $infos=$_POST['registration'];
    $infos=explode("-",$infos);
    $participantNo=$infos[0];
    $participant=$tedx_manager->getParticipant($participantNo)->getContent();
    $regStatus=$infos[1];
    $eventNo=$infos[2];
    $event=$tedx_manager->getEvent($eventNo)->getContent();
    $args = array(
        'status'       => $regStatus,
        'event'        => $event,
        'participant'  => $participant
    );
    $reg = $tedx_manager->getRegistration($args)->getContent();
    $acceptedReg = $tedx_manager->acceptRegistration($reg);
    if ($acceptedReg->getStatus()) {
        $goodMessage='This registration was successfully registrated.';
    } else {
        $error=$acceptedReg->getMessage();
    }
} elseif (isset($_POST['Refuse']) && $_POST['Refuse'] == 'Refuse') {
    $infos=$_POST['registration'];
    $infos=explode("-",$infos);
    $participantNo=$infos[0];
    $participant=$tedx_manager->getParticipant($participantNo)->getContent();
    $regStatus=$infos[1];
    $eventNo=$infos[2];
    $event=$tedx_manager->getEvent($eventNo)->getContent();
    $args = array(
        'status'       => $regStatus,
        'event'        => $event,
        'participant'  => $participant
    );
    $reg = $tedx_manager->getRegistration($args)->getContent();
    $acceptedReg = $tedx_manager->acceptRegistration($reg);
    if ($acceptedReg->getStatus()) {
        $goodMessage='This registration was successfully registrated.';
    } else {
        $error=$acceptedReg->getMessage();
    }
    $rejectedReg = $tedx_manager->rejectRegistration($reg);
    if ($rejectedReg->getStatus()) {
        $goodMessage='This registration was successfully rejected.';
    } else {
        $error=$rejectedReg->getMessage();
    }
}
/* ---------------------------- End of upcoming events ----------------------------- */
$smarty->assign('error',$error);
$smarty->assign('goodMessage',$goodMessage);
$smarty->display('backend_validation_inscriptions.tpl');
include 'userbar.php';
} else {
    header('Location:404.php');
}
?>

