<!--
user_inscriptions.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user inscription

-->

<section id="inscription">
    <article class="form_inscr">
        {if $regStatus}
            {section name=eventTopic loop=$eventsObjects}
                {if $smarty.section.eventTopic.last}
                    <h2>You are applying to {$eventsObjects[eventTopic]->getMainTopic()}</h2>
                {/if}
            {/section}
            <h3>Your motivation</h3>
            <form method="POST" action="user_inscriptions.php">
                <input type="text" name="motivation"  value="{$motivation}" class="big" required>
                <label for="Keyword" title="Describe your interests in 3 words">Keywords:</label>
                <input type="text" name="Keyword1" value="{$kw1}" required>
                <input type="text" name="Keyword2" value="{$kw2}" required>
                <input type="text" name="Keyword3" value="{$kw3}" required>

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
</section>
