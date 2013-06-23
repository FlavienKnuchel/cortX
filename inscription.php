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
    //disassemble the url
    $cameFrom=explode("/",$_SERVER['HTTP_REFERER']);
//check the interesting part (file name)
    $cameFrom=explode('?',$cameFrom[5]);
//if it is event_detail.php
    if($cameFrom[0]=="event_detail.php"){
        /* make the "back" link go to the good event_detail pag
         *  the explode is to avoid repeating the get infos when going back and forth
         *  from event_detail page to inscription page
        */
        $userCameFrom=explode("&",$_SERVER['HTTP_REFERER']);
        //selection the good part of the explode
        $userCameFrom=$userCameFrom[0];
        $smarty->assign('userCameFrom',$userCameFrom);
    }//if
    else{
        //do nothing
    }//else
}//if
else{
    //do nothing
}




/*------------------------------ Check the event which the registration is for ------------------------------*/
//if the event Number is specified somewhere
if(isset($_GET['eventNo']) OR isset($_SESSION['eventNo'])){
    //if it is specified in get
    if(isset($_GET['eventNo'])) {
        //stock it in session
        $_SESSION['eventNo']=$_GET['eventNo'];
    }
    //else it is in the session already
}
else{
    //if the number is not specified, there's a problem
    header("Location: 404.php");
}
/*------------------------------ formular processing, and registration  ------------------------------*/
//initializing the error variable
$error='';



//if the post datas are set (if motivation is sent, even empty, it means the user is submitting the formular)
if(isset($_POST['motivation'])){
    //if the user is logged
    if ($tedx_manager->isLogged()) {
        //check if the status has been entered
        if(!is_null(checkStatus())){
            //is is a save or a send?
            // if it is a send
            if(checkStatus()=="send"){
                //if the motivation is filled
                if(checkMotivation()){
                    //send the registration
                    Register(checkStatus());
                    $registrationSuccess=true;
                }//if
                else{
                    //set the error for motivation filling
                    $error="Please, fill in your motivation if you want to send your inscription";
                }//else
            }//if
            //if it is a save
            else{
                Register(checkStatus());
                $registrationSuccess=true;
            }//else
        }//if
        else{
            //set the error for status
            $error="status";
        } //else

    }//if

    else{
        //test if all the fields of the form are filled
        //test if the password id correct
        if(confirmPassword()){
            //create an array with the variables
            $visitor=createVisitorArray();
            //try to create the visitor
            $messageRegisterVisitor=$tedx_manager->registerVisitor($visitor);

            //if the registration went well
            if($messageRegisterVisitor->getStatus()){
                //set the registration suce to true
                $registrationSuccess=true;
                //login the user
                $messageLogin = $tedx_manager->login($_POST['username'], $_POST['password']);
                //if logged in

                if($messageLogin->getStatus()){
                    //assign true tu the smarty value (for the userbar display
                    $smarty->assign('loggedin', true);
                }


                //check if the status has been entered
                if(!is_null(checkStatus())){
                    //is is a save or a send?
                    // if it is a send
                    if(checkStatus()=="send"){
                        //if the motivation is filled
                        if(checkMotivation()){
                            //send the registration
                            Register(checkStatus());
                            $registrationSuccess=true;
                        }
                        else{
                            //set the error for motivation filling
                            $error="Please, fill in your motivation if you want to send your inscription";
                        }//else
                    }//if
                    //if it is a save
                    else{
                        Register(checkStatus());
                        $registrationSuccess=true;
                    }
                }
                else{
                    //set the error for status
                    $error="status";
                }
            }//if
            else{
                //if the registration didn't go well
                $error=$messageRegisterVisitor->getMessage();
            }//else

        }//if
        else{
            //set the error for password
            $error="Please Check your password again!";
        }//else
    }//else
}
else{
    //don't do anything but display the formular
}

//if everything went well, the go to the homepage and display a message
if(isset($registrationSuccess)){
    header("Location: events.php?registrationSuccess=true");
}

//stock the error message in smarty
$smarty->assign('error', $error);

//send the filled datas, so we can collect them, and in case of error, no need to retype them
var_dump($_POST);
sendFilledDatas();
/*---------------------------- normal inscription display  -----------------------------*/
$smarty->display('events_registerToEvent.tpl');
include 'userbar.php';


/*---------------------------- functions -----------------------------*/

//test if the password and passwordConfirm are the same
function confirmPassword(){
    if(isset($_POST['password'])){
        if($_POST['password']==$_POST['confirmPassword']){
            return true;
        }
        else{
            return false;
        }
    }
}

