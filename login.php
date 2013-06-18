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

//if ($tedx_manager->isLogged()) {//if user is logged
////        switch ($tedx_manager->isGranted()) {
////            case $value:
////
////
////                break;
////
////            default:
////                break;
////        }
//    include 'home.php';
//} else { //If no
//    if (!$tedx_manager->isLogged()) {
//        include 'header.php'; //displays bottom bar to allow user to log in again or manage stuff
//        echo $message->getMessage();
//        $smarty->display('login.tpl');
//        include 'userbar.php'; //displays bottom bar to allow user to log in again or manage stuff
//    }
//}//if
switch ($tedx_manager->isLogged()) {
    case TRUE:
        if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
            require_once '../tedx-config.php';
            $tedx_manager->logout();
            include 'home.php';
        } else {
            include 'header.php';
            //test isGranted
            include 'userbar.php';
        }

        break;

    case FALSE:
        if (isset($_POST['username']) && isset($_POST['password'])) {
            $message = $tedx_manager->login($_POST['username'], $_POST['password']); //login test
            if ($tedx_manager->isLogged()) {
                include 'login.php';
            } else {
                include 'header.php';
                $smarty->assign('errorlogin', $message->getMessage());
                $smarty->display('login.tpl');
                include 'userbar.php';
            }
            break;
        } else {
                include 'header.php';
            $smarty->assign('errorlogin', 'You did not filled all the fields.');
                include 'userbar.php';
        }
}
?>