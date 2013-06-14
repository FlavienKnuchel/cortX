<?php
/*
* index.php
*
* Author :
* Date : 14.6.2013
*
* Description :
*/

// put full path to Smarty.class.php
require('.\Smarty\libs\Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

include 'home.php';

?>
