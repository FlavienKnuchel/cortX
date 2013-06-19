
<?php

/*
 * header.php
 *
 * Author : FlavienKnuchel ChristopheRast
 * Date : 14.06.2013
 *
 * Description :
 */

//creating the smarty object
require('.\Smarty\libs\Smarty.class.php');
$smarty = new Smarty();
//declaring the smarty directories
$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

//checking the active page (for menu visual)
if(strstr($_SERVER["REQUEST_URI"],'events')){
    $smarty->assign('activePage', 'events');
}
    else{
        if(strstr($_SERVER["REQUEST_URI"],'medias')){
            $smarty->assign('activePage', 'medias');
        }
            else{
                if(strstr($_SERVER["REQUEST_URI"],'about')){
                    $smarty->assign('activePage', 'about');
                }
                    else{
                        if(strstr($_SERVER["REQUEST_URI"],'team')) {
                            $smarty->assign('activePage', 'team');
                        }
                            else{
                                if(strstr($_SERVER["REQUEST_URI"],'speakers')){
                                    $smarty->assign('activePage', 'speakers');
                                }
                            }
                    }
            }
    }
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

