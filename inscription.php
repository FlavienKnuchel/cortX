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
/*------------------------------ Where did the user come from? (return button) ------------------------------*/
$userCameFrom=$_SERVER['HTTP_REFERER'];
$smarty->assign('userCameFrom',$userCameFrom);

/*------------------------------ inscription informations  ------------------------------*/

if(isset($_POST['']))
$resistration= array(
    'name'        => $_POST['firstname'],
    'firstname'   => $_POST['lastname'],
    'dateOfBirth' => $_POST['dob_year']."-".$_POST['dob_month']."-".$_POST['dob_day'],
    'address'     => $_POST['address'],
    'city'        => $_POST['city'],
    'country'     => $_POST['country'],
    'phoneNumber' => $_POST['telephone'],
    'email'       => $_POST['email'],
    'idmember'    => $_POST['username'],
    'password'    => $_POST['password'],
);

$smarty->display('events_registerToEvent.tpl');
include 'userbar.php';


?>