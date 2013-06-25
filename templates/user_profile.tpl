<!--
user_profile.tpl

Author : Noémie Sandoz et Andréane Mercier, Christophe Rast

Date : 18.6.2013
Description : template of the user profile

-->
<section class="firstElement row">
{if !empty($error_profile)}
    <section class="row">
        <article class="offset2 span8 badMessage">
            <p>{$error}</p>
        </article>
    </section>
{/if}
    <article class="row">
        <article class="offset2 span8">
            <div class="span8">
            <article class="profil">
                {if isset($loggedin) && $loggedin==TRUE}
                <h1>My profile</h1>   
                <h3>Edit your personnal informations</h3>
                <form method="post" action="user_profile.php">
                <label for="Name">Name:</label>
                <input type="text" name="Name" value="{$name}" autofocus>
                    
                <label for="Firstname">First name:</label>
                <input type="text" name="Firstname" value="{$firstname}">
                    
                <label for="Date">Date of birth:</label>
                <input type="date" name="Date" value="{$birthdate}">
                    
                <label for="Address">Address:</label>
                <input type="text" name="Address" value="{$address}">
                    
                <label for="City">City:</label>
                <input type="text" name="City" value="{$city}">
                    
                <label for="Country">Country:</label>
                <input type="text" name="Country" value="{$country}" autocomplete>
                    
                <label for="Email">Email:</label>
                <input type="email" name="Email" value="{$email}"autocomplete>
                    
                <label for="Phone">Phone:</label>
                <input type="tel" name="Phone" value="{$phone}">
                    
                <label for="Description">Description:</label>
                <textarea type="text" name="Description" class="big">{$desc}</textarea>
                
                <input type="submit" name="Edit" value="" alt="Edit my informations" class="modify">
                </form>
            </article>
            </div>
            <div class="span4">
            <article class="password">
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
            </div>
        </article>
    {/if}
    </article>
</section>
