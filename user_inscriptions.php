
<?php

/*
 * user_inscriptions.php
 *
 * Author : Andréane et Noémie
 * Date : 18.06.2013
 *
 * Description : user inscriptions, with old events
 */
include 'header.php';

if ($tedx_manager->isLogged()) { //test if user is logged otherwise he displays some static text.
//  Test the status of the registration
    $person = $tedx_manager->getLoggedPerson()->getContent(); //retrieve the loged person
    //TODO with new AS gets current participation
    $event = $tedx_manager->getParticipation()->getContent()->getEvent();
    //retrieve the participant from the loggedIn person
    $participant = $tedx_manager->getParticpant($tedx_manager->getLoggedPerson()->getContent()->getNo())->getContent();
    //retrieve the status of current registration
    $regStatus = $tedx_manager->getRegistration($event->getNo())->getContent()->getStatus();

    // --------------- registration is locked if status doesn't match -----------------------------------------
    if ($regStatus == 'submitted' || $regStatus == 'validated' || $regStatus == 'refused' || $regStatus == 'pending') {
        //gets the DB content and displays it
        //assigns to smarty the text of the motivation defined by the event and participant
        $smarty->assign(
                'getMotivation', $tedx_manager->getMotivationsByParticipantForEvent(
                        array($participant, $event))->getContent()->getText());
        $args = array($person, $event);
        //assigns to smarty the text of each keyword of the person
        $arrayKeywords = $tedx_manager->getKeywordsByPersonForEvent($args)->getContent();
        for ($n = 0; $n < 3; $n++) {
            $smarty->assign('getKW' . ($n + 1), $arrayKeywords[$n]->getValue());
        }
    } else { // ------------ registration open
        //the content is saved but not submitted yet and can be modified
        for ($n = 0; $n < 3; $n++) {//cycle through the 3 keywords and modifies them if necessary
            //if the keyword is not posted it is retrieved from the DB and displayed on the page
            if (empty($_POST['Keyword' . ($n + 1)])) {
                //retrieve the array of keywords
                $args = array($person, $event);
                $arrayKeywords = $tedx_manager->getKeywordsByPersonForEvent($args)->getContent();
                if (!empty($arrayKeywords[$n])) {//gets the nth KW
                    $smarty->assign('kw' . ($n + 1), $arrayKeywords[$n]->getValue());
                } else {
                    $smarty->assign('kw' . ($n + 1), '');
                }
            } else {//if the keyword is posted, it is added in the DB
                $args = array($arrayKeywords[$n], $person, $event); //create array from the retrieved KW 
                echo $tedx_manager->archiveKeyword($args)->getStatus(); //archive the previous KW
                //                 î should be named archiveKeywordFromPersonForEvent
                $kw = $_POST['Keyword' . ($n + 1)]; // gets the posted KW
                $args = array($kw, $person, $event); //creat the argument array
                //add the new KW in place of the previous one
                $msgAddKW = $tedx_manager->addKeywordsToAnEvent($args);
                if ($msgAddKW->getStatus()) {
                    //changeregistrationStatus() to submitted
                } else {
                    print ('<p class="error_msg">');
                    print ("Error during the keyword process:");
                    print $msgAddKW->getMessage();
                    print ("</p>");
                }
            }
        }//end FOR
// ---- Attendre services des IT pour nom de fonction getMotivation, changer motivation toussa, comme pour keyword
        if (empty($_POST['motivation'])) {
            $args = array($participant, $event);
            // retrieve the motivation
            $oldMotivation = $tedx_manager->getMotivationsByParticipantForEvent($args)->getContent()->getText();
            if (!empty($oldMotivation)) {//if the motivation is filled, it is set
                $smarty->assign('motivation', $oldMotivation);
            } else {//if not, 
                $smarty->assign('motivation', '');
            }
        } else {
            $args = array($oldMotivation, $participant, $event);
            echo $tedx_manager->archiveMotivationToAnEvent($args)->getMessage();
            $motiv = $_POST['motivation'];
            $args = array($motiv, $event, $participant);
            $msgAddMotiv = $tedx_manager->addMotivationToAnEvent($args)->getMessage();
        }
    }// end IF status
// ---- Get events and last events for the historic ---------------------------
// declare the request arguments for events
    $searchArgs = array();
//get back the result of the events request
    $messageSearchEvents = $tedx_manager->searchEvents($searchArgs);
//if the message is not an error message
    if ($messageSearchEvents->getStatus()) {
        //get back the list of all the events
        $events = $messageSearchEvents->getContent();
        //stock the events list in smarty
        $smarty->assign('eventsObjects', $events);
    }//if
    $smarty->display('user_inscriptions.tpl');
} else {//---- print error message --------------------------------------------
    print ('<p class="error_msg">');
    print ("You are not logged in, you cannot access this content.</p>");
}
include 'userbar.php';
?>
