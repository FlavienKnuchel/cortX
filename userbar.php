
<?php
/*
* userbar.php
*
* Author : Christophe Rast
* Date : 14.06.2013
*
* Description : Triggers actions to be displayed on the userbar.tpl
*/
$smarty->assign('loggedin', $tedx_manager->isLogged());//assign value for smarty test
$smarty->assign('username', $tedx_manager->getUsername()); //assign username to smarty
$smarty->display('userbar.tpl');
?>
