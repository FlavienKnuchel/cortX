
<?php

/*
 * user_profile.php
 *
 * Author : Andreane et Noemie, Christophe Rast
 * Date : 18.06.2013
 *
 * Description : profile of the user
 */
include 'header.php';
include 'menu_frontend.php';
$no = $tedx_manager->getLoggedPerson()->getContent()->getNo();
//gets the POST profile
if (isset($_POST['edit'])) {
    $argsCP = array(//gets all the array
        'no' => $no, // int
        'name' => $_POST['Lastname'], // String
        'firstName' => $_POST['Firstname'], // String
        'dateOfBirth' => $_POST['Date'], // Date
        'address' => $_POST['Address'], // String
        'city' => $_POST['City'], // String
        'country' => $_POST['Country'], // String
        'phoneNumber' => $_POST['Phone'], // String
        'email' => $_POST['Email'], // String
        'description' => htmlspecialchars($_POST['Description']) // String
    );
    $msgCP = $tedx_manager->changeProfil($argsCP);
    if ($msgCP->getStatus()) {
        $smarty->assign('success_profile', 'Profile successfully changed!');
    } else {
        $smarty->assign('error_profile', $msgCP->getMessage());
    }
}


//gets the POST password  
if (isset($_POST['changePSW'])) {
    $username = $tedx_manager->getUsername();
    if ($_POST['Password'] == $_POST['ConfirmPassword']) {
        $argsPSW = array(
            'ID' => $username, // String
            'password' => $_POST['Password']  // String
        );
        $msgCPSW = $tedx_manager->changePassword($argsPSW);
        if ($msgCPSW->getStatus()) {
            $smarty->assign('success_password', 'The password was successully changed.');
        } else {
            $smarty->assign('error_password', $msgCPSW->getMessage());
        }
    } else {
        $smarty->assign('error_password', 'The passwords entered differ.');
    }
}
$person = $tedx_manager->getLoggedPerson()->getContent();
//displays the person on the page via Smarty
$smarty->assign('person', $person);


$smarty->display('user_profile.tpl');
include ('userbar.php');
?>
