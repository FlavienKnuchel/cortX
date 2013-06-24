
<?php

/*
 * speakers.php
 *
 * Author : Noemie Sandoz et Andreane Mercier
 * Date : 17.06.2013
 *
 * Description : list of all the speakers that participated in this TEDx
 */
include 'header.php';
include 'menu_frontend.php';
$msgSpeakers = $tedx_manager->getSpeakers();
$arrayValidSpeakers = array();
if ($msgSpeakers->getStatus()) {
    foreach ($msgSpeakers->getContent() as $speaker) {
        if (!$speaker->getIsArchived()) {
            $arrayValidSpeakers[] = $speaker;
        }
    }
}
$smarty->assign('speakers', $arrayValidSpeakers);
$smarty->display('speakers.tpl');
include 'userbar.php';
?>
