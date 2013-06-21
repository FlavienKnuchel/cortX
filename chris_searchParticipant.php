<?php

/*
 * chris_searchParticipant
 * 
 * @author  :Chris
 * Date     :21 juin 2013
 * 
 */
require_once('../tedx-config.php');
echo $tedx_manager->isLogged();
$searchArgs = array(
    'personType' => 'participant',
//    'where' => "Name LIKE 'Part%'"
);
$aWaitingRegistration = $tedx_manager->getRegistration(array(
            'status' => 'Waiting',
            'event' => $anEvent,
            'participant' => $participant)
        )->getContent();
$aSentRegistration = $tedx_manager->sendRegistration($aWaitingRegistration);
// exec the search
$messageSearchPersons = $tedx_manager->searchPersons($searchArgs);
var_dump($messageSearchPersons);
?>
