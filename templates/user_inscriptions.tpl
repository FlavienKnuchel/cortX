<!--
user_inscriptions.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user inscription

-->

<section id="inscription">
    {if $loggedin}
        {if $participant->getStatus()}
            {if isset($registration) }
                <article class="form_inscr">
                    {if $regStatus}
                        {section name=eventTopic loop=$eventsObjects}
                            {if $smarty.section.eventTopic.last}
                                <h2>You are applying to {$eventsObjects[eventTopic]->getMainTopic()}</h2>
                            {/if}
                        {/section}
                        <h3>Your motivation</h3>
                        <form method="POST" action="user_inscriptions.php">
                            <label for="type">Your activity domain</label>
                            <input type="text" name="type" placeholder="Your activity domain" required
                                   value='{$registration->getType()}'>
                            <label for="typeDescription">Your role in this domain</label>
                            <input type="text" name="typeDescription" placeholder="Your role in this domain" required
                                   value='{$registration->getTypeDescription()}'>
                        </article>
                            <label for="motivation" class="subtitle">Explain us your motivations</label>
                            <textarea name="motivation" title="motivation" class="big" autofocus spellcheck>{$motivation}</textarea>
                            <label for="Keyword" title="Describe youself in 3 words">Keywords describing you</label>
                            <input type="text" name="Keyword1" value="{$kw1}" value="">
                            <input type="text" name="Keyword2" value="{$kw2}" value="">
                            <input type="text" name="Keyword3" value="{$kw3}" value="">

                            <!--<input type="submit" name="preview" value="preview of the badge" alt="preview of the badge">-->
                            <input type="submit" name="Save" value="Save" alt="Save and edit later">
                            <input type="submit" name="Send" value="Send" alt="Submit your registration request">
                        </form>
                    {else}
                        {section name=eventTopic loop=$eventsObjects}
                            {if $smarty.section.eventTopic.last}
                                <h2>You applied to {$eventsObjects[eventTopic]->getMainTopic()}</h2>
                            {/if}
                        {/section}
                        <p class="subtitle">You can view your appliance but cannot update it anymore.</p>
                        <h3>Your motivation</h3>
                        <p class="form_closed motivation">{$getMotivation}</p>
                        <p class="form_closed keyword">{$getKW1}</p>
                        <p class="form_closed keyword">{$getKW2}</p>
                        <p class="form_closed keyword">{$getKW3}</p>

                    {/if}
                </article>
            {else}
                    <section id="row">
                        <article class="offset2 span8 badMessage">
                            <p>You Don't have any registrations yet</p>
                        </article>
                    </section>
            {/if}
            <aside id="oldevents">
                <h2>Previous events</h2>
                <table>
                    <thead>
                        <tr>
                            <td>Topic</td>
                            <td>Date</td>
                        </tr>
                    </thead>
                    <tbody>
                        {if isset($eventsObjects)}
                            {section loop=$eventsObjects name=oldEvents step=-1}
                            {if $smarty.section.oldEvents.first} {else}
                                <tr>
                                    <td>{$eventsObjects[oldEvents]->getMainTopic()}</td>
                                    <td>{$eventsObjects[oldEvents]->getStartingDate()}</td>
                                </tr>
                            {/if}
                        {/section}
                    {else}
                        <tr>
                            <td>No previous events</td>
                            <td></td>
                        </tr>
                    {/if}
                </tbody>
            </table>
        </aside>
    {else}
        <p class="error_msg" {$participant->getMessage()}</p>
    {/if}
{else}
    <p class="error_msg">
        You are not logged in, you cannot access this content.
    </p>
{/if}
</section>
