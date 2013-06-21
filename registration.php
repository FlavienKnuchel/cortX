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

$resistration= array(
    'name'        => $_POST['firstname'],
    'firstname'   => $_POST['lastname'],
    'dateOfBirth' => $_POST['date'],
    'address'     => $_POST['address'],
    'city'        => $_POST['city'],
    'country'     => $_POST['country'],
    'phoneNumber' => $_POST['telephone'],
    'email'       => $_POST['email'],
    'idmember'    => $_POST['username'],
    'password'    => $_POST['password'],
);


include 'userbar.php';


?>