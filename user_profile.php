
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
if ($tedx_manager->isLogged()) {
    $smarty->assign('loggedin', TRUE);
    $person = $tedx_manager->getLoggedPerson()->getContent();
    $edit = FALSE;
    if (isset($_POST['Name'])) {
        $name = $_POST['Name'];
        $edit = TRUE;
    } else {
        $smarty->assign('name', $person->getName());
    }
    if (isset($_POST['Firstname'])) {
        $firstname = $_POST['Firstname'];
        $edit = TRUE;
    } else {
        $smarty->assign('firstname', $person->getFirstName());
    }
    if (isset($_POST['Date'])) {
        $dateofbirth = $_POST['Date'];
        $edit = TRUE;
    } else {
        $smarty->assign('birthdate', $person->getDateOfBirth());
    }
    if (isset($_POST['Address'])) {
        $address = $_POST['Address'];
        $edit = TRUE;
    } else {
        $smarty->assign('address', $person->getAddress());
    }
    if (isset($_POST['City'])) {
        $city = $_POST['City'];
        $edit = TRUE;
    } else {
        $smarty->assign('city', $person->getCity());
    }
    if (isset($_POST['Country'])) {
        $country = $_POST['Country'];
        $edit = TRUE;
    } else {
        $smarty->assign('country', $person->getCountry());
    }
    if (isset($_POST['Phone'])) {
        $phone = $_POST['Phone'];
        $edit = TRUE;
    } else {
        $smarty->assign('phone', $person->getPhoneNumber());
    }
    if (isset($_POST['Email'])) {
        $email = $_POST['Email'];
        $edit = TRUE;
    } else {
        $smarty->assign('email', $person->getEmail());
    }
    if (isset($_POST['Description'])) {
        $desc = htmlspecialchars($_POST['Description']);
        $edit = TRUE;
    } else {
        $smarty->assign('desc', $person->getDescription());
    }
    if ($edit == TRUE) {
        $args = array(
            $tedx_manager->getLoggedPerson()->getContent()->getNo(),
            $name, $firstname, $dateofbirth, $address, $city, $country,
            $phone, $email, $desc);
            var_dump($args);
        if ($tedx_manager->changeProfil($args)->getStatus()) {
            print ('<p class="error_msg">');
            print ("Profile changed with great success!.</p>");
        } else {
            print ('<p class="error_msg">');
            print ("Profile did not change!.</p>");
        }   
    }
    if (isset($_POST['Password'])) {
        if ($_POST['Password'] == $_POST['ConfirmPassword']) {
            $args = array(
                $tedx_manager->getUsername(),
                $_POST['Password']
            );
            if ($tedx_manager->changePassword($args)->getStatus()) {
                print ('<p class="error_msg">');
                print ("Password changed with great success!.</p>");
            } else {
                print ('<p class="error_msg">');
                print ("Password did not change!.</p>");
            }
        } else {
            print ('<p class="error_msg">');
            print ("The passwords does not match.</p>");
        }
    }
} else {
    print ('<p class="error_msg">');
    print ("You are not logged in, you cannot access this content.</p>");
}
$smarty->display('user_profile.tpl');
include 'userbar.php';
?>
