<?php

/*
 * header.php
 *
 * Author : noemie
 * Date : 21.06.2013
 *
 * Description : menu backend
 */
$menu=array();
for($i=1;$i<4;$i++){
    $string="ariane".$i;
    if(isset($_SESSION[$string])){
        $ariane=array('name' => $_SESSION[$string],
                      'url' => $_SESSION[$string."url"]
        );
        array_push($menu,$ariane);
    }
}
$smarty->assign('menu',$menu);
$smarty->display('menu_backend.tpl');
?>

