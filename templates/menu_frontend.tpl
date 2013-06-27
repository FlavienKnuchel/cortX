
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
        <nav class="row" id="menu_desktop">
            <div class="offset2 span3">
                <a href="home.php" title="Home">
                    <img src="./img/TEDx_logo.png" alt="logo TEDxLausanne" />
                </a>
            </div>
            <ul class="span5">
                <li class="span2">
                    <a href="events.php"  title="Events" {if $activePage=='events'}id="active"{/if}>Events</a>
                </li>
                <li class="span2">
                    <a href="medias.php" title="Medias" {if $activePage=='medias'}id="active"{/if}>Videos</a>
                </li>
                <li class="span2">
                    <a href="about.php" title="About" {if $activePage=='about'}id="active"{/if}>About</a>
                </li>
               <li class="span2 essai2">
                    <a href="speakers.php" title="Speakers" {if $activePage=='speakers'}id="active"{/if}>Speakers</a>
                </li> 
                <li class="span2 essai">
                    <a href="team.php" title="Team"  {if $activePage=='team'}id="active"{/if}>Team</a>
                </li>
                <li class="span2">
                    <a href="partners.php" title="Partners" {if $activePage=='partners'}id="active"{/if}>Partners</a>
                </li> 
            </ul>
        </nav>
        
<!----menu smartphone---->
        

    <div class="row" id="menu_smartphone">
       <div class="offset2 span3">
           <div id="menu_bar">
                <a href="home.php" title="Home">
                    <img class="logo" src="./img/TEDx_logo.png" alt="logo TEDxLausanne" />
                </a>
                <a href="#" id="menu-scroll"><img src="./img/menu_smartphone.png" alt="menu"/></a>
               </div>
            <div>        
            <nav>
                <ul>
                    <li class="smartphones-links">
                        <a href="events.php" title="events">Events</a>
                    </li>
                   <li class="smartphones-links">
                       <a href="medias.php" title="medias">Videos</a>
                    </li>
                   <li class="smartphones-links">
                       <a href="about.php" title="about">About</a>
                    </li>
                   <li class="smartphones-links">
                       <a href="team.php" title="team">Team</a>
                    </li>
                    <li class="smartphones-links">
                        <a href="speakers.php" title="speakers">Speakers</a>
                    </li>
                    <li class="smartphones-links">
                        <a href="partners.php" title="partners">Partners</a>
                    </li>
               </ul>
            </nav>
        </div>
  </div>
        </div>

    {literal}<script>$("#menu-scroll").click(function (){$("nav").slideToggle("slow")});</script>{/literal}
        