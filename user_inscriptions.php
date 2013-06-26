
<?php

/*
 * user_inscriptions.php
 *
 * Author : Christophe Rast
 * Date : 18.06.2013
 *
 * Description : user inscriptions, with old events
 */

//TODO affichage des 


include 'header.php';
include 'menu_frontend.php';

if ($tedx_manager->isLogged()) { //test if user is logged otherwise he displays some static text.
    //retrieve the participant from the loggedIn person
    $messageParticipant = $tedx_manager->getParticipant(
            $tedx_manager->getLoggedPerson()->getContent()->getNo()
    );
    $smarty->assign('participant', $messageParticipant);
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
        $arrayLastReg = array(); //used later to store the pending events
        //get back the list of all the events
        $upcomingEvents = $messsageUpcomingEvent->getContent();
        foreach ($upcomingEvents as $event) {
            //gets the array of all the registrations of the current loggedin person
            $argsLR = array(
                'participant' => $messageParticipant->getContent(),
                'event' => $event
            );
            //tests if a registration is found for the couple participant and event
            $msgLastReg = $tedx_manager->getLastRegistration($argsLR);
            if ($msgLastReg->getStatus()) {
                //gets motivation and keywords for the existant person and event
                $motivation = $tedx_manager->getMotivationsByParticipantForEvent(
                        $argsLR
                );
                if ($motivation->getStatus()) { //test if a motivation is found
                    $arrayMotivation = $motivation->getContent();
                    //retrieves the text of the motivation
                    $textMotivation = $arrayMotivation[0]->getText();
                } else {
                    $textMotivation = '';
                }
                $argsKW = array(
                    'person' => $tedx_manager->getLoggedPerson()->getContent(),
                    'event' => $event
                );
                $msgKeywords = $tedx_manager->getKeywordsByPersonForEvent($argsKW);
                $keywords = array();
                if ( $msgKeywords->getStatus()){
                    $arrayKW = $msgKeywords->getContent();
                    foreach ($arrayKW as $kw) {
                        $keywords[] = $kw->getValue();
                    }
                }
                //Creates a table for the event and participant
                //-array( --------------------------------------------------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // array ( aRegistration, aMotivation, keywords) -----------------------
                // etc...)
                $arrayLastReg[] = array(
                    'registration' => $msgLastReg->getContent(),
                    'motivation' => $textMotivation,
                    'arrayKW' => $keywords,
                    'event' => $event);
            }//end if registration exist
        }// end foreach
        /* ----------------------Registrations for past events------------------------------ */
        // this part acts like for the upcoming event except it gets the the registrations relative to the past events.
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
            $msgPastReg = $tedx_manager->getRegistrationHistory($argsPR);
            if ($msgPastReg->getStatus()) {
                //gets motivation and keywords for the existant person and event
                $motivation = $tedx_manager->getMotivationsByParticipantForEvent(
                        $argsPR
                );
                if ($motivation->getStatus()) {
                    $arrayMotivation = $motivation->getContent();
                    $textMotivation = $arrayMotivation[0]->getText();
                } else {
                    $textMotivation = '';
                }
                $keywords = $tedx_manager->getKeywordsByPersonForEvent(
                                array(
                                    'person' => $tedx_manager->getLoggedPerson()->getContent(),
                                    'event' => $event
                        ))->getContent();
//Creates a table for the event and participant
//-array( --------------------------------------------------------------
// array ( aRegistration, aMotivation, keywords) -----------------------
// array ( aRegistration, aMotivation, keywords) -----------------------
// array ( etc...)------------------------------------------------------
// );-------------------------------------------------------------------
                $msgPastReg = $msgPastReg->getContent();
                $arrayPastReg[] = array(
                    'oldReg' => $msgPastReg[0],
                    'motivation' => $textMotivation,
                    'arrayKW' => $keywords,
                    'event' => $event);
            }
        }

