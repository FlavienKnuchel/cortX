
<?php
/*
* speaker_profil.php
*
* Author : Andréane et Noémie
* Date : 17.06.2013
*
* Description : profil of the speaker who participated in TEDx
*/
include 'header.php';
$smarty->assign('speaker_name', 'getSpeaker Name');
$smarty->assign('speaker_description', 'getSpeaker Description');
$smarty->display('speaker_profil.tpl');
include 'userbar.php';
?>
