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

/*------------------------------ Checke the event which the registration is for ------------------------------*/
if(isset($_GET['eventNo'])){
    $eventNo=$_GET['eventNo'];
}
else{
    header("Location: 404.php");
}

/*------------------------------ formular processing, and registration  ------------------------------*/
//tes if all the fiels of the form are filled
if(formFilled()){
    //test if the password id correct
    if(confirmPassword()){
        //create an array with the variables
        $visitor=createVisitorArray();
        //test if the motivation is fulled
        if($tedx_manager->registerVisitor($visitor)->getStatus()){
            //if the registration went well
            //registration OK OK OK OK OK OK OK OK OK OK OK OK
            //login le user
            print "<p>Your account has been created</p>";
        }//if
        else{
            echo "<p>Error - couldn't create the account</p>";
        }//else
        //check if the status has been entered
        if(!is_null(checkStatus())){
            //is is a save or a send?
            // if it is a send
            if(checkStatus()=="send"){
                //if the motivation is filled
                if(checkMotivation()){
                    createRegistrationArray();
                    //send the registration
                    Register($status);
                    echo "<p>Your registration has been sent</p>";
                }
                else{
                    //set the error for motivation filling
                    $error="fillMotivation";
                }//else
                $status="Sent";
            }//if
            //if it is a save
            else{
                $status="Pending";
            }
        }
        else{
            //set the error for status
            $error="status";
        }

    }//if
    else{
        //set the error for password
        $error="confirmPassword";
    }//else
}//if
else{
    //set the error for formular filling
    $error="filllFormular";
}//else



/*---------------------------- display event -----------------------------*/
$smarty->display('events_registerToEvent.tpl');
include 'userbar.php';


/*---------------------------- functions -----------------------------*/

//test if the formular infos are set
function formFilled(){
    if( !empty($_POST['firstname']) && !empty($_POST['lastname']) && !empty($_POST['date']) && !empty($_POST['address'])
        && !empty($_POST['city']) && !empty($_POST['country']) && !empty($_POST['phone'])
        && !empty($_POST['email']) && !empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['confirmPassword'])
        &&!empty($_POST['type']) && !empty($_POST['typeDescription'])){
        return true;
    }
    else{
        return false;
    }
}

function confirmPassword(){
    if($_POST['password']==$_POST['confirmPassword']){
        return true;
    }
    return false;
}

function createVisitorArray(){
    $person= array(
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
    return $person;
}

function checkMotivation(){
    if(isset($_POST['motivation'])&&!empty($_POST['motivation'])){
        return true;
    }
    else{
        return false;
    }
}

function Register($registrationStatus){

    //check registration status

    //create registration

    //assign motivation

    //assign keywords

}

function checkStatus(){

    if(isset($_POST['save'])){
        return "save";
    }
    elseif(isset($_POST['send'])){
        return "send";
    }
}

function createRegistration($status, $type, $typedescription){

}
function assignMotivation($motivation){

}

function arrayKeywords(){
    if(isset($_POST['keyword1']))array_push( $keywords,$_POST['keyword1']);
    if(isset($_POST['keyword2']))array_push( $keywords,$_POST['keyword2']);
    if(isset($_POST['keyword3']))array_push( $keywords,$_POST['keyword3']);
    return $keywords;
}

function sendFilledDatas(){
    global $smarty;
    //create an array with the filled infos
    $registration=array();
    if(isset($_POST['firstName']))array_push($registration['firstname'], $_POST['firstName']);
    if(isset($_POST['lastname']))array_push($registration['lastname'], $_POST['lastname']);
    if(isset($_POST['username']))array_push($registration['username'], $_POST['username']);
    if(isset($_POST['date']))array_push($registration['date'],$_POST['date']);
    if(isset($_POST['address']))array_push($registration['address'], $_POST['address']);
    if(isset($_POST['city']))array_push($registration['city'], $_POST['city']);
    if(isset($_POST['country']))array_push($registration['country'], $_POST['country']);
    if(isset($_POST['telephone']))array_push($registration['telephone'],$_POST['telephone']);
    if(isset($_POST['email']))array_push($registration['email'], $_POST['email']);
    if(isset($_POST['username']))array_push($registration['username'], $_POST['username']);
    if(isset($_POST['type']))array_push($registration['type'], $_POST['type']);
    if(isset($_POST['typeDescription']))array_push($registration['typeDescription'], $_POST['typeDescription']);
    if(isset($_POST['motivation']))array_push($registration['motivation'], $_POST['motivation']);
    if(isset($_POST['keyword1']))array_push($registration['keyword1'], $_POST['keyword1']);
    if(isset($_POST['keyword2']))array_push($registration['keyword2'], $_POST['keyword2']);
    if(isset($_POST['keyword3']))array_push($registration['keyword3'], $_POST['keyword3']);

    //if the array of datas isn't empty
    if(!empty($resistration)){
        //assign it to smarty
        $smarty->assign('filledDatas', $registration);
    }//if
}

function createregistationArray(){
    $registration = array(
        'person' => $aPerson, // object Person
        'event' => $anEvent, // object Event
        'slots' => $aListOfSlots, // List of objects Slot
        'registrationdate' => '1991-04-26', // Date
        'type' => 'Presse', // String
        'typedescription' => 'Redacteur chez Edipresse SA' // String
    );
    return $registration;
}



?>