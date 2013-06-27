<!--
user_profile.tpl

Author : Noémie Sandoz et Andréane Mercier, Christophe Rast

Date : 18.6.2013
Description : template of the user profile

-->
<section class="firstElement row lastElement" id="user_profile">
    {if isset($success_profile)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$success_profile}</p>
            </article>
        </section>
    {/if}
    {if isset($error_profile)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$error_profile}</p>
            </article>
        </section>
    {/if}
    {if isset($success_password)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$success_password}</p>
            </article>
        </section>
    {/if}
    {if isset($error_password)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$error_password}</p>
            </article>
        </section>
    {/if}
    {if isset($loggedin) && $loggedin==TRUE}
        <article class="row">
            <article class="offset2 span8">
                <article class="profil span8">
                    <h1>My profile</h1>   
                    <h3>Edit your personnal informations</h3>
                    
                    <form method="post" action="">
                    <article class="profil span12">
                        <label for="Name" class="span3">Name:</label>
                        <input type="text" class="span3" name="Lastname" value="{$person->getName()}" autofocus>

                        <label for="Firstname" class="span3">First name:</label>
                        <input type="text" class="span3" name="Firstname" value="{$person->getFirstName()}" required></article>
                        <article class="profil span12">
                        <label for="Date" class="span7">Date of birth:</label>
                        <input type="date" class="span3" name="Date" value="{$person->getDateOfBirth()}" required>
</article>
                        <article class="profil span12">
                        <label for="Address" class="span3">Address:</label>
                        <input type="text" class="span3" name="Address" value="{$person->getAddress()}" required>

                        <label for="City" class="span3">City:</label>
                        <input type="text" class="span3" name="City" value="{$person->getCity()}" required>
</article>
                        <article class="profil span12">
                        <label for="Country" class="span3">Country:</label>
                        <input type="text" class="span3" name="Country" value="{$person->getCountry()}" autocomplete required>

                        <label for="Email" class="span3">Email:</label>
                        <input type="email" class="span3" name="Email" value="{$person->getEmail()}" required autocomplete></article>
<article class="profil span12">
                        <label for="Phone" class="span3">Phone:</label>
                        <input type="tel" class="span3" name="Phone" value="{$person->getPhoneNumber()}" required ></article>
                        <article class="profil span12">
                        <label for="Description" class="span12">Description:</label>
                        <textarea type="text" class="span12" name="Description" class="big" >{$person->getDescription()}</textarea></article>

                        <input type="submit" name="edit" value="" alt="Edit my informations" class="modify">
                    </form>
                </article>
                <article class="password span4 lastElement">
                    <h1>My password</h1>
                    <h3>Edit your password, leave blank if no changes</h3>

                    <form method="post" action="user_profile.php">

                        <p><label for="Password">Password:</label>
                            <input type="password" name="Password" placeholder="Password"></p>
                        <p><label for="ConfirmPassword">Confirm your Password:</label>
                            <input type="password" name="ConfirmPassword" placeholder="Confirm password"></p>

                        <input type="submit" class="modify" name="changePSW" value="" alt="Edit my password" >
                    </form>
                </article>
            </article>
        </article>
    {else}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>you are not logged in, please do so.</p>
            </article>
        </section>
    {/if}
</section>
