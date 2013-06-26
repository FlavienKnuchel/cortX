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
$error='';
$messageEvents=$tedx_manager->getEvents();

if($messageEvents->getStatus()){
    $events=$messageEvents->getContent();
    $smarty->assign('events',$events);
}
else{
    $error=$messageEvents->getMessage();
}

if(isset($_GET['deleteEventNo'])){

    $messageEventToDelete=$tedx_manager->getEvent($_GET['deleteEventNo']);
    if($messageEventToDelete->getStatus()){
        $eventToDelete=$messageEventToDelete->getContent();
        //delete event
    }
    else{
        $error=$messageEventToDelete->getMessage();
    }
}


$smarty->assign('error',$error);

$smarty->display('backend_events.tpl');
include 'userbar.php';
?>
