<?php
/*
* backend_team.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to manage the team and the roles
*/
include 'header.php';
include 'menu_backend.php';
$smarty->assign('person_name','getName Person');
$smarty->assign('person_first_name','getFirstName Person');
$smarty->assign('team_role_name','getName TeamRole');
$smarty->display('backend_team.tpl');
include 'userbar.php';
?>
