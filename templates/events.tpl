<!--
events.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier
php/smarty: Flavien Knuchel

Date : 14.6.2013
Description : template of the events page

-->
<section id="event_detail" class="firstElement lastElement">
    {if isset($registrationSuccess)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <h1>Congratulations! Your registration went well!</h1>
                    <p>Got to "My registrations" in the bottom bar menu to check the status of your registration</p>
            </article>
        </section>
   {/if}
    <section>
        <div class="row box">
        <section class="offset2 span8">
            <article>
                <!-- smarty variables existence test -->
                {if isset($actualEvent) and isset($actualEventLocation)}
                    {if !empty($actualEvent) and !empty($actualEventLocation)}
                <div class="row">
                    <div class="button" id="actualParticipateButton">
                        <a title="apply for this event" href='inscription.php?eventNo={$actualEvent->getNo()}'>Participate</a>
                    </div>
                    <h1 class="current_event_title">{$actualEvent->getMainTopic()}</h1>
                    <h2 class="date">{$actualEvent->getStartingDate()}</h2>
                </div>
                    <article class="actualEventAdress">
                                        <p>{$actualEventLocation->getAddress()}</p>
                                        <p>{$actualEventLocation->getName()}</p>
                                        <p>{$actualEventLocation->getCity()}, {$actualEventLocation->getCountry()}</p>
                                    </article>
                        
    
                                    <p id="event_description">{$actualEvent->getDescription()}</p>
                    {else}
                        <!--  error message ifno event is scheduled -->
                        <p>No event scheduled</p>
                    {/if}
                {else}
                    <!-- error message if no variable set -->
                    <p>Error - Event couldn't be found</p>
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
            
        <section class="row">
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
