<?php
/*
 * login.php
 *
 * Author : Christophe Rast
 * Date : 17.6.2013
 *
 * Description : login management page
 */
include 'header.php';

$message = $tedx_manager->login($_POST['username'], $_POST['password']);//login test

$smarty->assign('loggedIn', $tedx_manager->isLogged());//assign value for smarty test

if ($tedx_manager->isLogged()) {//if user is logged
    echo 'Great you are logged !';
    //include('thePreviousPageVisited.php');
    $smarty->assign('username', $tedx_manager->getUsername()); //assign his name to smarty
} else { //If no
    echo $message->getMessage();//display error message
    echo 'Please try again.';
}//if
$smarty->display('userbar.tpl');//displays bottom bar to allow user to log in again or manage stuff
?>
