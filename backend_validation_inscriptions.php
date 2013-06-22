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
include 'menu_backend.php';
$allRegistrations = $tedx_manager->getRegistrations()->getContent(); //gets all registrations
//var_dump($allRegistrations);
$sentReg = array();
$sentRegSerialized = array();
$acceptedReg = array();
$acceptedRegSerialized = array();
foreach ($allRegistrations as $registration) {//for each registrations, tests if 
    switch ($registration->getStatus()) {//the status of the registration
        case 'Sent'://is sent or
            $sentReg[] = $registration;
            $sentRegSerialized[] = serialize($registration);//TODO fix
            break;
        case 'Accepted'://is already accepted
            $acceptedReg[] = $registration;
            $acceptedRegSerialized[] = serialize($registration);
            break;
    }//for each creates an array of registrations which are processed in Smarty
}
$smarty->assign('sentReg', $sentReg);
$smarty->assign('sentRegSerialized', $sentRegSerialized);
$smarty->assign('acceptedReg', $acceptedReg);
$smarty->assign('acceptedRegSerialized', $acceptedRegSerialized);
if(isset($_REQUEST['id'])){//method which might work... gets the serialized registration and works it
    $aRegistration = unserialize($_REQUEST['id']);
    $event = $tedx_manager->getEvent($aRegistration->getEventNo());
    $participant = $tedx_manager->getParticipant($aRegistration->getParticipantPersonNo());
    $args = array($participant, $event);
    $motivation = $tedx_manager->getMotivationsByParticipantForEvent($args)->getContent();
    var_dump($motivation);
}
$smarty->display('backend_validation_inscriptions.tpl');
include 'userbar.php';
?>
