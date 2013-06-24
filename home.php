<?php

/*
 * home.php
 *
 * Author : Flavien Knuchel
 * Date : 14.06.2013
 *
 * Description : home page that calls the header.php and userbar.php
 *
 *
 */
include 'header.php';
include 'menu_frontend.php';
/* ------------------------------Upcoming events------------------------------ */
//prepare the upcoming event SQL request
$searchArgsUpcomingEvents = array(
    'where' => "StartingDate >= '" . date('Y-m-d') . "'",
    'orderBy' => 'StartingDate',
    'orderByType' => 'ASC'
);
//get the upcoming Event
$messsageUpcomingEvent = $tedx_manager->searchEvents($searchArgsUpcomingEvents);
//if the message is not an error message
if ($messsageUpcomingEvent->getStatus()) {
    //get back the list of all the events
    $upcomingEvents = $messsageUpcomingEvent->getContent();
    //stock the events list in smarty
    $smarty->assign('upcomingEvents', $upcomingEvents);
}//if
$smarty->display('home.tpl');
include 'userbar.php';
?>