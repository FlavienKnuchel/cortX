
<?php
/*
* speaker_profil.php
*
* Author : Andreane et Noemie
* Date : 17.06.2013
*
* Description : profil of the speaker who participated in TEDx
*/
include 'header.php';
include 'menu_frontend.php';

if(isset($_GET['No'])){//is the speaker number in the url?
    //get the speaker
    $speaker=$tedx_manager->getPerson($_GET['No'])->getContent();
    //stock the speaker in smarty
    $smarty->assign('speaker', $speaker);
    /*
    //get the events he participated to
    $messageEventsBySpeaker=$tedx_manager->getEventsBySpeaker($speaker);
     if($messageEventsBySpeaker->getStatus()){
        $smarty->assign('eventsOfSpeaker', $messageEventsBySpeaker->getContent());
    }
    */
}//if
$smarty->display('speaker_profil.tpl');
include 'userbar.php';
?>
