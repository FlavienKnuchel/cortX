<!--
user_profile.tpl

Author : Noémie Sandoz et Andréane Mercier, Christophe Rast

Date : 18.6.2013
Description : template of the user profile

-->
<section class="firstElement row">
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
                        <label for="Name">Name:</label>
                        <input type="text" name="Lastname" value="{$person->getName()}" autofocus>

                        <label for="Firstname">First name:</label>
                        <input type="text" name="Firstname" value="{$person->getFirstName()}" required>

                        <label for="Date">Date of birth:</label>
                        <input type="date" name="Date" value="{$person->getDateOfBirth()}" required>

                        <label for="Address">Address:</label>
                        <input type="text" name="Address" value="{$person->getAddress()}" required>

                        <label for="City">City:</label>
                        <input type="text" name="City" value="{$person->getCity()}" required>

                        <label for="Country">Country:</label>
                        <input type="text" name="Country" value="{$person->getCountry()}" autocomplete required>

                        <label for="Email">Email:</label>
                        <input type="email" name="Email" value="{$person->getEmail()}" required autocomplete>

                        <label for="Phone">Phone:</label>
                        <input type="tel" name="Phone" value="{$person->getPhoneNumber()}" required >

                        <label for="Description">Description:</label>
                        <textarea type="text" name="Description" class="big" >{$person->getDescription()}</textarea>

                        <input type="submit" name="edit" value="" alt="Edit my informations" class="modify">
                    </form>
                </article>
                <article class="password span4">
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
