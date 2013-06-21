<?php
/*
* backend_account.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to manage all the account
*/
include 'header.php';
include 'menu_backend.php';
$smarty->assign('person_name','getName Person');
$smarty->assign('person_first_name','getFirstName Person');
$smarty->display('backend_account.tpl');
include 'userbar.php';
?>
