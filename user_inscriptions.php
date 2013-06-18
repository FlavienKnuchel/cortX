
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
if ($tedx_manager->isLogged()) {
//    //retrieve username from session
//    $username = $tedx_manager->getUsername();
//    // search args : Search speakers with name beginning with K
//    $searchArgs = array(
//        'personType' => 'participant',
//        'where' => "Name LIKE '$username'"
//    );
//// exec the search
//    $messageSearchPersons = $tedx_manager->searchPersons($searchArgs);
//    $persons = $messageSearchPersons->getContent();
//    $thePerson = $persons[0]->
//    $motivation = $_POST['motivation'];
//    $kw1 = $_POST['Keyword1'];
//    $kw2 = $_POST['Keyword2'];
//    $kw3 = $_POST['Keyword3'];

    $searchArgs = array();
    $searchEvents = $tedx_manager->searchEvents($searchArgs);
    $events = $searchEvents->getContent();
    $smarty->assign('oldEvent', $events);
    $smarty->display('user_inscriptions.tpl');
} else {
    print ('<p class="error_msg">');
    print ("You are not logged in, you can't access this content.</p>");
}
include 'userbar.php';
?>
