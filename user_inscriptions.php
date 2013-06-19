
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
    $person = $tedx_manager->getLoggedPerson()->getContent();
    $arrayKeywords = $tedx_manager->getKeyWordsByPerson($person)->getContent();
    for ($index = 0; $index < 3; $index++) {
        if (!empty($arrayKeywords[$index])) {
            $smarty->assign('kw' . ($index + 1), $arrayKeywords[$index]->getValue());
        } else {
            $smarty->assign('kw' . ($index + 1), 'Empty');
        }
    }
//        $smarty->assign('kw2', $arrayKeywords[1]->getValue());
//        $smarty->assign('kw3', $arrayKeywords[2]->getValue());
//        $smarty->assign('kw1', 'pomme');
//        $smarty->assign('kw2', 'peche');
//        $smarty->assign('kw3', 'poire');
// ---- Attendre services des IT 
//      $oldMotivation = $person->getMotivation();
//    $motivation = $_POST['motivation'];
//    $kw1 = $_POST['Keyword1'];
//    $kw2 = $_POST['Keyword2'];
//    $kw3 = $_POST['Keyword3'];
//    
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
} else {
    print ('<p class="error_msg">');
    print ("You are not logged in, you can't access this content.</p>");
}
include 'userbar.php';
?>
