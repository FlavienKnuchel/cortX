<!--
home.tpl

Author : Christophe Rast
Date : 14.6.2013

Description : Basic structure of the homepage
-->
<section id="nextevent">
    <article class="row">
        <div class="offset2 span6">
            <h2>{$NextEventName}</h2>
            <p class="subtitle">getEventStartingDate()</p>
            <p>{$NextEventDesc}</p>
            <a href="events.php" class="button" title="Get more infos and register to this event!">More Infos !</a>
        </div>
        <article class="span2">
           <img src="img/event_now.png"/>
        
        </article>
    </article>    
</section>

<section>
    <div class="row">
    <h2 id="videos_title" class="offset2 span3">Videos from previews events</h2>
    </div>
    <ul id="videos" class="row">
        <li class="offset2 span2">
            <a class="youtube" href="http://www.youtube.com/embed/lCRp9PussNU?autoplay=1&fs=1&rel=0&enablejsapi=1&playerapiid=ytplayer">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span2">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span2">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
        <li class="span2">
            <a class="youtube" href="http://www.youtube.com/v/VOJyrQa_WR4?rel=0&amp;wmode=transparent">
                <img src="img/videos/video1.jpg" alt="Miniature video"/>
            </a>
        </li>
    </ul>
</section>

<article id="socialnet" class="row">
    <ul>
        <li class="offset4 span1"><a href="#" title="Facebook"><img src="img/sociaux/facebook_50px.png"/></a></li>
        <li class="span1"><a href="#" title="Twitter"><img src="img/sociaux/twitter_50px.png"/></a></li>
        <li class="span1"><a href="#" title="Youtube"><img src="img/sociaux/youtube_50px.png"/></a></li>
        <li class="span1"><a href="#" title="Youtube"><img src="img/sociaux/linkedin_50px.png"/></a></li>
    </ul>
</article>