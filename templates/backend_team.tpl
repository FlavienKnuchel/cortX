<!--
backend_team.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the team page
-->
<section class="firstElement lastElement">
    {if isset($err_RV)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$err_RV}</p>
            </article>
        </section>
    {/if}
    {if isset($msg_RV)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$msg_RV}</p>
            </article>
        </section>
    {/if}
    {if isset($msg_CP)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$msg_CP}</p>
            </article>
        </section>
    {/if}
    {if isset($msg_TR)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$msg_TR}</p>
            </article>
        </section>
    {/if}
    {if isset($msg_org)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$msg_org}</p>
            </article>
        </section>
    {/if}
    {if isset($err_org)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$err_org}</p>
            </article>
        </section>
    {/if}
    <section class="row">
        <article class="offset2 span5 team">
            <div>
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
            {if isset($person)}
                <h1>Modify a collaborator</h1>
                <h2>Infos</h2>
                <form method="post" action="">
                    <label class="span1" for="LastName">Last Name:</label>
                    <input class="span1" type="text" name="Lastname" value="{$person->getName()}" autofocus>
                    <label class="span1" for="FirstName">First Name:</label>
                    <input class="span1" type="text" name="Firstname" value="{$person->getFirstName()}">
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" value="{$person->getDateOfBirth()}">
                    <label class="span1" for="Address">Address:</label>
                    <input class="span1" type="text" name="Address" value="{$person->getAddress()}">
                    <label class="span1" for="Town">City:</label>
                    <input class="span1" type="text" name="City" value="{$person->getCity()}">
                    <label class="span1" for="Country">Country:</label>
                    <input class="span1" type="text" name="Country" value="{$person->getCountry()}">
                    <label class="span1" for="Email">Email:</label>
                    <input class="span1" type="email" name="Email" value="{$person->getEmail()}" autocomplete>
                    <label class="span1" for="Phone">Phone:</label>
                    <input class="span1" type="tel" name="Phone" value="{$person->getPhoneNumber()}">
                    <label class="span1" for="Role">Role:</label>
                    <select name="teamRoles">
                        <option value="---">Select a Teamrole</option>
                        {section name=teamrole loop=$teamroles}
                            <option value="{$teamroles[teamrole]->getName()}">{$teamroles[teamrole]->getName()}</option>
                        {/section}
                    </select>
                    <input type="hidden" name="personNo" value="{$person->getNo()}">
                    <input type="submit" name="Modify" value="Modify" alt="Add the person">
                </form>
            {else}
                <h1>Add a collaborator</h1>
                <h2>Infos</h2>
                <form method="post" action="">
                    <label class="span1" for="LastName">Last Name:</label>
                    <input class="span1" type="text" name="Lastname" value="" autofocus required>
                    <label class="span1" for="FirstName">First Name:</label>
                    <input class="span1" type="text" name="Firstname" value="" required>
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" required>
                    <label class="span1" for="Address">Address:</label>
                    <input class="span1" type="text" name="Adress" value="" required>
                    <label class="span1" for="Town">Town:</label>
                    <input class="span1" type="text" name="Town" value="" required>
                    <label class="span1" for="Country">Country:</label>
                    <input class="span1" type="text" name="Country" value="" required>
                    <label class="span1" for="Email">Email:</label>
                    <input class="span1" type="email" name="Email" value="" required autocomplete>
                    <label class="span1" for="Phone">Phone:</label>
                    <input class="span1" type="tel" name="Phone" value="" required>
                    <label class="span1" for="idmember">Username:</label>
                    <input class="span1" type="text" name="idmember" value="" required>
                    <label class="span1" for="Password">Password:</label>
                    <input class="span1" type="password" name="Password" value="" required>
                    <label class="span1" for="Role">Role:</label>
                    <select name="teamRoles">
                        <option value="---">Select a Teamrole</option>
                        {section name=teamrole loop=$teamroles}
                            <option value="{$teamroles[teamrole]->getName()}">{$teamroles[teamrole]->getName()}</option>
                        {/section}
                    </select>
                    <input type="submit" name="Add" value="Add" alt="Add the person">
                </form>
            {/if}
        </article>
    </section>
</section>


