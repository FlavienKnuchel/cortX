
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

if (strstr($_SERVER["REQUEST_URI"], '/events.php')) {
    $smarty->assign('activePage', 'events');
} else {
    if (strstr($_SERVER["REQUEST_URI"], 'medias')) {
        $smarty->assign('activePage', 'medias');
    } else {
        if (strstr($_SERVER["REQUEST_URI"], 'about')) {
            $smarty->assign('activePage', 'about');
        } else {
            if (strstr($_SERVER["REQUEST_URI"], 'team')) {
                $smarty->assign('activePage', 'team');
            } else {
                if (strstr($_SERVER["REQUEST_URI"], 'speaker')) {
                    $smarty->assign('activePage', 'speakers');
                } else {
                    if (strstr($_SERVER["REQUEST_URI"], 'home')) {
                        $smarty->assign('activePage', 'home');
                    } else {
                        if (strstr($_SERVER["REQUEST_URI"], 'inscription')) {
                            $smarty->assign('activePage', 'inscription');
                        } else {
                            if (strstr($_SERVER["REQUEST_URI"], 'login')) {
                                $smarty->assign('activePage', 'login');
                            } else {
                                if (strstr($_SERVER["REQUEST_URI"], 'backend')) {
                                    $smarty->assign('activePage', 'backend');
                                } else {
                                    $smarty->assign('activePage', 'home');
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


$smarty->display('header.tpl');
require_once('../tedx-config.php');

$smarty->assign('loggedin', $tedx_manager->isLogged()); //assign value for smarty test

if ($tedx_manager->isLogged()) {
    if ($tedx_manager->isOrganizer()) {
        $smarty->assign('userLevel', 'organizer');
    }
    if ($tedx_manager->isParticipant()) {
        $smarty->assign('userLevel', 'participant');
    }
    if ($tedx_manager->isAdministrator()) {
        $smarty->assign('userLevel', 'administrator');
    }
    if ($tedx_manager->isValidator()) {
        $smarty->assign('userLevel', 'validator');
    }
    if ($tedx_manager->isSuperadmin()) {
        $smarty->assign('userLevel', 'superadmin');
    }
}
?>

