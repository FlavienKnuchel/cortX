<!--
backend_team.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the team page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">
            <!-- do a loop on div (for all the person in the team) -->
            <div id="members_of_the_team">
                <h1>{$person_name} {$person_first_name}</h1>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <p>{$team_role_name}
                           <a href="#" title="modify" class="modify"></a>
                            <a href="#" title="delete" class="delete"></a>
                            <!-- ATTENTION ajouter boutton modifier et supprimer-->
                        </p>
                    </li>
                </ul>
                <form method="POST" action="backend_team.php">
                    <input type="text" list="team_role" required>
                    <datalist id="team_role" >
                       <option> {$team_role_name} <!--do a loop for all the role of the team-->
                    </datalist>
                 </form>
            </div>
            <div id="organizer">
                <h2>Add an organizer<a href="#" title="add this personn" class="add"></a></h2>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        {$person_name} {$person_first_name}
                        
                        <!-- ATTENTION ajouter boutton "ajouter"-->
                    </li>
                </ul>
            </div>
        </article>
        <article class="span3">
            <h1>Add a new person</h1>
            <h2>His/her co-ordinates</h2>
            <form method="post" action="register.php">
                <label class="span1" for="LastName">Last Name:</label>
                <input class="span1" type="text" name="Lastname" placeholder="Name" autofocus required>
                
                <label class="span1" for="FirstName">First Name:</label>
                    <input class="span1" type="text" name="Firstname" placeholder="Firstname" required>
                
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" required>
                
                <label class="span1" for="Address">Address:</label>
                    <input class="span1" type="text" name="Adress" placeholder="Address" required>
                
                <label class="span1" for="Town">Town:</label>
                    <input class="span1" type="text" name="Town" placeholder="Town" required>
                
                <label class="span1" for="Country">Country:</label>
                    <input class="span1" type="text" name="Country" placeholder="Country" required>
                
                <label class="span1" for="Email">Email:</label>
                    <input class="span1" type="email" name="Email" placeholder="Email" required autocomplete>
                
                <label class="span1" for="Phone">Phone:</label>
                    <input class="span1" type="tel" name="Phone" placeholder="Phone number" required>
                
                <label class="span1" for="Password">Password:</label>
                    <input class="span1" type="password" name="Password" placeholder="Password" required>
                
                <label class="span1" for="Role">Role:</label>
                <select name="teamRoles">
                    {section name=teamrole loop=$teamroles}
                    <option value="{$teamroles[teamrole]->getName()}">{$teamroles[teamrole]->getName()}</option>
                    {/section}
                </select>
                    <input type="submit" name="Add" value="Add" alt="Add the person">
            </form>
        </article>
    </section>
</section>