//create an array with the visitor infos
function createVisitorArray(){
    $visitor= array(
        'name'        => $_POST['firstname'],
        'firstname'   => $_POST['lastname'],
        'dateOfBirth' => $_POST['date'],
        'address'     => $_POST['address'],
        'city'        => $_POST['city'],
        'country'     => $_POST['country'],
        'phoneNumber' => $_POST['phone'],
        'email'       => $_POST['email'],
        'description' => "",
        'idmember'    => $_POST['username'],
        'password'    => $_POST['password']
    );
    return $visitor;
}

//check if the motivation is filled
function checkMotivation(){
    if(isset($_POST['motivation'])&&!empty($_POST['motivation'])){
        return true;
    }
    else{
        return false;
    }
}


//check if the status is send or save
function checkStatus(){

    if(isset($_POST['save'])){
        return "save";
    }
    elseif(isset($_POST['send'])){
        return "send";
    }
}


//create and array with the keywords
function arrayKeywords(){
    $keywords=array();
    if(isset($_POST['keyword1']))array_push( $keywords,$_POST['keyword1']);
    if(isset($_POST['keyword2']))array_push( $keywords,$_POST['keyword2']);
    if(isset($_POST['keyword3']))array_push( $keywords,$_POST['keyword3']);
    return $keywords;
}

//send the filled datatas via post to display them in the fields if there's an error
function sendFilledDatas(){
    global $smarty;
    //create an array with the filled infos
    $registration=array();
    if(isset($_POST['firstName']))$registration['firstname'] = $_POST['firstName'];
    if(isset($_POST['lastname']))$registration['lastname']= $_POST['lastname'];
    if(isset($_POST['username']))$registration['username']= $_POST['username'];
    if(isset($_POST['date']))$registration['date']=$_POST['date'];
    if(isset($_POST['address']))$registration['address']= $_POST['address'];
    if(isset($_POST['city']))$registration['city']= $_POST['city'];
    if(isset($_POST['country']))$registration['country']= $_POST['country'];
    if(isset($_POST['telephone']))$registration['telephone']=$_POST['telephone'];
    if(isset($_POST['email']))$registration['email']= $_POST['email'];
    if(isset($_POST['username']))$registration['username']= $_POST['username'];
    if(isset($_POST['type']))$registration['type']= $_POST['type'];
    if(isset($_POST['typeDescription']))$registration['typeDescription']= $_POST['typeDescription'];
    if(isset($_POST['motivation']))$registration['motivation']= $_POST['motivation'];
    if(isset($_POST['keyword1']))$registration['keyword1']= $_POST['keyword1'];
    if(isset($_POST['keyword2']))$registration['keyword2']= $_POST['keyword2'];
    if(isset($_POST['keyword3']))$registration['keyword3']= $_POST['keyword3'];

        //assign the array to smarty
        $smarty->assign('filledDatas', $registration);
}

//register the user for the actual event
function Register($registrationStatus){
    global $tedx_manager;
    $person=$tedx_manager->getLoggedPerson()->getContent();
    $event=$tedx_manager->getEvent($_SESSION['eventNo'])->getContent();
    $slots=$tedx_manager->getSlotsFromEvent($event)->getcontent();
    $type=$_POST['type'];
    $typeDescription=$_POST['typeDescription'];

    $registration = array(
        'person' => $person, // object Person
        'event' => $event, // object Event
        'slots' => $slots, // List of objects Slot
        'registrationdate' => date('Y-m-d'), // Date
        'type' => $type, // String
        'typedescription' => $typeDescription // String
    );
    echo $tedx_manager->registerToAnEvent($registration)->getMessage();

    //ERREURS ----------------------------------------------- VOIR AVEC LES IT
  //  echo $tedx_manager->addKeywordsToAnEvent(arrayKeywords(), $person,$event)->getStatut();
   // echo $tedx_manager->addMotivationToAnEvent($_POST['motivation'], $event, $person)->getStatut();

    if($registrationStatus=="sent"){
        $participant=$tedx_manager->getParticipant($person->getNo());
        $waitingRegistration = $tedx_manager->getRegistration(
            array(
                'status' =>'Waiting',
                'event' => $event,
                'participant' => $participant))->getContent();
        $tedx_manager->sendRegistration($waitingRegistration);
    }
    elseif($registrationStatus=="save"){
    }
    else{
        header('Location:404.php');
    }

}



?>