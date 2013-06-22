<!--
events_registerToEvent.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier

Date : 17.6.2013
Description : template of the registration to an event

-->

{if isset($userCameFrom)}
    <div class="button"><a href='{$userCameFrom}'>Retour</a></div>
{/if}
<section id="registerToEvent">
    <h2>Apply to this event!</h2>
    <p class="subtitle">Fill in your informations to apply for this event</p>
    <form method="post" action="register.php">
        {if !$loggedin}
        <article class="coordonees">
            <input type="text" name="lastname" placeholder="Your name" autofocus required>
            <input type="text" name="firstname" placeholder="Your firstname" required>
            <label for="date">Date of birth:</label>
            <input type="date" name="date" placeholder="YYYY-MM-DD"required>
            <input type="text" name="adress" placeholder="Your adress" required>
            <input type="text" name="city" placeholder="Your town" required>
            <input type="text" name="country" placeholder="Your country" required>
            <input type="email" name="email" placeholder="Your email" required autocomplete>
            <input type="tel" name="phone" placeholder="Your phone number" required>
            <input type="password" name="password" placeholder="Choose a password" required>
            <input type="password" name="ConfirmPassword" placeholder="Confirm your password" required>
        </article>
        {/if}
        <article class="motivation">
            <p class="subtitle">Explain us your motivation</p>
            <textarea type="text" name="Motivation" class="big" required></textarea>
            <label for="Keyword" title="Describe your interests in 3 words">Keywords:</label>
            <input type="text" name="Keyword1" placeholder="Keyword" required>
            <input type="text" name="Keyword2" placeholder="Keyword" required>
            <input type="text" name="Keyword3" placeholder="Keyword" required>
            <input type="submit" name="Save" value="Save" alt="Save and edit later" title="Save and edit later">
            <input type="submit" name="Send" value="Send" alt="Submit your registration request" title="Save and edit later">
        </article>
    </form>
</section>