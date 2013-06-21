<!--
user_profile.tpl

Author : Noémie Sandoz et Andréane Mercier, Christophe Rast

Date : 18.6.2013
Description : template of the user profile

-->

<section id="registerToEvent">
    {if isset($loggedin) && $loggedin==TRUE}
        <h2>My profile</h2>
        <p class="subtitle">Edit your personnal informations</p>
        <article class="coordonees">
            <form method="post" action="user_profile.php">
                <input type="text" name="Name" placeholder="{$name}" autofocus>
                <input type="text" name="Firstname" placeholder="{$firstname}">
                <label for="Date">Date of birth:</label>
                <input type="date" name="Date" placeholder="{$birthdate}">
                <input type="text" name="Address" placeholder="{$address}">
                <input type="text" name="City" placeholder="{$city}">
                <input type="text" name="Country" placeholder="{$country}" autocomplete>
                <input type="email" name="Email" placeholder="{$email}"autocomplete>
                <input type="tel" name="Phone" placeholder="{$phone}">
                <textarea type="text" name="Description" class="big">{$desc}</textarea>
                <input type="submit" name="Edit" value="Edit" alt="Edit my informations" >
            </form>
            {if isset($error_profile)}
                <p class="error_msg">{$error_profile}</p>
            {/if}
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