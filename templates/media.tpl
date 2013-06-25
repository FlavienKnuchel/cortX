<!--/*
 * media.php
 *
 * Author : Christophe Rast
 * Date : 14.06.2013
 *
 * Description : structure of the video wall
 */  -->

<section class="row">
    <div class="offset2 span8">
    {section  loop=$talksArray name=talk}
       {if $smarty.section.talk.first}
           <h1>Videos from TEDxLausanne</h1>
       {/if}
        <p>
            <h3>{$talksArray[talk].title}</h3>
            <a class="youtube" href="{$talksArray[talk].video}">
                <img src="{$talksArray[talk].img}" alt="{$talksArray[talk].title}"/>
            </a>
            <p></p><a href="video.php?eventNo={$talksArray[talk].eventNo}&speakerNo={$talksArray[talk].speakerNo}">more...</a></
        </p>
        {/section}
    </div>
</section>