//-------------------------- gets the POSTed save ------------------------------------------
        //test which button is pushed
        if (isset($_POST['Save'])) {
//only modifies the motivation and/or keyword
            $row = $_POST['value'];

            if (isset($arrayLastReg[$row]['motivation'])) { //tests is a former motivation exists
                if ($arrayLastReg[$row]['motivation'] != $_POST['motivation']) {
                    $msgArchiveMotivation = $tedx_manager->archiveMotivationToAnEvent(//archive the old motivation
                            array(
                                'text' => $arrayLastReg[$row]['motivation'],
                                'event' => $arrayLastReg[$row]['event'],
                                'participant' => $messageParticipant->getContent()
                            ));
                    unset($arrayLastReg[$row]['motivation']); //deletes it from the array
                }
            }
            if (isset($_POST['motivation'])) {//if the motivation is filled in the POST
                $msgAddMotiv = $tedx_manager->addMotivationToAnEvent(//adds the motivation to 
                        array(
                            'text' => $_POST['motivation'],
                            'event' => $arrayLastReg[$row]['event'],
                            'participant' => $messageParticipant->getContent()
                        ));
                if ($msgAddMotiv->getStatus()) {
                    $arrayLastReg[$row]['motivation'] = $msgAddMotiv->getContent()->getText(); //adds the motivation to the array
                }
            }


            $kwToAdd = array();
            for ($index = 0; $index < 3; $index++) {//cycle through the 3 keywords
                if (isset($arrayLastReg[$row]['arrayKW'][$index])) {//if a KW is set 
                    // it compares the old to the POSTed
                    if ($arrayLastReg[$row]['arrayKW'][$index] != $_POST['Keyword' . ($index + 1)]) {
                        $argsAK = array(
                            'value' => $arrayLastReg[$row]['arrayKW'][$index],
                            'event' => $arrayLastReg[$row]['event'],
                            'person' => $messageParticipant->getContent()
                        );
                        //archive the old keyword 
                        $msgArchiveKW = $tedx_manager->archiveKeyword($argsAK);
                        if ($msgArchiveKW->getStatus()) {
                            unset($arrayLastReg[$row]['arrayKW'][$index]);
                            $kwToAdd[$index] = $_POST['Keyword' . ($index + 1)]; //adds the new KW to an array
                        }
                    } else {
                        $kwToAdd[$index] = $arrayLastReg[$row]['arrayKW'][$index]; //adds the old one to the array
                    }
                } else {//no pre-existant keyword was set
                    if (isset($_POST['Keyword' . ($index + 1)])) {
                        //adds the new one to replace the null
                        $kwToAdd[$index] = $_POST['Keyword' . ($index + 1)];
                    } else {
                        $kwToAdd[$index] = ''; //if no kw was set before and no kw was POSTed, nothing is set.
                    }
                }
            }
            $msgAddKW = array(
                'listOfValues' => $kwToAdd,
                'person' => $messageParticipant->getContent(),
                'event' => $arrayLastReg[$row]['event']
            );
//adds the KW(s) to the DB
            $messageKW = $tedx_manager->addKeywordsToAnEvent($msgAddKW);
            foreach ($messageKW as $key => $message) {
                if ($message->getStatus()) {
                    $arrayLastReg[$row]['arrayKW'][$key] = $message->getContent()->getValue();
                }
            }
            /* ------------------------------Gets the POST send------------------------------ */
        } elseif (isset($_POST['Send'])) {//-------------------------------------------------------
//modifies the motivation and/or keyword and changes the registration status
            $row = $_POST['value']; //gets variables 

            if (isset($arrayLastReg[$row]['motivation'])) { //tests is a former motivation exists
                if ($arrayLastReg[$row]['motivation'] != $_POST['motivation']) {
                    $msgArchiveMotivation = $tedx_manager->archivedMotivationToAnEvent(//archive the old motivation
                            array(
                                'text' => $arrayLastReg[$row]['motivation'],
                                'event' => $arrayLastReg[$row]['event'],
                                'participant' => $messageParticipant->getContent()
                            ));
                }
                unset($arrayLastReg[$row]['motivation']); //deletes it from the array
            }
            if (isset($_POST['motivation'])) {//if the motivation is filled in the POST
                $msgAddMotiv = $tedx_manager->addMotivationToAnEvent(//adds the motivation to 
                        array(
                            'text' => $_POST['motivation'],
                            'event' => $arrayLastReg[$row]['event'],
                            'participant' => $messageParticipant->getContent()
                        ));
                $arrayLastReg[$row]['motivation'] = $msgAddMotiv->getContent()->getText(); //adds the motivation to the array
            } else {
                $smarty->assign('errorSendMotiv', TRUE);
            }
            $arrayLastReg[$row]['event'] = $upcomingEvents[$row]; //sets the used event
            $kwToAdd = array();
            for ($index = 0; $index < 3; $index++) {//cycle through the 3 keywords
                if (isset($arrayLastReg[$row]['arrayKW'][$index])) {//if no KW set 
                    // it compares the old to the POSTed
                    if ($arrayLastReg[$row]['arrayKW'][$index]->getValue() != $_POST['Keyword' . ($index + 1)]) {
                        $msgArchiveKW = $tedx_manager->archiveKeyword(//archive the old keyword 
                                array(
                                    'value' => $arrayLastReg[$row]['arrayKW'][$index]->getValue(),
                                    'event' => $arrayLastReg[$row]['event'],
                                    'person' => $messageParticipant->getContent()
                                ));
                        unset($arrayLastReg[$row]['arrayKW'][$index]);
                        $kwToAdd[] = $_POST['Keyword' . ($index + 1)]; //adds the new KW to an array
                    }
                }
            }
            if (!empty($kwToAdd[0])) {//if at least one KW is added to the array
                $msgAddKW = $tedx_manager->addKeywordsToAnEvent(//adds the KW(s) to the DB
                        array(
                            'listOfValues' => $kwToAdd,
                            'person' => $messageParticipant->getContent(),
                            'event' => $arrayLastReg[$row]['event']
                        ));
            } else {
                $smarty->assign('errorSendKW', TRUE);
            }
        }
        $smarty->assign('arrayReg', $arrayLastReg);
        $smarty->assign('arrayOldReg', $arrayPastReg);
    }
}
$smarty->display('user_inscriptions.tpl');
include 'userbar.php';
?>
