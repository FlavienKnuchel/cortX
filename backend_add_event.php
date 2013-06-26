
<?php
/*
* backend_add_event.php
*
* Author : Andreane et Noemie
* Date : 18.06.2013
*
* Description : page to create a new event, with slot and speaker
*/
include 'header.php';
include 'menu_backend.php';
//if the create button has been pushed
if(isset($_GET['create'])){
    //if the location filed is set
    if(!empty($_POST['location'])){
        $name=$_POST['location'];
        //check if the location already exists
        $messageLocation=$tedx_manager->getLocation($name);
        //if it exists
        if($messageLocation->getStatus()){
            //get it
            $location=$messageLocation->getContent();
        }//if
        else{
            //else create a new location with the infos
            $args = array(
                'Name'      => $_POST['location'],
                'Address'   => $_POST['address'],
                'City'      => $_POST['city'],
                'Country'   => $_POST['country'],
                'Direction' => ''
            );
            $messageAddLocation=$tedx_manager->addLocation($args);
            if($messageAddLocation->getStatus()){
                //if location creation exists
                $location=$messageLocation->getContent();
            }//if
            else{
                //if not
                $error=$messageAddLocation->getMessage();
            }//else

        }//else
    }//if
    else{
        $error="Fill the location field please";
    }//else
    //if the location process went well
    if(isset($location)){
        $slots=array();
        //loop sur les slots
        if(isset($_POST['slot1'])&&!empty($_POST['slotStartingTime']) && !empty($_POST['slotEndingTime']) && !empty($_POST['slotEndingTime'])){
            $slot1 = array (
                'happeningDate'  => $_POST['happeningDate'],
                'startingTime'   => $_POST['slotStartingTime'],
                'endingTime'     => $_POST['slotEndingTime'],
            );
            array_push($slots,$slot1);
        }//if
        else{
            $error="Please fill in all the slots fields";
        }//else
    }//if
    //check if there's not already an error
    if(strlen($error)==0){
        //error management for filling the fields
        if(!empty($_POST['mainTopic'])){
            if(!empty($_POST['startDate'])){
                if(!empty($_POST['endDate'])){
                    if(!empty($_POST['startTime'])){
                        if(!empty($_POST['endTime'])){
                            if(!empty($_POST['description'])){
                                if(isset($location)){}
                                else{$error="Error with the location field";}}
                            else{$error="Please fill the description field";}}
                        else{$error="Please fill the ending Time field";}}
                    else{$error="Please fill the starting Time field";}}
                else{$error="Please fill the endDate field";}}
            else{$error="Please fill the starting date field";}}
        else{$error="Please fill the main topic field";}
    }
    if(strlen($error)==0){

        $argsCreateEvent = array(
            'mainTopic'     => $_POST['mainTopic'],
            'startingDate'  => $_POST['startDate'],
            'endingDate'    => $_POST['endDate'],
            'startingTime'  => $_POST['startTime'],
            'endingTime'    => $_POST['endTime'],
            'description'   => $_POST['description'],
            'locationName'  => $location->getName()
        );
        $arrayAddEvent=array('event'=>$argsCreateEvent,'slots'=>$slots);
        $messageAddEvent=$tedx_manager->addEvent($arrayAddEvent);
        if($messageAddEvent->getStatus()){
            $goodMessage=$messageAddEvent->getMessage();
            $smarty->assign('goodMessage',$goodMessage);
        }
        else{
            $error=$messageAddEvent->getMesssage();
        }
    }//if

}

if(isset($error)){
    $smarty->assign('error',$error);
}


sendFilledDatas();
$smarty->display('backend_add_event.tpl');
include 'userbar.php';

/*------------------------------------------ functions -------------------------------------------*/

function sendFilledDatas(){

    global $smarty;
    //create an array with the filled infos
    $eventAddForm=array();
    if(isset($_POST['mainTopic']))$eventAddForm['mainTopic'] = $_POST['mainTopic'];
    if(isset($_POST['startDate']))$eventAddForm['startDate']= $_POST['startDate'];
    if(isset($_POST['endDate']))$eventAddForm['endDate']= $_POST['endDate'];
    if(isset($_POST['startTime']))$eventAddForm['startTime']=$_POST['startTime'];
    if(isset($_POST['endTime']))$eventAddForm['endTime']= $_POST['endTime'];
    if(isset($_POST['description']))$eventAddForm['description']= $_POST['description'];
    if(isset($_POST['location']))$eventAddForm['location']= $_POST['location'];
    if(isset($_POST['city']))$eventAddForm['city']=$_POST['city'];
    if(isset($_POST['address']))$eventAddForm['address']= $_POST['address'];
    if(isset($_POST['country']))$eventAddForm['country']= $_POST['country'];
    //assign the array to smarty
    $smarty->assign('filledDatas', $eventAddForm);
}//function

?>