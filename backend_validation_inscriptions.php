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
//$sentRegSerialized = array();
//$acceptedRegSerialized = array();
$arrayOfSentReg = array();
$sentRegistrations = array();
$arrayOfAcceptedReg = array();
foreach ($allRegistrations as $registration) {//for each registrations, tests if 
    switch ($registration->getStatus()) {//the status of the registration
        case 'Sent'://is sent or
//            $sentRegSerialized[] = serialize($registration);//TODO fix
            $arraySentReg = array(
                $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                $tedx_manager->getParticipant($registration->getParticipantPersonNo())->getContent());
            $arrayOfSentReg[] = $arraySentReg;
            $sentRegistrations[] = $registration;
            break;
        case 'Accepted'://is already accepted
//            $acceptedRegSerialized[] = serialize($registration);
            $arrayAcceptedReg = array(
                $tedx_manager->getEvent($registration->getEventNo())->getContent(),
                $tedx_manager->getPerson($registration->getParticipantPersonNo())->getContent());
            $arrayOfAcceptedReg[] = $arrayAcceptedReg;
            break;
    }//for each creates an array of registrations which are processed in Smarty
}
$smarty->assign('sentReg', $arrayOfSentReg);
//$smarty->assign('sentRegSerialized', $sentRegSerialized);
$smarty->assign('acceptedReg', $arrayOfAcceptedReg);
//$smarty->assign('acceptedRegSerialized', $acceptedRegSerialized);
//if(isset($_REQUEST['id'])){//method which might work... gets the serialized registration and works it
//    $aRegistration = unserialize($_REQUEST['id']);
//    $event = $tedx_manager->getEvent($aRegistration->getEventNo());
//    $participant = $tedx_manager->getParticipant($aRegistration->getParticipantPersonNo());
//    $args = array($participant, $event);
//    $motivation = $tedx_manager->getMotivationsByParticipantForEvent($args)->getContent();
//    var_dump($motivation);
//}
if (isset($_REQUEST['id'])) {
    $row = $_REQUEST['id'];
    $args = array($arrayOfSentReg[$row][1], $arrayOfSentReg[$row][0]);
    $motivation = $tedx_manager->getMotivationsByParticipantForEvent($args)->getContent();
    var_dump($motivation);
    $smarty->assign('motivation', $motivation);
    $smarty->assign('row', $row);
}
if (isset($_POST['Accept']) && $_POST['Accept'] == 'Accept') {
    $reg = $sentRegistrations[$_POST['registration']];
    $acceptedReg = $tedx_manager->acceptRegistration($reg);
    print $acceptedReg->getMessage();
}
if (isset($_POST['Refuse']) && $_POST['Refuse'] == 'Refuse') {
    $reg = $sentRegistrations[$_POST['registration']];
    $rejectedReg = $tedx_manager->rejectRegistration($reg);
    print $rejectedReg->getMessage();
}
$smarty->display('backend_validation_inscriptions.tpl');
include 'userbar.php';
?>
