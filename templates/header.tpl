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
    <LINK rel="stylesheet" media="all" href="css/normalize.css" />
    <LINK rel="stylesheet" media="all" href="css/grid.css" />
    <LINK rel="stylesheet" media="all" href="css/menu.css" />
    <LINK rel="stylesheet" media="all" href="css/cortx.css" />
    <LINK rel="stylesheet" media="all" href="css/colorbox.css" />
        <!-- colorbox javascript-->
            <script src="jquery/jquery-1.10.1.min.js"></script>
            <script src="jquery/jquery.colorbox-min.js"></script>
        {literal} <!-- Avoiding smarty to crash on the javascript code -->
            <script type="text/javascript">
                $(document).ready(function(){ $(".youtube").colorbox({iframe:true, innerWidth:640, innerHeight:390})});
            </script>
        {/literal}
        <!-- enf of colorbox javascript-->
    <title>CORTx</title>
        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div id="content">
        <nav class="row">
            <ul>
                <li id="header_tedx_logo" class="offset2 span3">
                	<a href="home.php"><img src="./img/TEDx_logo.png" alt="logo TEDxLausanne" /></a>
                </li>
                <li class="span1">
                	<a href="events.php" title="Events">Events</a>
                </li>
                <li class="span1">
               		<a href="medias.php" title="Medias">Medias</a>
                </li>
                <li class="span1">
                	<a href="about.php" title="About">About</a>
                </li>
                <li class="span1">
                	<a href="team.php" title="Team">Team</a>
                </li>
                <li class="span1">
                	<a href="speakers.php" title="Speakers">Speakers</a>
                </li>
                

            </ul>
        </nav>