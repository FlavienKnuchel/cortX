<!--
speakers.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 17.6.2013
Description : template of the speaker section

-->
<!-- do a loop on section-->

<section id="speaker_year">
    <article class="title_year row">
        <h1 class="offset2 span8">Speakers</h1>
    </article>       
    <article class="speakers_photo row">
        {if isset($speakers)}
            <ul class="offset2 span8">
                <!-- do a loop on <li> -->
                {section name=listspeakers loop=$speakers step=-1}
                    <li>
                        <a href="speaker_profil.php?id={$speakers[listspeakers]->getNo()}">
                            <p>{$speakers[listspeakers]->getName()}</p>
                            <p>{$speakers[listspeakers]->getFirstName()}</p>
                        </a>
                    </li>
                {/section}
            </ul>
        {else}
            <p class="error_msg">There are currently no speakers to be displayed, sorry.</p>
        {/if}
    </article>
</section>