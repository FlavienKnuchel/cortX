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

switch ($tedx_manager->isLogged()) {
    case TRUE:
        if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
            $tedx_manager->logout();
            include 'home.php';
        } else {
            //test isGranted
            if ($tedx_manager->isGranted('registerSpeaker')) {
                include 'backend_home.php';
            } else {
                include 'user_inscription.php';
            }
        }

        break;

    case FALSE:
        if (isset($_POST['username']) && isset($_POST['password'])) {
            $message = $tedx_manager->login($_POST['username'], $_POST['password']); //login test
            if ($tedx_manager->isLogged()) {
                if ($tedx_manager->isGranted('registerSpeaker')) {
                    include 'backend_home.php';
                } else {
                    include 'user_inscription.php';
                }
            } else {
                include 'header.php';
                $smarty->assign('errorlogin', $message->getMessage());
                $smarty->display('login.tpl');
                include 'userbar.php';
            }
            break;
        } else {
            include 'header.php';
            $smarty->assign('errorlogin', 'You did not fill all the fields.');
            $smarty->display('login.tpl');
            include 'userbar.php';
        }
}
?>