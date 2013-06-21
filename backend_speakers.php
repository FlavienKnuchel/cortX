<?php
/*
* backend_speakers.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to manage the speakers 
 */
include 'header.php';
include 'menu_backend.php';
$smarty->assign('speaker_name','GetName Speaker');
$smarty->display('backend_speakers.tpl');
include 'userbar.php';
?>
