<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5 lastElement">
            {if $loggedin}
                <div>
                    <h1>Pending registrations</h1>
                    {if !empty($sentReg)}
                        <table>
                            <tr>
                                <th class="span3">Event</th>
                                <th class="span2">Participant's Name</th>
                            </tr>
                            {section name=sentreg loop=$sentReg max=10}
                                <tr>
                                    <td class="span3">
                                        <a href="?id={$smarty.section.sentreg.index}">
                                            {$sentReg[sentreg][0]->getMainTopic()}
                                        </a>
                                    </td>
                                    <td class="span2">
                                        <a href="?id={$smarty.section.sentreg.index}">
                                            {$sentReg[sentreg][1]->getName()}
                                        </a>
                                    </td>
                                </tr>
                            {/section}
                        </table>
                    {else}
                        <p class="error_msg">There is no request for a registration.</p>
                    </div>
                {/if}
                    <div>
                    <h1>Accepted registrations</h1>
                    {if !empty($acceptedReg)}
                        <table>
                            <tr>
                                <th>Event</th>
                                <th>Participant's Name</th>
                            </tr>
                            {section name=acceptedreg loop=$acceptedReg max=10}
                                <tr>
                                    <td>
                                        {$acceptedReg[acceptedreg][0]->getMainTopic()}
                                    </td>
                                    <td>
                                        {$acceptedReg[acceptedreg][1]->getName()}
                                    </td>
                                </tr>
                            {/section}
                        </table>
                    {else}
                        <p class="error_msg">There are no accepted registrations.</p>
                    {/if}
                </div>
            </article>
            <article class="span3">
                <h2>Motivation</h2>
                {if isset($msgMotivation)}
                    {if $msgMotivation->getStatus()}
                        <p>{$motivation->getText()}</p>
                        <form method="POST" action="backend_validation_inscriptions.php">
                            <input type="hidden" name="registration" value="{$row}">
                            <input type="submit" name="Accept" value="Accept" alt="Accept the registration">                    
                            <input type="submit" name="Refuse" value="Refuse" alt="Refuse the registration">
                        </form>
                    {else}
                        <p class="error_msg">There is no motivation for this registration.</p>
                    {/if}
                {else}
                    <p class="error_msg">No registrations selected.</p>
                {/if}
            </article>
        {else}
            <p>You can't access this content, please log in.</p>
        {/if}
    </section>
</section>