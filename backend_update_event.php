<?php

/*
 * backend_update_event.php
 *
 * Author : Andreane et Noemie
 * Date : 18.06.2013
 *
 * Description : page to create a new event, with slot and speaker
 */
include 'header.php';
if ($tedx_manager->isLogged() && ($tedx_manager->isOrganizer() || $tedx_manager->isValidator() || $tedx_manager->isAdministrator() || $tedx_manager->isSuperadmin())) {
  	$_SESSION['ariane3'] = "Update event";
    $_SESSION['ariane3url'] = $_SERVER['SCRIPT_NAME'];
    include 'menu_backend.php';
	

	if(isset($_GET['eventNo'])){
		//if we visit the page for the first time	
		if(isset($_REQUEST['eventNo'])){//get the event infos
			$messageEvent=$tedx_manager->getEvent($_GET['eventNo']);
			if($messageEvent->getStatus()){
				$event=$messageEvent->getEvent();
				$smarty->assign('event',$event);
				$messageSlots=$tedx_manager->getSlotsFromEvent($event);
				if($messageSlots->getStatus()){
					$slots=$messageSlots->getContent();
					$smarty->assign('slots',$slots);
					$_SESSION['iterationNumber']=sizeof($slots)-1;
					$smarty->assign('iterationNumber',$_SESSION['iterationNumber']);
					$eventUpdateArray=array();
					for ($i = 0; $i <= $_SESSION['iterationNumber']; $i++) {
						$slotStartingTimeAlt = "slotStartingTime" . $i;
						$slotEndingTimeAlt = "slotEndingTime" . $i;
						$happeningDateAlt = "happeningDate" . $i;
						if (isset($_POST[$slotStartingTimeAlt]))
							$eventUpdateArray[$slotStartingTimeAlt] = $_POST[$slotStartingTimeAlt];
						if (isset($_POST[$slotEndingTimeAlt]))
							$eventUpdateArray[$slotEndingTimeAlt] = $_POST[$slotEndingTimeAlt];
						if (isset($_POST[$happeningDateAlt]))
							$eventUpdateArray[$happeningDateAlt] = $_POST[$happeningDateAlt];
					}
					$smarty->assign('filledDatas',$eventUpdateArray);
				}
				else{
					$error=$messageSlots->getMessage();	
				}
			}
			else{
				$error=$messageEvent->getMessage();	
			}
	}
	else{
		$error="No event selected";	
	}				
}
else{
	//if we reload the page
	if(isset($_REQUEST['update'])){
		if (strlen($error) == 0) {
                //error management for filling the fields
                if (!empty($_POST['mainTopic'])) {
                    if (!empty($_POST['startDate'])) {
                        if (!empty($_POST['endDate'])) {
                            if (!empty($_POST['startTime'])) {
                                if (!empty($_POST['endTime'])) {
                                    if (!empty($_POST['description'])) {
                                        if (isset($location)) {
                                            for ($i = 0; $i <= $_SESSION['iterationNumber']; $i++) {
                                                $slotStartingTimeAlt = "slotStartingTime" . $i;
                                                $slotEndingTimeAlt = "slotEndingTime" . $i;
                                                $happeningDateAlt = "happeningDate" . $i;
                                                var_dump($_POST[$slotStartingTimeAlt]);
                                                var_dump($_POST[$slotEndingTimeAlt]);
                                                var_dump($_POST[$happeningDateAlt]);
                                                if (!empty($_POST[$slotStartingTimeAlt])) {
                                                    if (!empty($_POST[$slotEndingTimeAlt])) {
                                                        if (!empty($_POST[$happeningDateAlt])) {
                                                            
                                                        } else {
                                                            $error = "Please fill the slot " . $i . " happening date";
                                                        }
                                                    } else {
                                                        $error = "Please fill the slot " . $i . " ending time";
                                                    }
                                                } else {
                                                    $error = "Please fill the slot " . $i . " starting time";
                                                }
                                            }
                                        } else {
                                            $error = "Please fill the location field";
                                        }
                                    } else {
                                        $error = "Please fill the description field";
                                    }
                                } else {
                                    $error = "Please fill the ending Time field";
                                }
                            } else {
                                $error = "Please fill the starting Time field";
                            }
                        } else {
                            $error = "Please fill the endDate field";
                        }
                    } else {
                        $error = "Please fill the starting date field";
                    }
                } else {
                    $error = "Please fill the main topic field";
                }
            }
	}
	if(strlen($error)==0){
			$args = array(
		'no'           => $_POST['eventNo'],
		'mainTopic'    => $_POST['mainTopic'],
		'description'  => $_POST['description'],
		'startingDate' => $_POST['startDate'],
		'endingDate'   => $_POST['endDate'],
		'startingTime' => $_POST['startTime'],
		'endingTime'   => $_POST['endTime']
		);
		$messageUpdate=$tedx_manager->changeEvent($args);
		if($messageUpdate->getStatus()){
			$updatedEvent=$messageUpdate->getContent();
			$goodMessage="The event has been updated!";
			$smarty->assign('goodMessage',$goodMessage);
		}
		else{
			$error=$messageUpdate->getMessage();
		}
}
	$sendFilledDatas();	
}
	
		
	$smary->assign('error',$error);
    $smarty->display('backend_update_event.tpl');
    include 'userbar.php';
} else {
    header('Location:404.php');
}
function sendFilledDatas() {

    global $smarty;
    //create an array with the filled infos
    $eventAddForm = array();
    if (isset($_POST['mainTopic']))
        $eventAddForm['mainTopic'] = $_POST['mainTopic'];
    if (isset($_POST['startDate']))
        $eventAddForm['startDate'] = $_POST['startDate'];
    if (isset($_POST['endDate']))
        $eventAddForm['endDate'] = $_POST['endDate'];
    if (isset($_POST['startTime']))
        $eventAddForm['startTime'] = $_POST['startTime'];
    if (isset($_POST['endTime']))
        $eventAddForm['endTime'] = $_POST['endTime'];
    if (isset($_POST['description']))
        $eventAddForm['description'] = $_POST['description'];
    if (isset($_POST['location']))
        $eventAddForm['location'] = $_POST['location'];
    if (isset($_POST['city']))
        $eventAddForm['city'] = $_POST['city'];
    if (isset($_POST['address']))
        $eventAddForm['address'] = $_POST['address'];
    if (isset($_POST['country']))
        $eventAddForm['country'] = $_POST['country'];
    //assign the array to smarty
    for ($i = 0; $i <= $_SESSION['iterationNumber']; $i++) {
        $slotStartingTimeAlt = "slotStartingTime" . $i;
        $slotEndingTimeAlt = "slotEndingTime" . $i;
        $happeningDateAlt = "happeningDate" . $i;
        if (isset($_POST[$slotStartingTimeAlt]))
            $eventAddForm[$slotStartingTimeAlt] = $_POST[$slotStartingTimeAlt];
        if (isset($_POST[$slotEndingTimeAlt]))
            $eventAddForm[$slotEndingTimeAlt] = $_POST[$slotEndingTimeAlt];
        if (isset($_POST[$happeningDateAlt]))
            $eventAddForm[$happeningDateAlt] = $_POST[$happeningDateAlt];
    }
    $smarty->assign('filledDatas', $eventAddForm);
}
?>
