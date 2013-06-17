<!--
events.tpl

Author : Noémie Sandoz and Andréane Mercier

Date : 17.6.2013
Description : template of the old events page

-->

<section id="old_event">
    <section id="one_of_old_event">
        <a href="events.php">retour</a>
        <article class="desc_event">
            <h2>{$event_name}</h2>
            <p class="date">{$startingDateEvent}</p>
            <p>{$descriptionEvent}</p>
        </article>
        
        <article class="programme_event">
            <!-- loop on ol if their is more then one slot-->
           <ol class="slot_event">
                <li>Slot {$no_slot}</li>
                <li>{$startingTime_slot} - {$endingTime_slot}</li>
                <li>Live presentation : </li>
                <!-- loop on the li below for teh differents speakers during the slot-->
                <li>{$position_speaker} {$speaker_name}</li>   
            </ol>
        </article>
    </section>      
        
      <section id="videos">
            <h2>Videos of this event</h2>
            <ul>
                <li class="video_old_event">
                    <a href="#"><img src="img/videos/video1.jpg" alt="Miniature video"/></a>
                </li>
            </ul>
            
        </section>
</section>
