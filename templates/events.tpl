<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->

<section id="event_detail">
    <section id="current_event">
        <a href="events.php">Participate</a>
        <article class="desc_event">
            <h1>TEDxLausanne No{$eventsObjects[0]->getNo()}</h1>
            <h2>{$eventsObjects[0]->getMainTopic()}</h2>
            <h3>{$firstEventLocation}</h3>
            <p class="date">{$eventsObjects[0]->getStartingDate()}</p>
            <p>{$eventsObjects[0]->getDescription()}</p>

        </article>

        <article class="programme_event">
            <!-- loop on ol if their is more then one slot-->
           <ol class="slot_event">
                <li>Slot {$no_slot}</li>
                <li>{$startingTime_slot} - {$endingTime_slot}</li>
                <li>Live presentation : </li>
                <!-- loop on the li below for teh differents speakers during the slot-->
                <li>{$positionSpeaker} {$speakerName}</li>
            </ol>
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
