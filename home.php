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
$smarty->assign('NextEventName', 'getMainTopic()');
$smarty->assign('NextEventDesc', 'getDescription()');
$smarty->display('home.tpl');
include 'userbar.php';


?>