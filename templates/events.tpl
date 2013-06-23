<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php/smarty: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->
<section id="event_detail" class="firstElement">
    {if isset($registrationSuccess)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <h1>Congratulations! Your registration went well!</h1>
                    <p>Got to "My registrations" in the bottom bar menu to check the status of your registration</p>
            </article>
        </section>
    {/if}
    <section>
        <div class="row">
        <section id="current_event" class="offset2 span8">
            <article class="desc_event">
                <!-- smarty variables existence test -->
                {if isset($actualEvent) and isset($actualEventLocation)}
                    {if !empty($actualEvent) and !empty($actualEventLocation)}
                        <div class="button" id="actualParticipateButton"><a title="apply for this event" href='inscription.php?eventNo={$actualEvent->getNo()}'>Participate</a></div>
                                    <h1 class="current_event_title">{$actualEvent->getMainTopic()}</h1>
                        <h2 class="date">{$actualEvent->getStartingDate()}</h2>
                                    <article class="actualEventAdress">
                                        <p>{$actualEventLocation->getAddress()}</p><p>{$actualEventLocation->getName()}</p>
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
    
            <article class="programme_event">
                <h2>Slots</h2>
                <!-- smarty variables existence test -->
                {if isset($slotsAndSpeakers)}
                    {if !empty($slotsAndSpeakers)}
                        <!-- loop through the slots array and display them-->
                        {section loop=$slotsAndSpeakers name=slot}
                           <ol class="slot_event">
                               {if !is_null($slotsAndSpeakers[slot].slot)}
                                    <li><h3>Slot {$slotsAndSpeakers[slot].slot->getNo()}</h3></li>
                                    <li>{$slotsAndSpeakers[slot].slot->getStartingTime()} - {$slotsAndSpeakers[slot].slot->getEndingTime()}</li>
                                    <li>Live presentation : </li>
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
                            </ol>
                        {/section}
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
            
            
        <section class="row end">
            <aside id="upcomingEvents" class="offset2 span4">
                <h2>Upcoming events</h2>
                <table>
                    {if isset($upcomingEvents)}
                        {if !empty($upcomingEvents)}
                            <tr class="table_title">
                                <td>Event name</td>
                                <td class="date">Date</td>
                            </tr>
                            {section loop=$upcomingEvents name=upcoming start=1}
                                    <tr class="zebra">                                    
                                            <td class="title">
                                                <a href='event_detail.php?eventNo={$upcomingEvents[upcoming]->getNo()}'> {$upcomingEvents[upcoming]->getMainTopic()}</a>
                                            </td>
                                            <td class="date">
                                                {$upcomingEvents[upcoming]->getStartingDate()}
                                            </td>
                                    </tr>
                            {/section}
                        {else}
                           <tr><td>No upcoming Events</td></tr>
                        {/if}
                    {else}
                        <tr><td class="error_msg">Error - No upcoming Event have been found</td></tr>
                    {/if}
                </table>
            </aside>
        
            <aside id="oldEvents" class="span4">
                <h2>Old events</h2>
                <table>
                    {if isset($oldEvents)}
                        {if !empty($oldEvents)}
                            <tr class="table_title">
                                <td>Event name</td>
                                <td class="date">Date</td>
                            </tr>
                            {section loop=$oldEvents name=old}
                                <tr class="zebra">
                                    <td class="title">
                                        <a href='event_detail.php?eventNo={$oldEvents[old]->getNo()}'>{$oldEvents[old]->getMainTopic()}</a>
                                    </td>
                                    <td class="date">
                                        {$oldEvents[old]->getStartingDate()}
                                    </td>
                                </tr>
                            {/section}
                        {else}
                            <tr><td>No old Events</td></tr>
                        {/if}
                    {else}
                        <tr><td class="error_msg">Error - No old Event have been found</td></tr>
                    {/if}
                </table>
            </aside>
       </section>                 
    </section>
</section>
