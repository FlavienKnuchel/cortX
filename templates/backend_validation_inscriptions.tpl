<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->
<section class="firstElement">
    {if isset($success_acceptation)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$success_acceptation}</p>
            </article>
        </section>
    {/if}
    {if isset($error_acceptation)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$error_acceptation}</p>
            </article>
        </section>
    {/if}
    {if isset($success_reject)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$success_reject}</p>
            </article>
        </section>
    {/if}
    {if isset($error_reject)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$error_reject}</p>
            </article>
        </section>
    {/if}
    <section class="row">
        <article class="offset2 span5 lastElement">
            {if $loggedin}
                <h1>Sent registrations</h1>
                {if isset($upcomingEvents)}
                    <div>
                        <form method="POST" action="backend_validation_inscriptions.php">
                            <label for="event">Filter by Event</label>
                            <select id"select" name="noEvent" >
                                {foreach $upcomingEvents as $event}
                                    <option value="{$event->getNo()}" {if isset($anEvent)}{if $anEvent->getNo() == $event->getNo()}selected{/if}{/if}>{$event->getMainTopic()}</option>
                                {/foreach}
                            </select>
                            <input type="submit" name="filter" value="Filter">
                        </form>
                    </div>
                    {if !empty($sentReg)}
                        <table>
                            <tr>
                                <th class="span3">Event</th>
                                <th class="span2">Participant's Name</th>
                            </tr>
                            {section name=sentreg loop=$sentReg}
                                <tr>
                                    <td class="span3">
                                        <a href="?id={$smarty.section.sentreg.index}{if isset($anEvent)}&no={$anEvent->getNo()}&pno={$sentReg[sentreg][0]->getNo()}{/if}">
                                            {$sentReg[sentreg][0]->getMainTopic()}
                                        </a>
                                    </td>
                                    <td class="span2">
                                        <a href="?id={$smarty.section.sentreg.index}{if isset($anEvent)}&no={$anEvent->getNo()}&pno={$sentReg[sentreg][0]->getNo()}{/if}">
                                            {$sentReg[sentreg][1]->getName()}
                                        </a>
                                    </td>
                                </tr>
                            {/section}
                        </table>
                    {else}
                        <p class="error_msg">There is no registration to display.</p>
                    {/if}
                {else}
                    <p class="error_msg">There is no future events, no registration to display.</p>
                {/if}
                <h1>Previous registrations</h1>
                {if !empty($acceptedReg)}
                    <table>
                        <tr>
                            <th>Event</th>
                            <th>State</th>
                            <th>Participant's Name</th>
                        </tr>
                        {section name=acceptedreg loop=$acceptedReg max=10}
                            {if $acceptedReg[acceptedreg]['status'] == 'Accepted' || $acceptedReg[acceptedreg]['status'] == 'Rejected'}
                                <tr>
                                    <td>
                                        {$acceptedReg[acceptedreg]['event']->getMainTopic()}
                                    </td>
                                    <td>
                                        {$acceptedReg[acceptedreg]['status']}
                                    </td>
                                    <td>
                                        {$acceptedReg[acceptedreg]['person']->getName()}
                                    </td>
                                </tr>
                            {/if}
                        {/section}
                    </table>
                {else}
                    <p class="error_msg">There is no previous registration.</p>
                {/if}
            </article>
            <article class="span3">
                <h2>Motivation</h2>
                {if isset($row)}
                    {if $msgMotivation->getStatus()}
                        <p>{$motivation->getText()}</p>
                    {else}
                        <p class="error_msg">There is no motivation for this registration.</p>
                    {/if}
                    <form method="POST" action="">
                        <input type="hidden" name="registration" value="{$row}">
                        <input type="submit" name="Accept" value="Accept" alt="Accept the registration">                    
                        <input type="submit" name="Refuse" value="Refuse" alt="Refuse the registration">
                    </form>
                {else}
                    <p class="error_msg">No registrations selected.</p>
                {/if}
            </article>
        {else}
            <p>You can't access this content, please log in.</p>
        {/if}
    </section>
</section>