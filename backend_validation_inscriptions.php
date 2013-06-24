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
$smarty->assign('acceptedReg', $arrayOfAcceptedReg);
//----------- Gets the argument from the url ------------------------------
if (isset($_REQUEST['id'])) {
    $row = $_REQUEST['id'];
    $args = array(
        'event' => $arrayOfSentReg[$row][0],
        'participant' => $arrayOfSentReg[$row][1]
    );
    $motivation = $tedx_manager->getMotivationsByParticipantForEvent($args);
    $smarty->assign('msgMotivation', $motivation);
    $arrayMotivation = $motivation->getContent();
    $smarty->assign('motivation', $arrayMotivation[0]);
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
