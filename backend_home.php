<?php

/*
 * backend_home.php
 *
 * Author : Andreane et Noemie
 * Date : 17.06.2013
 *
 * Description : page for the backend menu
 */
include 'header.php';
include 'menu_backend.php';
if ($tedx_manager->isLogged()) {
    $smarty->display('backend_home.tpl');
} else {
    print('<p class="error_msg">');
    print ("Your can't access this content! Log in first!</p>");
}
include 'userbar.php';
?>
