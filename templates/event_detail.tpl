<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php/smarty: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->
<div class="row">
        {if isset($userCameFrom)}
            <div class="button_back offset2"><a title="go back to lats page" href='{$userCameFrom}'>Back</a></div>
        {/if}
        {if isset($userCameFromInsc)&&$userCameFromInsc}
            <div class="button_back offset2"><a title="go back to event page" href='events.php'>Back</a></div>
        {/if}
</div>
<section id="event_detail" class="lastElement">
    
    <div class="row box">
        <section id="current_event" class="offset2 span8">
            <article class="desc_event">
                <!-- smarty variables existence test -->
                {if isset($actualEvent) and isset($actualEventLocation)}
                    {if !empty($actualEvent) and !empty($actualEventLocation)}
                        <!-- test if we can register to this event -->
                <div class="row">
                        {if isset($inscriptionStatus) && $inscriptionStatus}
                            <div class="button" id="actualParticipateButton">
                                <a title="apply for this event" href='inscription.php?eventNo={$actualEvent->getNo()}'>Participate</a>
                            </div>
                            <h1 class="current_event_title">{$actualEvent->getMainTopic()}</h1>
                            <h2 class="date">{$actualEvent->getStartingDate()}</h2>
                        {/if}
                </div>
                
                            <!-- test to display the first event (last of the array) -->
                                    
                                    <article class="actualEventAdress box">
                                        
                                        <p>{$actualEventLocation->getAddress()}</p>
                                        <p>{$actualEventLocation->getName()}</p>
                                        <p>{$actualEventLocation->getCity()}, {$actualEventLocation->getCountry()}</p>
                                    </article>
                                    
                                    <p>{$actualEvent->getDescription()}</p>
                    {else}
                        <!--  error message ifno event is scheduled -->
                        <p>No event scheduled</p>
                    {/if}
                {else}
                    <!-- error message if no variable set -->
                    <p class="error_msg">Error - Event couldn't be found</p>
                {/if}
    
            </article>
    
            <article>
                <h2>Slots</h2>
                <!-- smarty variables existence test -->
                <ul>
                {if isset($slotsAndSpeakers)}
                    {if !empty($slotsAndSpeakers)}
                        <!-- loop through the slots array and display them-->
                        {section loop=$slotsAndSpeakers name=slot}
                {if !is_null($slotsAndSpeakers[slot].slot)}
                
                
                           <li class="slot_event">
                               <h3>Slot {$slotsAndSpeakers[slot].slot->getNo()}</h3>
                                    <p>{$slotsAndSpeakers[slot].slot->getStartingTime()} - {$slotsAndSpeakers[slot].slot->getEndingTime()}</p>
                                    <p>Live presentation : </p>
                                   <ol>
                                            {if !empty($slotsAndSpeakers[slot].speakers)}
                                                {section name=speaker loop=$slotsAndSpeakers[slot].speakers}
                                                <li><a href='speaker_profil.php?No={$slotsAndSpeakers[slot].speakers[speaker]->getNo()}'>
                                                    {$slotsAndSpeakers[slot].speakers[speaker]->getFirstName()} {$slotsAndSpeakers[slot].speakers[speaker]->getName()}
                                                    </a></li>
                                                {/section}
                                            {/if}
    
                                   </ol>
                                {/if}
                            </li>
                        {/section}
                    </ul>
                    {else}
                        <!-- displayed when there is no slot -->
                        <p>No slot scheduled</p>
                    {/if}
                {else}
                    <!-- display of an error message if the variables aren't set -->
                    <p class="error_msg">Error - No slots have been found</p>
                {/if}
            </article>
        </section>
    </div>
    <div class="button" id="actualParticipateButton_smartphone">
        <a title="apply for this event" href='inscription.php?eventNo={$actualEvent->getNo()}'>Participate</a>
    </div>

                    

</section>
