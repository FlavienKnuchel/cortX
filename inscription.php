<?php
/*
 * home.php
 *
 * Author : Flavien Knuchel
 * Date : 14.06.2013
 *
 * Description : home page that calls the header.php and userbar.php
 *
 *
*/
include 'header.php';
include 'menu_frontend.php';
/*------------------------------ Where did the user come from? (return button) ------------------------------*/
$userCameFrom=$_SERVER['HTTP_REFERER'];
$smarty->assign('userCameFrom',$userCameFrom);
$smarty->display('events_registerToEvent.tpl');
include 'userbar.php';


?>