
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
//initialize the error variable
$error='';
//get the speakers
$messageSpeakers=$tedx_manager->getSpeakers();
$speakers=$messageSpeakers->getContent();
$speakersCustom=array();
foreach($speakers as $speaker){
    $speakersInfos=array('name'=>$speaker->getName(),'id'=>$speaker->getNo());
    array_push($speakersCustom,$speakersInfos);
}
//stock them in smarty
$smarty->assign('speakers',$speakersCustom);
//if the + slot button has been pushed
if(isset($_POST['addSlot'])){
    $iterationNumber=$_SESSION['iterationNumber'];
    $iterationNumber++;
    $_SESSION['iterationNumber']=$iterationNumber;
    $tempArray=array();
    for($i=0; $i<=$iterationNumber; $i++){
        array_push($tempArray, $i);
    }
    $smarty->assign('iterationNumber',$tempArray);
}
else{
    //if the create button has been pushed
    if(isset($_POST['create'])){
        //set the array for the display of the slots
        $iterationNumber=$_SESSION['iterationNumber'];
        $tempArray=array();
        for($i=0; $i<=$iterationNumber; $i++){
            array_push($tempArray, $i);
        }
        $smarty->assign('iterationNumber',$tempArray);
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
            for($i=0;$i<$_SESSION['iterationNumber'];$i++){
                //loop sur les slots
                $slotStartingTimeAlt="slotStartingTime".$i;
                $slotEndingTimeAlt="slotEndingTime".$i;
                $happeningDateAlt="happeningDate".$i;
                if(!empty($_POST[$slotStartingTimeAlt]) && !empty($_POST[$slotEndingTimeAlt]) && !empty($_POST[$happeningDateAlt])){
                    $slot = array (
                        'happeningDate'  => $_POST[$happeningDateAlt],
                        'startingTime'   => $_POST[$slotStartingTimeAlt],
                        'endingTime'     => $_POST[$slotEndingTimeAlt],
                    );
                    array_push($slots,$slot);
                }//if
                else{
                    $error="Please fill in all the slots fields";
                }//else
            }

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
                                    else{}}
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
                header("Location: backend_home.php?eventAddSuccess=true");
            }//if
            else{
                $error=$messageAddEvent->getMesssage();
            }//else
        }//if

    }//if
    else{
        //if we want to delete the last slot
        if(isset($_POST['deleteSlot'])){
            //if this is the last slot
            if($_SESSION['iterationNumber']==0){
                //don't delete it
                $tempArray=array(0);
                $smarty->assign('iterationNumber',$tempArray);
            }
            else{
                //delete the last slot
                $iterationNumber=$_SESSION['iterationNumber'];
                $iterationNumber--;
                $_SESSION['iterationNumber']=$iterationNumber;
                $tempArray=array();
                for($i=0; $i<=$iterationNumber; $i++){
                    array_push($tempArray, $i);
                }
                $smarty->assign('iterationNumber',$tempArray);
            }
        }
        else{
            //if we visit the page for the first time
            $_SESSION['iterationNumber']=0;
            $tempArray=array(0);
            $smarty->assign('iterationNumber',$tempArray);
        }

    }//else

}



//if the error is set
if(strlen($error)>0){
    //stock the error in smarty
    $smarty->assign('error',$error);
}

//send the already filled datas to take them back on the page
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
    for($i=0;$i<=$_SESSION['iterationNumber'];$i++){
        $slotStartingTimeAlt="slotStartingTime".$i;
        $slotEndingTimeAlt="slotEndingTime".$i;
        $happeningDateAlt="happeningDate".$i;
        if(isset($_POST[$slotStartingTimeAlt]))$eventAddForm[$slotStartingTimeAlt] = $_POST[$slotStartingTimeAlt];
        if(isset($_POST[$slotEndingTimeAlt]))$eventAddForm[$slotEndingTimeAlt] = $_POST[$slotEndingTimeAlt];
        if(isset($_POST[$happeningDateAlt]))$eventAddForm[$happeningDateAlt] = $_POST[$happeningDateAlt];
    }
    $smarty->assign('filledDatas', $eventAddForm);
}//function

?>