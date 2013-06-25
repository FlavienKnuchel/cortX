<!--
user_profile.tpl

Author : Noémie Sandoz et Andréane Mercier, Christophe Rast

Date : 18.6.2013
Description : template of the user profile

-->
{if !empty($error_profile)}
    <section id="row">
        <article class="offset2 span8 badMessage">
            <p>{$error}</p>
        </article>
    </section>
{/if}
<section id="registerToEvent">
    {if isset($loggedin) && $loggedin==TRUE}
        <h2>My profile</h2>
        <p class="subtitle">Edit your personnal informations</p>
        <article class="coordonees">
            <form method="post" action="user_profile.php">
                <input type="text" name="Name" value="{$name}" autofocus>
                <input type="text" name="Firstname" value="{$firstname}">
                <label for="Date">Date of birth:</label>
                <input type="date" name="Date" value="{$birthdate}">
                <input type="text" name="Address" value="{$address}">
                <input type="text" name="City" value="{$city}">
                <input type="text" name="Country" value="{$country}" autocomplete>
                <input type="email" name="Email" value="{$email}"autocomplete>
                <input type="tel" name="Phone" value="{$phone}">
                <textarea type="text" name="Description" class="big">{$desc}</textarea>
                <input type="submit" name="Edit" value="Edit" alt="Edit my informations" >
            </form>
        </article>
        <h2>My password</h2>
        <p class="subtitle">Edit your password, leave blank if no changes</p>
        <article id="password">
            <form method="post" action="user_profile.php">
                <input type="password" name="Password" placeholder="Password">
                <input type="password" name="ConfirmPassword" placeholder="Confirm password">
                <input type="submit" name="changePSW" value="Change" alt="Edit my password" >
            </form>
        </article>
    {/if}
</section>