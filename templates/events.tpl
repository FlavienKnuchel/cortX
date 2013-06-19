<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php/smarty: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->

<section id="event_detail">
    <section id="current_event">
        <a href="inscription.php">Participate</a>
        <article class="desc_event">
            <!-- smarty variables existence test -->
            {if isset($eventsObjects) and isset($firstEventLocation) and !empty($eventsObjects) and !empty($firstEventLocation)}
                <!-- loop through the events array -->
                {section loop=$eventsObjects name=actualEvent}
                    <!-- test to display the first event (last of the array) -->
                    {if $smarty.section.actualEvent.last}
                            <h1>TEDxLausanne No{$eventsObjects[actualEvent]->getNo()}</h1>
                            <h2>{$eventsObjects[actualEvent]->getMainTopic()}</h2>
                            <article class="EventAdress">
                                <h3>{$firstEventLocation->getAddress()}</h3>
                                <h3>{$firstEventLocation->getName()}</h3>
                                <h3>{$firstEventLocation->getCity()}</h3>
                                <h3>{$firstEventLocation->getCountry()}</h3>
                            </article>
                            <p class="date">{$eventsObjects[actualEvent]->getStartingDate()}</p>
                            <p>{$eventsObjects[actualEvent]->getDescription()}</p>
                        {/if}
                {/section}
            {else}
                <!-- display of an error message if the variables aren't set -->
                <h1>Erreur: No event found</h1>
            {/if}
        </article>

        <article class="programme_event">
            <!-- smarty variables existence test -->
            {if  isset($startingTime) and isset($slots)}
                {if !empty($startingTime) and !empty($slots)}
                    <!-- loop through the slots array and display them-->
                    {section loop=$slots name=eventSlots}
                       <ol class="slot_event">
                            <li>Slot {$slots[eventSlots]->getNo()}</li>
                            <li>{$slots[eventSlots]->getStartingTime()} - {$slots[eventSlots]->getEndingTime()}</li>
                            <li>Live presentation : </li>
                            <!-- loop on the speakers array of the event-->

                            <li>{literal}{$positionSpeaker} {$speakerName}{/literal}</li>
                        </ol>
                    {/section}
                {else}
                    <!-- displayed when there is no slot -->
                    <p>No slot scheduled</p>
                {/if}
            {else}
                <!-- display of an error message if the variables aren't set -->
                <h1>Erreur: No slot found</h1>
            {/if}
        </article>
        
        <article class="speakers_photo">
            <ul>
                <!-- do a loop on <li> -->
                <li>
                    <a href="speaker_profil.php">
                        <p>{$speakerName}</p>
                    </a>
                </li>
            </ul>
         </article>
    </section>
                    
    <aside id="oldevents">
        <h2>Previous events</h2>
        <table>
            {section loop=$eventsObjects name=oldEvents step=-1}
                {if $smarty.section.oldEvents.first} {else}
                    <tr>
                        <td>{$eventsObjects[oldEvents]->getNo()}</td>
                        <td>{$eventsObjects[oldEvents]->getMainTopic()}</td>
                        <td>{$eventsObjects[oldEvents]->getStartingDate()}</td>
                    </tr>
                {/if}


            {/section}
        </table>
    </aside>
</section>
