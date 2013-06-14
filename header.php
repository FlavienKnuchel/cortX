
<?php

/*
* header.php
*
* Author :
* Date : 14.06.2013
*
* Description :
*/
require('.\Smarty\libs\Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

$smarty->display('header.tpl');
require_once('../tedx-config.php');

?>

