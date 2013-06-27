<!--
backend_team.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the team page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">
            <div id="members_of_the_team">
                <h1>List of organizers</h1>
                {if isset($organizers)}
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Firstname</th>
                            <th>Modify</th>
                            <th>Delete</th>
                        </tr>
                        {section name=organizer loop=$organizers}
                            <tr>
                                <td>{$organizers[organizer]->getName()}</td>
                                <td>{$organizers[organizer]->getFirstName()}</td>
                                <td><a href="?action=modify&no={$organizers[organizer]->getNo()}" title="modify" class="modify"></a></td>
                                <td><a href="?action=delete&no={$organizers[organizer]->getNo()}" title="delete" class="delete"></a></td>
                            </tr>
                        {/section}
                    </table>
                {else}
                    <p>There is no organizers to display.</p>
                {/if}
            </div>
            <div id="organizer">
                <h1>Set a person as an organizer</h1>

                <table>
                    <tr>
                        <th>Name</th>
                        <th>Firstname</th>
                        <th>Add this person to the organizers</th>
                    </tr>
                    {section name=person loop=$persons}
                        <tr>
                            <td>{$persons[person]->getName()}</td>
                            <td>{$persons[person]->getFirstName()}</td>
                            <td><a href="?action=add&no={$persons[person]->getNo()}" title="add" class="add"></a></td>
                        </tr>
                    {/section}
                </table>
            </div>
        </article>
        <article class="span3">
            <h1>Add a collaborator</h1>
            <h2>Infos</h2>
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


