
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
$error='';
//if the create button has been pushed
echo "GET";
var_dump($_GET);
echo "POST";
var_dump($_POST);
if(isset($_GET['create'])){
    //if the location filed is set
    if(!empty($_POST['location'])){
        $name=$_POST['location'];
        //check if the location already exists
        $messageLocation=$tedx_manager->getLocation($name);
        //if it exists
        echo"messagelocation";
        var_dump($messageLocation);
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
            echo "args";
            var_dump($args);
            $messageAddLocation=$tedx_manager->addLocation($args);
            echo "messageAddLocation:";
            var_dump($messageAddLocation);
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
        if(isset($_POST['slot1'])&&!empty($_POST['slotStartingTime']) && !empty($_POST['slotEndingTime']) && !empty($_POST['slotEndingTime'])){
            $slot1 = array (
                'happeningDate'  => $_POST['happeningDate'],
                'startingTime'   => $_POST['slotStartingTime'],
                'endingTime'     => $_POST['slotEndingTime'],
            );
        }//if
        else{
            $error="Please fill in all the slots fields";
        }//else
        echo"slot1";
        var_dump($slot1);
        echo "location:";
        var_dump($location);
    }//if
    if(strlen($error)==0){
        
    }//if

}

echo "error";
var_dump($error);
$smarty->assign('error',$error);

$smarty->display('backend_add_event.tpl');
include 'userbar.php';

/*------------------------------------------ functions -------------------------------------------*/
function addEvent($event){
    // Array pour création d'un Event
    $argsCreateEvent = array(
        'mainTopic'     => 'Les chaussettes à Baudet',
        'startingDate'  => '2013-01-01',
        'endingDate'    => '2013-01-02',
        'startingTime'  => '09:00:00',
        'endingTime'    => '18:00:00',
        'description'   => 'Parce qu il le vaut bien',
    );
}

?>