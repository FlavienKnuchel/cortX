<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->

<section id="event_detail">
    <section id="current_event">
        <article class="desc_event">
            <h2>{$mainTopicEvent}</h2>
            <p class="date">{$startingDateEvent}</p>
            <p>{$descriptionEvent}</p>
        </article>
        <a href="events.php">Participate</a>
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
                <!-- section loop on tr -->
                <tr>
                    <td>{$eventName}</td>
                    <td>{$startingDateEvent}</td>
                    <td>{$locationNameEvent}</td>
                    <td>{$mainTopicEvent}</td>
                </tr>
        </table>
    </aside>
</section>
