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
/*
 * TODO : assigner clé (id, password) aux valeurs login
 */
$login = [$_POST['username'],$_POST['password']];
$tedx_manager->login($login);


?>
