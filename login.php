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
$message = $tedx_manager->login($_POST['username'], $_POST['password']);
echo $message->getMessage();


?>
