<?php
/*
* backend_account.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to manage all the account
*/
include 'header.php';
$_SESSION['ariane2']="Accounts";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
include 'menu_backend.php';
$error='';
if(isset($_POST['update'])){ //process the edition
    $no = $_REQUEST['id'];
    $argsCP = array( //gets all the array
        'no' => $no, // int
        'name' => $_POST['Lastname'], // String
        'firstName' => $_POST['Firstname'], // String
        'dateOfBirth' => $_POST['Date'], // Date
        'address' => $_POST['Address'], // String
        'city' => $_POST['City'], // String
        'country' => $_POST['Country'], // String
        'phoneNumber' => $_POST['Phone'], // String
        'email' => $_POST['Email'], // String
    );
    $msgCP = $tedx_manager->changeProfil($argsCP);
    if ($msgCP->getStatus()) {
        $smarty->assign('changeSuccess', $msgCP->getMessage());
    }
    else{
        $error=$msgCP->getMessage();
    }


}
if(isset($_GET['deleteNo'])){
    $user=$tedx_manager->getPerson($_GET['deleteNo'])->getContent();
    $smarty->assign('delete',$user);
}
$messageAccounts=$tedx_manager->getPersons();
if($messageAccounts->getStatus()){
    $persons=$messageAccounts->getContent();
    $personsArray=array();
    foreach($persons as $person){
        $personArray=array(
            'firstname'=>$person->getFirstName(),
            'lastname'=>$person->getName(),
            'num'=>$person->getNo(),
        );
        array_push($personsArray,$personArray);
    }
    $smarty->assign('persons',$personsArray);
}
else{$error="Erreur durant la sélection des membres du site";}

if(isset($_GET['id'])){
    $messageSelectedPerson=$tedx_manager->getPerson($_GET['id']);
    if($messageSelectedPerson->getStatus()){
        $selectedPerson=$messageSelectedPerson->getContent();
        $smarty->assign('selectedPerson',$selectedPerson);
    }
    else{
        $error=$messageSelectedPerson->getMessage();
    }
}


$smarty->assign('error',$error);
$smarty->display('backend_account.tpl');
include 'userbar.php';
?>
