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
$_SESSION['ariane2']="Events";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
if(isset($_SESSION['ariane3']))unset( $_SESSION['ariane3'] );
if(isset($_SESSION['ariane3url']))unset( $_SESSION['ariane3url'] );
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

if(isset($_GET['deleteNo'])){
    $event=$tedx_manager->getEvent($_GET['deleteNo'])->getContent();
    $smarty->assign('delete',$event);
}


$smarty->assign('error',$error);

$smarty->display('backend_events.tpl');
include 'userbar.php';
?>
