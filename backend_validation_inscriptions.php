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
$smarty->assign('participant_name','getName Participant');
$smarty->display('backend_validation_inscriptions.tpl');
include 'userbar.php';
?>
