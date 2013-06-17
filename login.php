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

if ($message->getStatus()) {//if user is logged
    echo 'Great you are logged !';
    //include('thePreviousPageVisited.php');
} else { //If no
    echo $message->getMessage();//display error message
    echo 'Please try again.';
}//if
    
if(isset($_REQUEST['action']) && $_REQUEST['action'] == 'logout') {
    $tedx_manager->logout();
}
include 'userbar.php';//displays bottom bar to allow user to log in again or manage stuff
?>