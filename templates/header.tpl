<!--
header.tpl
Author : Flavien Knuchel
Date : 14.06.2013
Description : general navigation and
-->

<!Doctype html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
    <LINK rel="icon" type="image/png" href="img/favicon.ico" />

    <LINK rel="stylesheet" media="all" href="css/normalize.css" />
    <LINK rel="stylesheet" media="all" href="css/grid.css" />
    <LINK rel="stylesheet" media="all" href="css/menu.css" />
        <LINK rel="stylesheet" media="all" href="css/colorbox.css" />

        <!-- colorbox javascript-->
            <script src="jquery/jquery-1.10.1.min.js"></script>
            <script src="jquery/jquery.colorbox-min.js"></script>
        {literal} <!-- Avoiding smarty to crash on the javascript code -->
            <script type="text/javascript">
                $(document).ready(function(){
                    $(".youtube").colorbox({iframe:true, innerWidth:640, innerHeight:390})
                    $(".youtube").colorbox({iframe:true, innerWidth:640, innerHeight:390});
                    $(".vimeo").colorbox({iframe:true, innerWidth:500, innerHeight:409});
                    $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
                    $(".inline").colorbox({inline:true, width:"50%"});
                    $('.html').colorbox({ iframe:true, width:"60%", height:600});
                });

            </script>
        {/literal}
        <!-- enf of colorbox javascript-->
