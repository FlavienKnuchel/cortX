<!--/*
 * media.php
 *
 * Author : Knuchel Flavien Noemie Sandoz
 * Date : 25.06.2013
 *
 * Description : video wall
 */  -->
<div class="firstElement">
{if !empty($error)}
    <section id="row">
        <article class="offset2 span8 badMessage">
            <p>{$error}</p>
        </article>
    </section>
{/if}
<section class="row">
    <div class="offset2 span8">
        <h1>Videos from TEDxLausanne</h1>
        {section  loop=$talksArray name=talk}
             <div class="span4 mediaWall">
                 <div><h2>{$talksArray[talk].title}</h2>
                 <a href="media_details.php?eventNo={$talksArray[talk].eventNo}&speakerNo={$talksArray[talk].speakerNo}">more infos...</a></div>
                 <a class="youtube" href="{$talksArray[talk].video}">
                     <img src="{$talksArray[talk].img}" alt="{$talksArray[talk].title}"/>
                 </a>
             </div>
    {/section}
    </div>
</section>
</div>