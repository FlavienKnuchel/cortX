
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
require('./Smarty/libs/Smarty.class.php');
$smarty = new Smarty();
//declaring the smarty directories
$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

//checking the active page (for menu visual)
//get the url
$url=$_SERVER["REQUEST_URI"];
//get the size of the base url
$sizeUrl=strlen($_SERVER['SERVER_NAME']);
//cut it by slashes
$text=explode("/",$url);
// select the last part
$text=$text[3];
//cut the end(.php extension)
$text=explode(".",$text);
//select the first part
$activeUrl=$text[0];
//test the first part and react
switch($activeUrl){
    case "events":
    case "event_detail":
        $activePage='events';
        break;
    case "medias":
        $activePage='medias';
        break;
    case "about":
        $activePage='about';
        break;
    case "home":
        $activePage='home';
        break;
    case "index":
        $activePage='home';
        break;
    case "inscription":
        $activePage='events';
        break;
    case "login":
        $activePage='home';
        break;
    case "speakers":
    case "speaker_profil":
        $activePage='speakers';
        break;
    case "team":
        $activePage='team';
        break;
    //defaul value
    default:
        $activePage='home';
}
//assign the activePage variable to smarty (for the menu display)
$smarty->assign('activePage',$activePage);
$smarty->display('header.tpl');
//display the header
require_once('../tedx-config.php');


$smarty->assign('loggedin', $tedx_manager->isLogged()); //assign value for smarty test
//test the user level 
if ($tedx_manager->isLogged()) {
    if ($tedx_manager->isParticipant()) {
        $smarty->assign('userLevel', 'participant');
        $smarty->assign('classUserLevel', 'menu_participant');
    }
    if ($tedx_manager->isOrganizer()) {
        $smarty->assign('userLevel', 'organizer');
        $smarty->assign('classUserLevel', 'menu_organizer');
    }
    if ($tedx_manager->isValidator()) {
        $smarty->assign('userLevel', 'validator');
        $smarty->assign('classUserLevel', 'menu_validator');
    }
    if ($tedx_manager->isAdministrator()) {
        $smarty->assign('userLevel', 'administrator');
        $smarty->assign('classUserLevel', 'menu_administrator');
    }
    if ($tedx_manager->isSuperadmin()) {
        $smarty->assign('userLevel', 'superadmin');
        $smarty->assign('classUserLevel', 'menu_superadmin');
    }
}
?>

