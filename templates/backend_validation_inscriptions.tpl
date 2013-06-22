<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->
<section class="row offset2">
    <article id="waiting_validation">
        <h2>Pending registrations</h2>
        {if !empty($sentReg)}
            <table>
                {section name=sentreg loop=$sentReg max=10}
                    <!-- do a loop on li-->
                    <tr>
                    <a href="backend_validation_inscriptions.php?id={$sentRegSerialized[sentreg]}">
                        <td>{$sentReg[sentreg]->getEventNo()}</td>
                        <td>{$sentReg[sentreg]->getParticipantPersonNo()}</td>
                    </a>
                    </tr>
                {/section}
            </table>{else}
            <p class="error_msg">There are no pending registrations.</p>
        {/if}
    </article>
    <article id="participant_validated">
        <h2>Accepted registrations</h2>
        {if !empty($acceptedReg)}
            <table>
                {section name=acceptedreg loop=$acceptedReg max=10}
                    <!-- do a loop on li-->
                    <tr>
                        <td>
                            <a href="backend_validation_inscriptions.php?id={$acceptedRegSerialized[acceptedreg]}">
                                {$acceptedReg[acceptedreg]->getEventNo()}
                            </a>
                        </td>
                        <td>{$acceptedReg[acceptedreg]->getParticipantPersonNo()}</td>
                    </tr>
                {/section}
            </table>{else}
            <p class="error_msg">There are no accepted registrations.</p>
        {/if}
    </article>
    <asside id="motivation">
        <h2>Motivation</h2>
        <p><!-- afficher la motivation du participant cliqué...--></p>

        <input type="submit" name="Validate" value="Validate" alt="Accept the registration">
        <input type="submit" name="Cancel" value="Cancel" alt="Refuse the registration">
    </asside>
</section>
