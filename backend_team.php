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
$_SESSION['ariane2']="Team";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
include 'menu_backend.php';
if ($tedx_manager->isLogged()) {
    $msgPersons = $tedx_manager->getPersons();
    if ($msgPersons->getStatus()) {
        $arrayPersons = $msgPersons->getContent();
        $smarty->assign('persons', $arrayPersons);
    }
    $msgOrganizers = $tedx_manager->getOrganizers();
    if ($msgOrganizers->getStatus()) {
        $arrayOrganizers = $msgOrganizers->getContent();
        $smarty->assign('organizers', $arrayOrganizers);
    }

    $teamroles = $tedx_manager->getTeamRoles()->getContent();
    $smarty->assign('teamroles', $teamroles);
    $smarty->display('backend_team.tpl');
}
include 'userbar.php';
?>
