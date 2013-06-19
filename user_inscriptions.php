
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
    $event = $tedx_manager->getParticipation->getContent()->getEvent; //TODO with new AS
//retrieve the status of current registration
    $regStatus = $tedx_manager->getRegistration($event->getNo())->getContent()->getStatus();
    if ($regStatus == 'submitted' || $regStatus == 'validated' || $regStatus == 'refused' || $regStatus == 'pending') {
//    The content has been saved and submitted for evaluation
        // the content is grayed and cannot be modified again
    } else {
        //the content is saved but not submitted yet and can be modified
        for ($n = 0; $n < 3; $n++) {//cycle through the 3 keywords and modifies them if necessary
            //if the keyword is not posted it is retrieved from the DB and displayed on the page
            if (empty($_POST['Keyword' . ($n + 1)])) {
                //retrieve the array of keywords
                $args = array($person, $event);
                $arrayKeywords = $tedx_manager->getKeyWordsByPersonForEvent($args)->getContent();
                if (!empty($arrayKeywords[$n])) {//gets the nth KW
                    $smarty->assign('kw' . ($n + 1), $arrayKeywords[$n]->getValue());
                } else {
                    $smarty->assign('kw' . ($n + 1), '');
                }
            } else {//if the keyword is posted, it is added in the DB
                $args = array($arrayKeywords[$n], $person, $event); //retrieve previous KW from DB 
                $tedx_manager->archiveKeyword($args)->getStatus(); //archive the previous KW
                $kw = $_POST['Keyword' . ($n + 1)];
                $args = array($kw, $person, $event);
                $tedx_manager->addKeywordsToAnEvent($args); //add the new KW in place of the previous one
            }
        }//end FOR

// ---- Attendre services des IT, changer motivation toussa, comme pour keyword
        // retrieve the motivation
        $oldMotivation = $tedx_manager->getMotivationByPersonForEvent($args)->getContent();
        if (!empty($oldMotivation->getText())) {
            $smarty->assign('motivation', $oldMotivation->getText());
        } else {
            $smarty->assign('motivation', 'Empty');
        }
//    $motivation = $_POST['motivation'];

        
        
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
    }// end IF status
    $smarty->display('user_inscriptions.tpl');
} else {//---- print error message --------------------------------------------
    print ('<p class="error_msg">');
    print ("You are not logged in, you can't access this content.</p>");
}
include 'userbar.php';
?>
