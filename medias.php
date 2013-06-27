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

//get all the talks
$messageTalks=$tedx_manager->getTalks();
//check if the request went well
if($messageTalks->getStatus()){
    //get the content of the message
   $talks=$messageTalks->getContent();
    //create the videos reference array to fill
    $videosRef=array();
    //create the title array to fill
    $talkTitles=array();
    //create the descriptions array to fill
    $talkDescription=array();
    $talksArray=array();
    //for each talk
    foreach($talks as $talk){
        //get the url
        $url=$talk->getVideoUrl();
        //get the reference
        $talkRef=getYoutubeRef($url);

        if($talkRef){
            //create an array with all the infos of the talk
            $combination=array(
                'video'=>createVideoUrl($talkRef),
                'img'=>createImgUrl($talkRef),
                'title'=>shortenVideoTitle($talk->getVideoTitle()),
                'eventNo'=>$talk->getEventNo(),
                'speakerNo'=>$talk->getSpeakerPersonNo()
            );
            //put it in the
            array_push($talksArray,$combination);
        }

    }//foreach

    //assign the new combined array to smarty
    $smarty->assign('talksArray',$talksArray);
}//if
else{
    $error="No video found";
}//else

$smarty->display('media.tpl');
include 'userbar.php';

/*------------------------------ functions ------------------------------*/
//used to create the youtube image thumbnail url from refs
function createImgUrl($ref){
    //create the good image url
    $fullImgRef="http://img.youtube.com/vi/".$ref."/0.jpg";
    //return the image url
    return $fullImgRef;
}//function

//create a youtube embed  url from the ref
function createVideoUrl($ref){
    //create the good video url
    $fullVideoRef="http://www.youtube.com/embed/".$ref."?autoplay=1&fs=1&rel=0&enablejsapi=1&playerapiid=ytplayer";
    //return the array
    return $fullVideoRef;
}//function

//recovers the youtube video reference from a random yoyutube url
function getYoutubeRef($url){
    //break it at the = sign
    $url=explode("=",$url);
    //select the last part with the ref
    if(sizeof($url)>=2){
    $ref=$url[1];
    //break it at the & sign (to take away the &lists)
    $ref=explode("&",$ref);
    //select the first part (clean ref)
    $finalRef=$ref[0];
    //push it into the array
    return $finalRef;
    }
    else{
        return false;
    }
}//function


function shortenVideoTitle($title){
    if(strlen($title)>20){
    $short=substr($title,0,20);
    $short=$short."...";
    return $short;
    }
    else{
        return $title;
    }
}//function
?>
