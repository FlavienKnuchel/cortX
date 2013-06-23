<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->
<section class="row offset2">
    {if $loggedin}
        <article id="waiting_validation">
            <h2>Pending registrations</h2>
            {if !empty($sentReg)}
                <table>
                    <tr>
                        <th>Event</th>
                        <th>Participant's Name</th>
                    </tr>
                    {section name=sentreg loop=$sentReg max=10}
                        <tr>
                            <td>{$sentReg[sentreg][0]->getMainTopic()}</td>
                            <td>{$sentReg[sentreg][1]->getName()}</td>
                        </tr>
                    {/section}
                </table>
            {else}
                <p class="error_msg">There are no sent registrations.</p>
            {/if}
        </article>
        <article id="participant_validated">
            <h2>Accepted registrations</h2>
            {if !empty($acceptedReg)}
                <table>
                    <tr>
                        <th>Event</th>
                        <th>Participant's Name</th>
                    </tr>
                    {section name=acceptedreg loop=$acceptedReg max=10}
                        <tr>
                            <td>{$acceptedReg[acceptedreg][0]->getMainTopic()}</td>
                            <td>{$acceptedReg[acceptedreg][1]->getName()}</td>
                        </tr>
                    {/section}
                </table>
            {else}
                <p class="error_msg">There are no accepted registrations.</p>
            {/if}
        </article>
        <asside id="motivation">
            <h2>Motivation</h2>
            <p><!-- afficher la motivation du participant cliqué...--></p>
            <form method="POST" action="backend_validation_inscriptions.php">
                <input type="hidden" name="registration" value="">
                <input type="submit" name="Accept" value="Accept" alt="Accept the registration">
                <input type="submit" name="Refuse" value="Refuse" alt="Refuse the registration">
            </form>
        </asside>
    {else}
        <p class="error_msg">You can't access this content, please log in.</p>
    {/if}
</section>
