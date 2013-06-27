
<LINK rel="stylesheet" media="all" href="css/userbar.css" />
<LINK rel="stylesheet" media="all" href="./css/cortx_backend.css" />

<title>CORTx</title>
        <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

   
    </head>
    <body>
    <div id="content">
        <nav class="row menu_backend">
            <div class="offset2 span3">
                <a href="home.php" title="Home">
                    <img src="./img/TEDx_logo.png" alt="logo TEDxLausanne" />
                </a>
            </div>
            <ul class="span5">
                {section loop=$menu name=ariane}
                    {if $smarty.section.ariane.last}
                        <li class="span2 active_backend"><a href="{$menu[ariane].url}">{$menu[ariane].name}</a></li>
                    {else}
                    {if $smarty.section.ariane.first}
                        <li class="span3 ariane"><a href="{$menu[ariane].url}">{$menu[ariane].name}</a></li>
                    {else}
                        <li class="span2 ariane"><a href="{$menu[ariane].url}">{$menu[ariane].name}</a></li>
                    {/if}
                    {/if}

                {/section}

            </ul>
        </nav>
            
      