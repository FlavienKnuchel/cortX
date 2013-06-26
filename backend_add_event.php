
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
if(isset($_GET['create'])){
    //if the location filed is set
    if(isset($_GET['location'])){
        //check if the location already exists
        $messageLocation=$tedx_manager->getLocation($_GET['location']);
        //if it exists
        if($messageLocation->getStatus()){
            //get it
            $location=$messageLocation->getContent();
        }
        else{
            //else create a new location with the infos
            $args = array(
                'Name'      => $_GET['location'],
                'Address'   => $_GET['address'],
                'City'      => $_GET['city'],
                'Country'   => $_GET['country'],
                'Direction' => ''
            );
            $messageAddLocation=$tedx_manager->addLocation($args);
            if($messageAddLocation->getStatus()){
                //if location creation exists
                $location=$messageLocation->getContent();
            }
            else{
                //if not
                $error=$messageAddLocation->getMessage();
            }
        }
    }
    else{
        $error="Fill the location field please";
    }
    //if the location process went well
    if(isset($location)){
        
    }

}

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