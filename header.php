
<?php

/*
 * header.php
 *
 * Author : FlavienKnuchel ChristopheRast
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

if ($tedx_manager->isGranted('registerSpeaker')) {
    if ($tedx_manager->isGranted('changeRegistrationStatus')) {
        if ($tedx_manager->isGranted('addTeamRole')) {
            $smarty->assign('userLevel', 'admin');
        } else {
            $smarty->assign('userLevel', 'validator');
        }
    } else {
        $smarty->assign('userLevel', 'organizator');
    }
} else {
    $smarty->assign('userLevel', 'participant');
}
?>

