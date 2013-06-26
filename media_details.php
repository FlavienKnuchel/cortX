<?php

/*
 * media.php
 *
 * Author : Anthony Da Silva
 * Date : 14.06.2013
 *
 * Description : manages the video fo the events
 */

include 'header.php';
include 'menu_frontend.php';


if(isset($_GET['eventNo'])&&isset($_GET['speakerNo'])){
    $messageEvent=$tedx_manager->getEvent($_GET['eventNo']);
    $messageSpeaker=$tedx_manager->getSpeaker($_GET['speakerNo']);
    if($messageEvent->getStatus() AND $messageSpeaker->getStatus()){
        $event=$messageEvent->getContent();
        $speaker=$messageSpeaker->getcontent();
        //create the arguments array
        $args = array (
            'event'     =>  $event,
            'speaker'    => $speaker
        );
        //get the concerned talk

        $messageTalk=$tedx_manager->getTalk($args);
        if($messageTalk->getStatus()){
            $talk=$messageTalk->getContent();

            $smarty->assign('talk',$talk);
            $url=$talk->getVideoUrl();
            $ref = getYoutubeRef($url);
            $iframeVideo=createIframe($ref);
            $smarty->assign('iframeVideo', $iframeVideo);
        }//if
        else{
            $error=$messageTalk->getMessage();
        }//else
    }//if
    else{
        $error=$messageEvent->getMessage()."<br/>".$messageSpeaker->getMessage();
    }//else



    //check if the request went well
    if($messageTalk->getStatus()){
        $talk=$messageTalk->getContent();
    }//if
    else{
        $error="No video found";
    }//else
}//if
else{
   header("Location: 404.php");
}//else



$smarty->display('media_details.tpl');
include 'userbar.php';

/*------------------------------ functions ------------------------------*/
//M7lc1UVf-VE
//create a youtube embed  url from the ref
function createIframe($ref){
    //create the good video url
    $fullVideoRef="<iframe id='ytplayer' allowfullscreen='1' type='text/html' width='100%' height='390' src='http://www.youtube.com/embed/"
    .$ref."?fs=1&autoplay=1' frameborder='0'/>";
    //return the array
    return $fullVideoRef;
}

//recovers the youtube video reference from a random youtube url
function getYoutubeRef($url){
    //break it at the = sign
    $url=explode("=",$url);
    //select the last part with the ref
    $ref=$url[1];
    //break it at the & sign (to take away the &lists)
    $ref=explode("&",$ref);
    //select the first part (clean ref)
    $finalRef=$ref[0];
    //push it into the array
    return $finalRef;
}
?>
