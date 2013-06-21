<?php
/*
* backend_events.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to manage all the events
*/
include 'header.php';
include 'menu_backend.php';
$smarty->assign('event_name','getName Event');
$smarty->display('backend_events.tpl');
include 'userbar.php';
?>
