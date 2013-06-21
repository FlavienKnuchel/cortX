<?php

/*
 * login.php
 *
 * Author : Christophe Rast
 * Date : 17.6.2013
 *
 * Description : login management page
 */
require_once '../tedx-config.php';

if ($tedx_manager->isLogged()) {
    if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
        $tedx_manager->logout();
        header('Location: home.php');
//        include 'home.php';
    } else {
        //test des droits
        if ($tedx_manager->isOrganizer() || $tedx_manager->isValidator() || $tedx_manager->isAdministrator() || $tedx_manager->isSuperadmin()) {
            header('Location: backend_home.php');
        } else {
            header('Location: user_inscriptions.php');
        }
    }
} else {
    if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
        header('Location: home.php');
    } else {
        if (isset($_POST['username']) && isset($_POST['password'])) {
            $message = $tedx_manager->login($_POST['username'], $_POST['password']); //login test
            if ($tedx_manager->isLogged()) {
                if ($tedx_manager->isOrganizer() || $tedx_manager->isValidator() || $tedx_manager->isAdministrator() || $tedx_manager->isSuperadmin()) {//redirect the user according to his rights
                    header('Location: backend_home.php');
                } else {
                    header('Location: user_inscriptions.php');
                }
            } else {
                include 'header.php';
                $smarty->assign('errorlogin', $message->getMessage()); //send the login error message
                $smarty->display('login.tpl');
                include 'userbar.php';
            }
        } else {
            include 'header.php';
            $smarty->assign('errorlogin', 'You did not fill all the fields.');
            $smarty->display('login.tpl');
            include 'userbar.php';
        }
    }
}
?>