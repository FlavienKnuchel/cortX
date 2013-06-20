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
            {if isset($actualEvent) and isset($actualEventLocation)}
                {if !empty($actualEvent) and !empty($actualEventLocation)}
                    <!-- loop through the events array -->
                        <!-- test to display the first event (last of the array) -->
                                <h1>TEDxLausanne No{$actualEvent->getNo()}</h1>
                                <h2>{$actualEvent->getMainTopic()}</h2>
                                <article class="EventAdress">
                                    <h3>{$actualEventLocation->getAddress()}</h3>
                                    <h3>{$actualEventLocation->getName()}</h3>
                                    <h3>{$actualEventLocation->getCity()}</h3>
                                    <h3>{$actualEventLocation->getCountry()}</h3>
                                </article>
                                <p class="date">{$actualEvent->getStartingDate()}</p>
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
            <!-- smarty variables existence test -->
            {if isset($slots)}
                {if !empty($slots)}
                    <!-- loop through the slots array and display them-->
                    {section loop=$slots name=eventSlots}
                       <ol class="slot_event">
                            <li>Slot {$slots[eventSlots]->getNo()}</li>
                            <li>{$slots[eventSlots]->getStartingTime()} - {$slots[eventSlots]->getEndingTime()}</li>
                            <li>Live presentation : </li>
                            <!-- loop on the speakers array of the event-->

                            <li>{literal}<a href="speaker_profil.php">{$positionSpeaker} {$speakerName}</a>{/literal}</li>
                        </ol>
                    {/section}
                {else}
                    <!-- displayed when there is no slot -->
                    <p>No slot scheduled</p>
                {/if}
            {else}
                <!-- display of an error message if the variables aren't set -->
                <p class="error_msg">{$errorSlot}</p>
            {/if}
        </article>
    </section>

    <aside id="upcomingEvents">
        <h2>Upcoming events</h2>
        <table>
            {if isset($upcomingEvents)}
                {if !empty($upcomingEvents)}
                    {section loop=$upcomingEvents name=upcoming}
                            <tr>
                                <a href="events.php">
                                    <td>{$upcomingEvents[upcoming]->getNo()}</td>
                                    <td>{$upcomingEvents[upcoming]->getMainTopic()}</td>
                                    <td>{$upcomingEvents[upcoming]->getStartingDate()}</td>
                                </a>
                            </tr>
                    {/section}
                {else}
                   <tr><td>No upcoming Events</td></tr>
                {/if}
            {else}
                <tr><td class="error_msg">{$errorUpcomingEvents}</td></tr>
            {/if}
        </table>
    </aside>

    <aside id="oldEvents">
        <h2>Old events</h2>
        <table>
            {if isset($oldEvents)}
                {if !empty($oldEvents)}
                    {section loop=$oldEvents name=old}
                        <tr>
                            <a href="events.php">
                                <td>{$oldEvents[old]->getNo()}</td>
                                <td>{$oldEvents[old]->getMainTopic()}</td>
                                <td>{$oldEvents[old]->getStartingDate()}</td>
                            </a>
                        </tr>
                    {/section}
                {else}
                    <tr><td>No old Events</td></tr>
                {/if}
            {else}
                <tr><td class="error_msg">{$errorOldEvents}</td></tr>
            {/if}
        </table>
    </aside>
                    

</section>
