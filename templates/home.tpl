<!--
home.tpl

Author : Christophe Rast
Date : 14.6.2013

Description : Basic structure of the homepage
-->
<section id="nextevent" class="row firstElement">    
    <article class="offset2 span6">
        {if isset($upcomingEvents)}
            <h2>{$upcomingEvents[0]->getMainTopic()}</h2>
            <p class="subtitle">{$upcomingEvents[0]->getStartingDate()}</p>
            <p>{$upcomingEvents[0]->getDescription()}</p>
            <div class="button">
                <a href="events.php" title="Get more infos and register to this event!">More Infos !</a>
            </div>
        {else}
            <p class="error_msg">There are no upcoming events at the moment, sorry!</p>
        {/if}
    </article>
    <aside class="span2">
        <img src="img/event_now.png"/>        
    </aside>       
</section>

<section id="videos" class="row">
    <aside class="offset2 span2" id="video_home_header">
        <h1>Videos</h1>
        <h2>from previews events</h2>
    </aside>
    <ul>
        <li class="span1">
            <a class="youtube" href="http://www.youtube.com/embed/lCRp9PussNU?autoplay=1&fs=1&rel=0&enablejsapi=1&playerapiid=ytplayer">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span1">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span1">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span1">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span1">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
    </ul>
</section>

<article id="socialnet" class="row">
    <ul>
        <li class="offset4 span1"><a href="#" title="Facebook"><img src="img/sociaux/logo_facebook.png"/></a></li>
        <li class="span1"><a href="#" title="Twitter"><img src="img/sociaux/logo_twitter.png"/></a></li>
        <li class="span1"><a href="#" title="Youtube"><img src="img/sociaux/logo_youtube.png"/></a></li>
        <li class="span1"><a href="#" title="Linked"><img src="img/sociaux/logo_linkedin.png"/></a></li>
    </ul>
</article>

<article id="tedxDisclaimer" class="row">
    <p>This independent TEDx event is operated under license from TED.</p>
</article>