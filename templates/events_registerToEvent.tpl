<!--
events_registerToEvent.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier

Date : 17.6.2013
Description : template of the registration to an event

-->

{if isset($userCameFrom)}
    <div class="button_back offset2"><a href='{$userCameFrom}'>Back</a></div>
{/if}
<section id="registerToEvent">
    
    <h2 class="offset2">Apply to this event!</h2>
        
    {if isset($badDatas)}
        <article class="error offset2">Error, please try again.</article>


    {else}
    <p class="subtitle offset2">Fill in your informations to apply for this event</p>
    <form method="post" action="register.php">

        <article class="coordonees row offset2 span8" {if $loggedin}style="display:none;"{/if}>
            <p>
                <input type="text" name="lastname" placeholder="Your name" autofocus required>
                <input type="text" name="firstname" placeholder="Your firstname" required>
                <label for="date">Date of birth:</label>
                <input type="date" name="date" placeholder="YYYY-MM-DD"required>
            </p>
            <p>
                <input type="text" name="adress" placeholder="Your adress" required>
                <input type="text" name="city" placeholder="Your town" required>
                <input type="text" name="country" placeholder="Your country" required>
            </p>
            <p>
                <input type="email" name="email" placeholder="Your email" required autocomplete>
                <input type="tel" name="phone" placeholder="Your phone number" required>
                <input type="password" name="password" placeholder="Choose a password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
            </p>
        </article>
        <div class="row offset2 span8">
            <article class="domain">
                <label for="type">What do you do?</label>
                <input type="text" name="type" placeholder="Your activity domain">
                <input type="text" name="typeDescription" placeholder="Your role in this domain">
            </article>
    
            
            <article class="motivation">
                <p class="subtitle">Explain us your motivations</p>
                <textarea type="text" name="motivation" class="big" required></textarea>
                <p>
                    <label for="Keyword" title="describe your interests in 3 words">Keywords:</label>
                    <input type="text" name="keyword1" placeholder="Keyword" >
                    <input type="text" name="keyword2" placeholder="Keyword" >
                    <input type="text" name="keyword3" placeholder="Keyword" >
                </p>
                <input type="submit" name="save" value="Save" alt="Save and edit later" title="Save and edit later">
                <input type="submit" name="send" value="Send" alt="Submit your registration request" title="Save and edit later">
            </article>
        </div>
    </form>
    {/if}
</section>