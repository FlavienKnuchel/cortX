<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">
            {if $loggedin}
                <article id="waiting_validation">
                    <h1>Pending registrations</h1>
                    {if !empty($sentReg)}
                    <table>
                        <tr>
                            <th>Event</th>
                            <th>Participant's Name</th>
                        </tr>
                            {section name=sentreg loop=$sentReg max=10}
                        <tr>
                            <td>
                                <a href="?id={$smarty.section.sentregdreg.index}">
                                    {$sentReg[sentreg][0]->getMainTopic()}
                                </a>
                            </td>
                            <td>
                                <a href="?id={$smarty.section.sentregdreg.index}">
                                    {$sentReg[sentreg][1]->getName()}
                                </a>
                            </td>
                        </tr>
                    {/section}
                    </table>
                {else}
                    <p class="error_msg">There is no request for a registration.</p>
                </article>
                {/if}
                <article id="participant_validated">
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
            </article>
        </article>
        <article class="span3">
            <h2>Motivation</h2>
            {if isset($motivation)}   
            <p>{$motivation->getText()}</p>
            <form method="POST" action="backend_validation_inscriptions.php">
                <input type="hidden" name="registration" value="{$row}">
                <input type="submit" name="Accept" value="Accept" alt="Accept the registration">                    
                <input type="submit" name="Refuse" value="Refuse" alt="Refuse the registration">
            </form>
            {else}
            <p class="error_msg">No registration selected.</p>
            {/if}
        </article>
    {else}
        <p>You can't access this content, please log in.</p>
    {/if}
    </section>
</section>