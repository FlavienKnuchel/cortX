<!--
backend_team.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the team page
-->
        <section id="bk_team">
            <!-- do a loop on div (for all the person in the team) -->
            <div id="members_of_the_team">
                <h2>{$person_name} {$person_first_name}</h2>
                
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        {$team_role_name} <!-- ATTENTION ajouter boutton modifier et supprimer-->
                    </li>
                </ul>
                 <form method="POST" action="backend_team.php">
                    <input type="text" list="team_role" required>
                    <datalist id="team_role" >
                       <option> {$team_role_name} <!--do a loop for all the role of the team-->
                    </datalist>
                 </form>
            </div>
        </section>
        <section id="add_organizer">
            <article>
                <h2>Add an organizaer</h2>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        {$person_name} {$person_first_name} <!-- ATTENTION ajouter boutton "ajouter"-->
                    </li>
                </ul>
            </article>
        </section>
        <section id="add_new_person">
        <h2>Add a new person</h2>
        <h3>His/her co-ordinates</h3>
        <form method="post" action="register.php">
            <article class="coordonees">
                <input type="text" name="Lastname" placeholder="Name" autofocus required>
                <input type="text" name="Firstname" placeholder="Firstname" required>
                <label for="Date">Date of birth:</label>
                <input type="date" name="Date" required>
                <input type="text" name="Adress" placeholder="Address" required>
                <input type="text" name="Town" placeholder="Town" required>
                <input type="text" name="Country" placeholder="Country" required>
                <input type="email" name="Email" placeholder="Email" required autocomplete>
                <input type="tel" name="Phone" placeholder="Phone number" required>
                <input type="password" name="Password" placeholder="Password" required>
                <input type="role" name="Role" required>
                    <datalist id="team_role" >
                       <option> {$team_role_name} <!--do a loop for all the role of the team-->
                    </datalist>
                    
                <input type="submit" name="Add" value="Add" alt="Add the person">
            </article>
            
        </form>
        </section>
