<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the participant page
-->
<div class="row offset2">
        <section id="waiting_validation">
            <article>
                <h2>Waiting for validation</h2>
                
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <a href="#">{$participant_name}</a>
                    </li>
                </ul>
            </article>
        </section>
        <section id="participant_validated">
            <article>
                <h2>Accepted</h2>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <a href="#">{$participant_name}</a>
                    </li>
                </ul>
            </article>
        </section>
        <asside id="motivation">
            <h2>Motivation</h2>
            <p><!-- afficher la motivation du participant cliqué...--></p>
            
            <input type="submit" name="Validate" value="Validate" alt="Accept the participant">
            <input type="submit" name="Cancel" value="Cancel" alt="Refuse">
        </asside>
</div>
