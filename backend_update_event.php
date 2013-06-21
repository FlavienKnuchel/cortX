<?php
/*
* backend_update_event.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to create a new event, with slot and speaker
*/
include 'header.php';
include 'menu_backend.php';
$smarty->assign('main_topic_event','getMainTopic Event');
$smarty->assign('description_event','getDescription Event');
$smarty->assign('location_name','getName Location');
$smarty->assign('location_address','getAddress Location');
$smarty->assign('location_town','getTown Location');
$smarty->assign('location_country','getCountry Location');
$smarty->display('backend_update_event.tpl');
include 'userbar.php';
?>
