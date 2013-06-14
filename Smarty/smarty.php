<?php

// put full path to Smarty.class.php
require('C:\wamp\www\Smarty\libs\Smarty.class.php');
$smarty = new Smarty();
echo "<pre>";
print_r($smarty);
echo "</pre>";


$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

$smarty->display('index.tpl');

?>