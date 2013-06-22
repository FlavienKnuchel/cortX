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
if(isset($_SERVER['HTTP_REFERER'])){
    $userCameFrom=$_SERVER['HTTP_REFERER'];
    $smarty->assign('userCameFrom',$userCameFrom);
}

/*------------------------------ inscription informations  ------------------------------*/

if( !empty($_POST['firstname']) && !empty($_POST['lastname']) && !empty($_POST['date']) && !empty($_POST['address'])
    && !empty($_POST['city']) && !empty($_POST['country']) && !empty($_POST['telephone'])
    && !empty($_POST['email']) && !empty($_POST['username']) && !empty($_POST['password']) ){
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

    if($tedx_manager->registerVisitor($resistration)->getStatus()){
        ?>
        <p>Félicitations! vous avez créé votre compte avec succès!</p>
    <?php
    }
    else{

    }
}


/*---------------------------- display event -----------------------------*/
$smarty->display('events_registerToEvent.tpl');
include 'userbar.php';


?>