<?php
/*
 * home.php
 *
 * Author : Flavien Knuchel
 * Date : 14.06.2013
 *
 * Description : home page that calls the header.php and userbar.php
 *
 *
 */
include 'header.php';
$smarty->display('inscription.tpl');
include 'userbar.php';


?>