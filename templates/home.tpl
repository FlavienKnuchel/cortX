<!--
home.tpl

Author : Christophe Rast
Date : 14.6.2013

Description : Basic structure of the homepage
-->
<section id="nextevent" class="row firstElement">
    <aside class="offset2 span3">
        <img src="http://www.tedxlausanne.org/wp-content/uploads/2012/10/Homepage_TEDxLausanne2.jpg"/>
    </aside>
    <article class="span5">
        {if isset($upcomingEvents)}
            <h1>{$upcomingEvents[0]->getMainTopic()}</h1>
            <p class="subtitle">{$upcomingEvents[0]->getStartingDate()}</p>
            <p>{$upcomingEvents[0]->getDescription()}</p>
            <div class="button">
                <a href="events.php" title="Get more infos and register to this event!">More Infos !</a>
            </div>
        {else}
            <p class="error_msg">There are no upcoming events at the moment, sorry!</p>
        {/if}
    </article>

</section>

<section id="videos" class="row">
    <aside class="offset2 span2" id="video_home_header">
        <h1>Videos</h1>
        <h2>from previews events</h2>
    </aside>
    <ul>
        {section  loop=$talksArray name=talk max=3}

            <li class="span2">
                <a class="youtube" href="{$talksArray[talk].video}">
                    <img src="{$talksArray[talk].img}" alt="{$talksArray[talk].title}"/>
                </a>
            </li>
        {/section}
    </ul>
</section>

<article id="socialnet" class="row">
    <ul>
        <li class="offset4 span1"><a href="http://www.facebook.com/TEDxLausanne" title="Facebook"><img src="img/sociaux/logo_facebook.png"/></a></li>
        <li class="span1"><a href="http://twitter.com/TEDxLausanne" title="Twitter"><img src="img/sociaux/logo_twitter.png"/></a></li>
        <li class="span1"><a href="http://www.youtube.com/results?search_query=TEDxLausanne&oq=tedx&gs_l=youtube.1.0.35i39j0l9.11208.12163.0.13877.4.4.0.0.0.0.128.476.0j4.4.0...0.0...1ac.1.2Ndlgvm2YT4" title="Youtube"><img src="img/sociaux/logo_youtube.png"/></a></li>
        <li class="span1"><a href="http://www.linkedin.com/groups/TEDxLausanne-3521864" title="Linked"><img src="img/sociaux/logo_linkedin.png"/></a></li>
    </ul>
</article>

<article id="tedxDisclaimer" class="row lastElement">
    <p>This independent TEDx event is operated under license from TED.</p>
</article>