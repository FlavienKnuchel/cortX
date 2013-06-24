
    <LINK rel="stylesheet" media="all" href="css/cortx.css" />
    <LINK rel="stylesheet" media="all" href="css/userbar.css" />
    <LINK rel="stylesheet" media="all" href="css/smartphone.css" />
    
<title>CORTx</title>
        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>
    <div id="content">
        <nav class="row">
            <div class="offset2 span3" >
                <a href="home.php"title="Home">
                    <img src="./img/TEDx_logo.png" alt="logo TEDxLausanne" />
                </a>
            </div>
            <ul>
                <li class="span1">
                    <a href="events.php"  title="Events"{if $activePage=='events'}id="active"{/if}>Events</a>
                </li>
                <li class="span1">
                    <a href="medias.php" title="Medias"{if $activePage=='medias'}id="active"{/if}>Videos</a>
                </li>
                <li class="span1">
                    <a href="about.php" title="About"{if $activePage=='about'}id="active"{/if}>About</a>
                </li>
                <li class="span1">
                    <a href="team.php" title="Team"{if $activePage=='team'}id="active"{/if}>Team</a>
                </li>
                <li class="span1">
                    <a href="speakers.php" title="Speakers"{if $activePage=='speakers'}id="active"{/if}>Speakers</a>
                </li>    
            </ul>
        </nav>