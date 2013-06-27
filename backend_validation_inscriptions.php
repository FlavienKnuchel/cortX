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
$_SESSION['ariane2']="Registrations";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
include 'menu_backend.php';

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
        $upcomingEvents = array();
        //stock it in smarty
        $smarty->assign('upcomingEvents', $upcomingEvents);
    }//if
}//else
if (isset($_REQUEST['noEvent'])) { //if an event is selected, it narrows the registrations available
    $anEvent = $tedx_manager->getEvent($_REQUEST['noEvent'])->getContent();
    $arrayOfSentReg = array();
    $sentRegistrations = array();
    $arrayOfAcceptedReg = array();
    $allRegForEvent = $tedx_manager->getRegistrationsByEvent($anEvent);
    if ($allRegForEvent->getStatus()) {
        foreach ($allRegForEvent->getContent() as $registration) {//for each registrations, tests if 
            switch ($registration->getStatus()) {//the status of the registration
                case 'Pending':
                    break;
                case 'Sent'://is sent or
                    $arraySentReg = array(
                        $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                        $tedx_manager->getParticipant($registration->getParticipantPersonNo())->getContent());
                    $arrayOfSentReg[] = $arraySentReg;
                    $sentRegistrations[] = $registration;
                    break;
                case 'Accepted' || 'Rejected'://is already accepted
                    $arrayAcceptedReg = array(
                        'event' => $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                        'person' => $tedx_manager->getPerson($registration->getParticipantPersonNo())->getContent(),
                        'status' => $registration->getStatus()
                    );
                    $arrayOfAcceptedReg[] = $arrayAcceptedReg;
                    break;
            }//for each creates an array of registrations which are processed in Smarty
        }
    }
    $smarty->assign('sentReg', $arrayOfSentReg);
    $smarty->assign('acceptedReg', $arrayOfAcceptedReg);
    $smarty->assign('anEvent', $anEvent);
} else {
    if (isset($_REQUEST['no'])) {
        $anEvent = $tedx_manager->getEvent($_REQUEST['no'])->getContent();
//gets all registrations for this event
        $allRegistrations = $tedx_manager->getRegistrationsByEvent($anEvent);
    } else {
//gets all registrations
        $allRegistrations = $tedx_manager->getRegistrations()->getContent();
    }
    $arrayOfSentReg = array();
    $sentRegistrations = array();
    $arrayOfAcceptedReg = array();
    foreach ($allRegistrations as $registration) {//for each registrations, tests if 
        switch ($registration->getStatus()) {//the status of the registration
            case 'Sent'://is sent or
                $arraySentReg = array(
                    $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                    $tedx_manager->getParticipant($registration->getParticipantPersonNo())->getContent());
                $arrayOfSentReg[] = $arraySentReg;
                $sentRegistrations[] = $registration;
                break;
            case 'Accepted' || 'Rejected'://is already accepted
                $arrayAcceptedReg = array(
                    'event' => $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                    'person' => $tedx_manager->getPerson($registration->getParticipantPersonNo())->getContent(),
                    'status' => $registration->getStatus()
                );
                $arrayOfAcceptedReg[] = $arrayAcceptedReg;
                break;
        }//for each creates an array of registrations which are processed in Smarty
    }
    $smarty->assign('sentReg', $arrayOfSentReg);
    $smarty->assign('acceptedReg', $arrayOfAcceptedReg);
}
//----------- Gets the argument from the url ------------------------------
if (isset($_REQUEST['id'])) {
    $row = $_REQUEST['id'];
    if (isset($_REQUEST['no'])) {
        $anEvent = $tedx_manager->getEvent($_REQUEST['no'])->getContent();
        $args = array(
            'event' => $anEvent,
            'participant' => $tedx_manager->getParticipant($_REQUEST['pno'])->getContent()
        );
    } else {
        $anEvent = $arrayOfSentReg[$row]['event'];
        $args = array(
            'event' => $anEvent,
            'participant' => $arrayOfSentReg[$row]['person']
        );
    }
    $motivation = $tedx_manager->getMotivationsByParticipantForEvent($args);
    var_dump($motivation);
    $smarty->assign('msgMotivation', $motivation);
    $arrayMotivation = $motivation->getContent();
    $smarty->assign('motivation', $arrayMotivation[0]);
    $smarty->assign('row', $row);
    $smarty->assign('anEvent', $anEvent);
}
if (isset($_POST['Accept']) && $_POST['Accept'] == 'Accept') {
    $reg = $sentRegistrations[$_POST['registration']];
    $acceptedReg = $tedx_manager->acceptRegistration($reg);
    if ($acceptedReg->getStatus()) {
        $smarty->assign('success_acceptation', 'This registration was successfully registrated.');
    } else {
        $smarty->assign('Error_acceptation', $acceptedReg->getMessage());
    }
} elseif (isset($_POST['Refuse']) && $_POST['Refuse'] == 'Refuse') {
    $reg = $sentRegistrations[$_POST['registration']];
    $rejectedReg = $tedx_manager->rejectRegistration($reg);
    if ($rejectedReg->getStatus()) {
        $smarty->assign('success_reject', 'This registration was successfully rejected.');
    } else {
        $smarty->assign('Error_reject', $rejectedReg->getMessage());
    }
}
/* ---------------------------- End of upcoming events ----------------------------- */
$smarty->display('backend_validation_inscriptions.tpl');
include 'userbar.php';
?>
