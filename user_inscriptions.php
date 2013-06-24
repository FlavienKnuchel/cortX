
<?php

/*
 * user_inscriptions.php
 *
 * Author : Andreane et Noemie
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
    //Test the status of the registration
    if ($messageParticipant->getStatus()) {

        //gets the array of all the registrations of the current loggedin person
        $arrayRegistrations = $tedx_manager->getRegistrationsByParticipant(
                        $messageParticipant->getContent()
                )->getContent();
        if (!empty($arrayRegistrations)) { //test if there is registrations
            $lengthArrayReg = count($arrayRegistrations);
            // If the array is not empty, start processing them
            $smarty->assign('registration', $arrayRegistrations[0]);
            $person = $tedx_manager->getLoggedPerson()->getContent();
            $participant = $messageParticipant->getContent();
            $event = $tedx_manager->getEvent(
                            $arrayRegistrations[0]->getEventNo()
                    )->getContent();
            //retrieve the status of current registration
            $regStatus = $arrayRegistrations[0]->getStatus();
            $smarty->assign('regStatus', $regStatus);
            //assigns arguments for later queries
            $argsPE = array(
                'person' => $person,
                'event' => $event
            );
            $argsPAE = array(
                'participant' => $participant,
                'event' => $event
            );
            $arrayKeywords = $tedx_manager->getKeywordsByPersonForEvent($argsPE)->getContent();
            if ($regStatus == 'Sent' || $regStatus == 'Accepted' || $regStatus == 'Rejected') {
// --------------- registration is locked if status doesn't match --------------
                //gets the DB content and displays it
                //assigns to smarty the text of the motivation defined by the event and participant
                $frozenMot = $tedx_manager->getMotivationsByParticipantForEvent(
                                $argsPAE
                        )->getContent()->getText();
                $smarty->assign('getMotivation', $frozenMot);
                //assigns to smarty the text of each keyword of the person
                for ($n = 0; $n < 3; $n++) {//cylce through keywords to assign them to smarty
                    $smarty->assign('getKW' . ($n + 1), $arrayKeywords[$n]->getValue());
                }
            } else {
// ------------------ registration is open for modifications -------------------
                //the content is saved but not submitted yet and can be modified
                $kw = array();
                $saveKW = FALSE; //defines is the keywords were modified and must be saved
                for ($n = 0; $n < 3; $n++) {//cycle through the 3 keywords and modifies them if necessary
                    if (empty($_POST['Keyword' . ($n + 1)])) {
                        //if the keyword is not posted it is retrieved from the DB
                        //and displayed on the page
                        //retrieve the array of keywords
                        if (!empty($arrayKeywords[$n])) {//gets the nth KW
                            $kw[$n] = $arrayKeywords[$n]->getValue();
                            $smarty->assign('kw' . ($n + 1), $kw[$n]);
                        } else {
                            $kw[$n] = null;
                            $smarty->assign('kw' . ($n + 1), 'No keyword to display');
                        }
                        $saveKW = FALSE;
                    } else {//if the keyword is posted, the old one is archived
                        if (!empty($arrayKeywords[$n])) {
                            $argsKW = array(//create array from the retrieved KW 
                                'value' => $arrayKeywords[$n]->getValue(),
                                'person' => $person,
                                'event' => $event
                            );
                            //archive the previous KW
                            $msgArchiveKW = $tedx_manager->archiveKeyword($argsKW);
                        }
                        $kw[$n] = $_POST['Keyword' . ($n + 1)]; // gets the posted KW and store it
                        $smarty->assign('kw' . ($n + 1), $kw[$n]);
                        $saveKW = TRUE;
                    }
                }//end FOR 3 keywords
                if ($saveKW) { //stores the new keywords
                    $args = array(//create the argument array
                        'listOfValues' => $kw,
                        'person' => $person,
                        'event' => $event
                    );
                    //add the new KW in place of the previous one
                    $msgAddKW = $tedx_manager->addKeywordsToAnEvent($args);
//                    if ($msgAddKW->getStatus()) {
//                        //changeregistrationStatus() to submitted
//                    } else {
//                        print ('<p class="error_msg">');
//                        print ("Error during the keyword process:");
//                        print $msgAddKW->getMessage();
//                        print ("</p>");
//                    }
                }
                //--------------Gets or send the motivation of the participant----------
                $arrayOldMotivation = $tedx_manager->getMotivationsByParticipantForEvent($argsPAE)->getContent();
                if (isset($arrayOldMotivation)) {
                    $oldMotivation = $arrayOldMotivation[0]->getText();
                }
                if (empty($_POST['motivation'])) {
                    // retrieve the motivation
                    if (!empty($arrayOldMotivation)) {//if the motivation is filled, it is set
                        $smarty->assign('motivation', $oldMotivation);
                    } else {//if not, 
                        $smarty->assign('motivation', 'Please fill in you motivation');
                    }
                } else {
                    if (!empty($arrayOldMotivation)) {
                        $argsOMPE = array(
                            'text' => $oldMotivation,
                            'participant' => $participant,
                            'event' => $event
                        );
                        echo $tedx_manager->archiveMotivationToAnEvent($argsOMPE)->getMessage();
                    }
                    $motiv = $_POST['motivation'];
                    $argsMEP = array(
                        'text' => $motiv,
                        'event' => $event,
                        'participant' => $participant);
                    var_dump($argsMEP);
                    $msgAddMotiv = $tedx_manager->addMotivationToAnEvent($argsMEP);
                    print ('<p class="error_msg">');
                    print $msgAddMotiv->getMessage();
                    print ("</p>");
                }
            }// end IF status (open, locked)
            //
// ---------Gets events and last events for the historic -----------------------
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
        }//end IF registrations are here
    }
}
include 'userbar.php';
?>
