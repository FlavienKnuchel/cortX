<!--
speaker_profil.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 17.6.2013
Description : template of the speaker profil

-->
<div class="row">
        {if isset($userCameFrom)}
            <div class="button_back offset2"><a title="go back to lats page" href='{$userCameFrom}'>Back</a></div>
        {/if}
        {if isset($userCameFromInsc)&&$userCameFromInsc}
            <div class="button_back offset2"><a title="go back to speakers page" href='speakers.php'>Back</a></div>
        {/if}
</div>

<section id="speaker_year" class="row firstElement end">
    <article class="offset2 span8">
        <div class="speaker_photo">
            <img src="img/speakers/big/speaker.jpg"/>
        </div>
        <article class="speaker_nameANDdescription">
            {if isset($speaker)}
                <h2>{$speaker->getName()} {$speaker->getFirstName()}</h2>
                <h3>Description: </h3>
                <p>{$speaker->getDescription()}</p>
                <h3>Country: </h3>
                <p>{$speaker->getCountry()}</p>
    
                {if isset($eventsOfSpeaker)}
                    <h3>He made a Talk in these events:</h3>
                    <ul>
                    {section loop=$eventsOfSpeaker name=event}
                        <li>{$eventsOfSpeaker[event]->getStartingDate()} {$eventsOfSpeaker[event]->getName()}</li>
                    {/section}
                    </ul>
                {/if}
    
                {else}
                <h2>This speaker Number hasn't been found</h2>
            {/if}
        </article>
    </article>
</section>
