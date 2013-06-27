<?php

/*
 * backend_home.php
 *
 * Author : Andreane et Noemie
 * Date : 17.06.2013
 *
 * Description : page for the backend menu
 */
include 'header.php';
if ($tedx_manager->isLogged() && ($tedx_manager->isOrganizer() || $tedx_manager->isValidator() || $tedx_manager->isAdministrator() || $tedx_manager->isSuperadmin())) {
    $_SESSION['ariane1'] = "Management area";
    $_SESSION['ariane1url'] = $_SERVER['SCRIPT_NAME'];
    if (isset($_SESSION['ariane2']))
        unset($_SESSION['ariane2']);
    if (isset($_SESSION['ariane2url']))
        unset($_SESSION['ariane2url']);
    if (isset($_SESSION['ariane3']))
        unset($_SESSION['ariane3']);
    if (isset($_SESSION['ariane3url']))
        unset($_SESSION['ariane3url']);
    include 'menu_backend.php';
    $smarty->display('backend_home.tpl');
    include 'userbar.php';
} else {
    header('Location:404.php');
}
?>
