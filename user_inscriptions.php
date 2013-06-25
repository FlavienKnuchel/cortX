
<?php

/*
 * user_inscriptions.php
 *
 * Author : Christophe Rast
 * Date : 18.06.2013
 *
 * Description : user inscriptions, with old events
 */
include 'header.php';
include 'menu_frontend.php';

if ($tedx_manager->isLogged()) { //test if user is logged otherwise he displays some static text.
    //retrieve the participant from the loggedIn person
    $messageParticipant = $tedx_manager->getParticipant(
            $tedx_manager->getLoggedPerson()->getContent()->getNo()
    );
    $smarty->assign('participant', $messageParticipant);
    //---------------- Test the status of the registration ------------------------------
    if ($messageParticipant->getStatus()) {


        /* ----------------------Registrations for Upcoming events------------------------------ */
//prepare the upcoming event SQL request
        $searchArgsUpcomingEvents = array(
            'where' => "StartingDate >= '" . date('Y-m-d') . "'",
            'orderBy' => 'StartingDate',
            'orderByType' => 'ASC'
        );
//get the upcoming Event
        $messsageUpcomingEvent = $tedx_manager->searchEvents($searchArgsUpcomingEvents);
        //get back the list of all the events
        $upcomingEvents = $messsageUpcomingEvent->getContent();
        $arrayLastReg = array();
        foreach ($upcomingEvents as $event) {
            //gets the array of all the registrations of the current loggedin person
            $argsLR = array(
                'participant' => $messageParticipant->getContent(),
                'event' => $event
            );
            $msgLastReg = $tedx_manager->getLastRegistration($argsLR);
            if ($msgLastReg->getStatus()) {
                //gets motivation and keywords for the existant person and event
                $motivation = $tedx_manager->getMotivationsByParticipantForEvent(
                                $argsLR
                        )->getContent();
                $keywords = $tedx_manager->getKeywordsByPersonForEvent(
                                array(
                                    'person' => $tedx_manager->getLoggedPerson()->getContent(),
                                    'event' => $event
                        ))->getContent();
                //Creates a table for the event and participant
                //-array( --------------------------------------------------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // etc...)
                $arrayLastReg[] = array(
                    'registration' => $msgLastReg->getContent(),
                    'motivation' => $motivation[0],
                    'arrayKW' => $keywords,
                    'event' => $event);
            }
        }
        $smarty->assign('arrayReg', $arrayLastReg);
        /* ----------------------Registrations for past events------------------------------ */

        //prepare the past event SQL request
        $searchArgsPastEvents = array(
            'where' => "EndingDate <= '" . date('Y-m-d') . "'",
            'orderBy' => 'EndingDate',
            'orderByType' => 'DESC'
        );
        //get the upcoming Event
        $messsagePastEvent = $tedx_manager->searchEvents($searchArgsPastEvents);
        //get back the list of all the events
        $pastEvents = $messsagePastEvent->getContent();
        $arrayPastReg = array();
        foreach ($pastEvents as $event) {
            //gets the array of all the registrations of the current loggedin person
            $argsPR = array(
                'participant' => $messageParticipant->getContent(),
                'event' => $event
            );
            $msgPastReg = $tedx_manager->getRegistrationHistory($argsLR);
            if ($msgPastReg->getStatus()) {
                //gets motivation and keywords for the existant person and event
                $motivation = $tedx_manager->getMotivationsByParticipantForEvent(
                                $argsPR
                        )->getContent();
                $keywords = $tedx_manager->getKeywordsByPersonForEvent(
                                array(
                                    'person' => $tedx_manager->getLoggedPerson()->getContent(),
                                    'event' => $event
                        ))->getContent();
                //Creates a table for the event and participant
                //-array( --------------------------------------------------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // etc...);--------------------------------------------------------------
                $msgPastReg = $msgPastReg->getContent();
                $arrayPastReg[] = array(
                    'oldReg' => $msgPastReg[0],
                    'motivation' => $motivation[0],
                    'arrayKW' => $keywords,
                    'event' => $event);
            }
        }
        $smarty->assign('arrayOldReg', $arrayPastReg);
        
        
        //gets the 
        
        
    }
}
$smarty->display('user_inscriptions.tpl');
include 'userbar.php';
?>
