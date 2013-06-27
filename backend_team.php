<?php

/*
 * backend_team.php
 *
 * Author : Andreane et Noemie
 * Date : 18.06.2013
 *
 * Description : page to manage the team and the roles
 */
include 'header.php';
$_SESSION['ariane2']="Team";
$_SESSION['ariane2url']=$_SERVER['SCRIPT_NAME'];
include 'menu_backend.php';
if ($tedx_manager->isLogged()) {
//gets the actions
    if (isset($_GET['action']) && $_GET['action'] == 'add') {
        //gets the selected person
        $person = $tedx_manager->getPerson($_GET['no'])->getContent();
        //sets the person as organizer
        $msgSetPersonAsOrg = $tedx_manager->setPersonAsOrganizer($person);
        if ($msgSetPersonAsOrg->getStatus()) {//test if it was successfull
            $smarty->assign('msg_org', $msgSetPersonAsOrg->getMessage());
        } else {
            $smarty->assign('err_org', $msgSetPersonAsOrg->getMessage());
        }
    }
    //assign the person to modify in smarty
    if (isset($_GET['action']) && $_GET['action'] == 'modify') {
        $person = $tedx_manager->getPerson($_GET['no'])->getContent();
        $smarty->assign('person', $person);
    }
    //modifies the person selected
    if (isset($_POST['Modify'])) {
        $argsCP = array(//gets all the array
            'no' => $_POST['personNo'], // int
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
            $smarty->assign('msg_CP', $msgCP->getMessage());
        }
        //if the default teamRole is not selected, affects the team role to the organizer
        if ($_POST['teamRoles'] != '---') {

            $teamRole = $tedx_manager->getTeamRole($_POST['teamRoles'])->getContent();
            $organizer = $tedx_manager->getOrganizer($_POST['personNo'])->getContent();
            $argsTR = array(
                'organizer' => $organizer,
                'teamRole' => $teamRole
            );
            $msgAffectTeamrole = $tedx_manager->affectTeamRole($argsTR);
            if ($msgAffectTeamrole->getStatus()) {
                $smarty->assign('msg_TR', $msgAffectTeamrole->getMessage());
            }
        }
    }
    //adds a person to the DB, set as organizer, and affect the teamrole
    if (isset($_POST['Add'])) {
        $argsRV = array(//gets all the array
            'name' => $_POST['Lastname'], // String
            'firstname' => $_POST['Firstname'], // String
            'dateOfBirth' => $_POST['Date'], // Date
            'address' => $_POST['Address'], // String
            'city' => $_POST['City'], // String
            'country' => $_POST['Country'], // String
            'phoneNumber' => $_POST['Phone'], // String
            'email' => $_POST['Email'], // String
            'idmember' => $_POST['idmember'],
            'password' => $_POST['password']
        );
        //if the default teamRole is not selected, 
        if ($_POST['teamRoles'] != '---') {
            //register a new person
            $msgRV = $tedx_manager->registerVisitor($argsRV);
            if ($msgRV->getStatus()) {//success!
                $smarty->assign('msg_RV', $msgCP->getMessage());
                //sets the person as roganizer
                $msgSetPersonAsOrg = $tedx_manager->setPersonAsOrganizer(
                        $msgRV->getContent()
                );
                if ($msgSetPersonAsOrg->getStatus()) { //success!

                    $teamRole = $tedx_manager->getTeamRole($_POST['teamRoles'])->getContent();
                    $organizer = $msgSetPersonAsOrg->getContent();
                    $argsTR = array(
                        'organizer' => $organizer,
                        'teamRole' => $teamRole
                    );
                    $msgAffectTeamrole = $tedx_manager->affectTeamRole($argsTR);
                    $smarty->assign('msg_org', $msgSetPersonAsOrg->getMessage());
                    if (!$msgAffectTeamrole->getStatus()) {
                        $smarty->assign('msg_TR', $msgAffectTeamrole->getMessage());
                    } 
                } else {
                    $smarty->assign('err_org', $msgSetPersonAsOrg->getMessage());
                }
            } else {
                $smarty->assign('err_RV', $msgRV->getMessage());
            }
        } else {
            $smarty->assign('error_TR', 'PLease select a teamrole in the list!');
        }
    }
    $msgPersons = $tedx_manager->getPersons();
    if ($msgPersons->getStatus()) {
        $arrayPersons = $msgPersons->getContent();
        $smarty->assign('persons', $arrayPersons);
    }
    $msgOrganizers = $tedx_manager->getOrganizers();
    if ($msgOrganizers->getStatus()) {
        $arrayOrganizers = $msgOrganizers->getContent();
        $smarty->assign('organizers', $arrayOrganizers);
    }

    $teamroles = $tedx_manager->getTeamRoles()->getContent();
    $smarty->assign('teamroles', $teamroles);
    $smarty->display('backend_team.tpl');
} else {
    header('Location:404.php');
}
include 'userbar.php';
?>
