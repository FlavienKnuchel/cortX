<?php

/*
 * backend_speakers.php
 *
 * Author : Andreane et Noemie
 * Date : 18.06.2013
 *
 * Description : page to manage the speakers
 */
include 'header.php';
include 'menu_backend.php';

//if something is selected it appears on the right after the relaod
if (isset($_GET['modify'])) {
    $row = $_GET['id'];
    $messageSpeaker=$tedx_manager->getSpeaker($row);
    if($messageSpeaker->getStatus()){
        $speaker = $messageSpeaker->getContent();
    }
    $smarty->assign('modify', $speaker);
} elseif (isset($_POST['edit'])) { //process the edition
    $no = $_REQUEST['id'];
    $argsCP = array( //gets all the array
        'no' => $no, // int
        'name' => $_POST['Lastname'], // String
        'firstName' => $_POST['Firstname'], // String
        'dateOfBirth' => $_POST['Date'], // Date
        'address' => $_POST['Address'], // String
        'city' => $_POST['City'], // String
        'country' => $_POST['Country'], // String
        'phoneNumber' => $_POST['Phone'], // String
        'email' => $_POST['Email'], // String
        'description' => $_POST['Description'], // String
    );
    $msgCP = $tedx_manager->changeProfil($argsCP);
    if ($msgCP->getStatus()) {
        $smarty->assign('changeSuccess', $msgCP->getMessage());
    }
} elseif (isset($_POST['add'])) {
    $arrayPersons = $tedx_manager->getPersons()->getContent();
    $no = $arrayPersons[count($arrayPersons) - 1]->getNo();
    $argsRS = array(
        'name' => $_POST['Lastname'], // String
        'firstname' => $_POST['Firstname'], // String
        'dateOfBirth' => $_POST['Date'], // Date
        'address' => $_POST['Address'], // String
        'city' => $_POST['City'], // String
        'country' => $_POST['Country'], // String
        'phoneNumber' => $_POST['Phone'], // String
        'email' => $_POST['Email'], // String
        'description' => $_POST['Description'], // String
        'idmember' => ($no + 1), //intenger
        'password' => $_POST['Lastname'] . ($no + 1) // String encrypt to MD5
    );
    $msgRS = $tedx_manager->registerSpeaker($argsRS);
    $smarty->assign('changeSuccess', $msgRS->getMessage());
}
//gets all speakers
$msgSpeakers = $tedx_manager->getSpeakers();
$arraySpeakers = $msgSpeakers->getContent();
$arrayValidSpeakers = array();
$arrayArchivedSpeakers = array();
if ($msgSpeakers->getStatus()) {//sort the speakers by their status
    foreach ($arraySpeakers as $speaker) {
        if (!$speaker->getIsArchived()) {
            $arrayValidSpeakers[] = $speaker;
        } else {
            $arrayArchivedSpeakers[] = $speaker;
        }
    }
}

$smarty->assign('speakers', $arrayValidSpeakers);
$smarty->display('backend_speaker.tpl');
include 'userbar.php';
?>
