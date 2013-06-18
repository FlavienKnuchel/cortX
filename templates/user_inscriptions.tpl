<!--
user_inscriptions.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user inscription

-->

<section id="inscription">
    <article class="form_inscr">
        <h2>You are applying to {$oldEvent[0]->getMainTopic()}</h2>
        <p>My motivation</p>
        <form method="POST" action="user_inscription.php">
            <input type="text" name="motivation" placeholder="Why should we choose you and not someone else ?" required>
            <label for="Keyword" title="Describe your interests in 3 words">Keywords:</label>
            <input type="text" name="Keyword1" placeholder="Keyword" required>
            <input type="text" name="Keyword2" placeholder="Keyword" required>
            <input type="text" name="Keyword3" placeholder="Keyword" required>

            <!--<input type="submit" name="preview" value="preview of the badge" alt="preview of the badge">-->
            <input type="submit" name="Save" value="Save" alt="Save and edit later">
            <input type="submit" name="Send" value="Send" alt="Submit your registration request">
        </form>
    </article>

    <article class="history">
        <h2>History</h2>
        <ul>
            {section name=event start=1 loop=$oldEvent max=10}
            <li>
                <a href="events_oldEvents.php?event={$oldEvent[event]->getNo()}">
                    {$oldEvent[event]->getMainTopic()} the {$oldEvent[event]->getStartingDate()}
                </a>
            </li>
            {/section}
        </ul>
    </article>
</section>
