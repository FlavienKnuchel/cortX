<?php

/*
 * login.php
 *
 * Author : Christophe Rast
 * Date : 17.6.2013
 *
 * Description : login management page
 */
if (isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
    require_once '../tedx-config.php';
    $tedx_manager->logout();
    include 'home.php';
} else {
    require_once '../tedx-config.php';
    $message = $tedx_manager->login($_POST['username'], $_POST['password']); //login test

    if ($message->getStatus()) {//if user is logged
        include 'home.php';
    } else { //If no
        echo $message->getMessage();
        include 'header.php'; //displays bottom bar to allow user to log in again or manage stuff
        $smarty->display('login.tpl');
        include 'userbar.php'; //displays bottom bar to allow user to log in again or manage stuff
    }//if
}
?>