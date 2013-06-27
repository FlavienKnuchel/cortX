<!--
backend_speakers.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the speakers page
-->
<section class="firstElement">
    {if isset($changeSuccess)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$changeSuccess}</p>
            </article>
        </section>
    {/if}
    <section class="row">
        <article class="offset2 span5 lastElement">
            <h1>Speakers</h1>
            <ul>
                {section name=speaker loop=$speakers step=-1}
                    {if $smarty.section.speaker.iteration is div by 2}
                        <li class="line">
                            {else}
                        <li class="greyline">
                    {/if}{$speakers[speaker]->getName()} {$speakers[speaker]->getFirstName()}
                    <a href="backend_speaker.php?id={$speakers[speaker]->getNo()}&modify=true" title="modify" class="modify"></a>

                    </li>
                {/section}
            </ul>
        </article>
        <article class="span3">
            {if isset($modify)}
                <h2>Modify a speaker</h2>
                <form method="POST" action="?id={$modify->getNo()}">
                    <label class="span6" for="Lastname">Last name</label>
                    <input class="span6" type="text" name="Lastname" value="{$modify->getName()}" autofocus required>
                    <label class="span6" for="Firstname">First name</label>
                    <input class="span6" type="text" name="Firstname" value="{$modify->getFirstName()}" required>
                    <label class="span6" for="Date">Date of birth</label>
                    <input class="span6" type="date" name="Date" value="{$modify->getDateOfBirth()}" required>
                    <label class="span6" for="Address">Address</label>
                    <input class="span6" type="text" name="Address" value="{$modify->getAddress()}" required>
                    <label class="span6" for="City">City</label>
                    <input  class="span6" type="text" name="City" value="{$modify->getCity()}" required>
                    <label class="span6" for="Country">Country</label>
                    <input  class="span6" type="text" name="Country" value="{$modify->getCountry()}" required>
                    <label class="span6" for="Phone">Phone number</label>
                    <input  class="span6" type="tel" name="Phone" value="{$modify->getPhoneNumber()}" required>
                    <label class="span6" for="Email">Email</label>
                    <input  class="span6" type="email" name="Email" value="{$modify->getEmail()}"  autocomplete required>
                    <label class="span6" for="Description">Description</label>
                    <textarea type="text" name="Description" required>{$modify->getDescription()}</textarea>
                    <input type="submit" name="edit" title="Edit" value="OK">
                </form>
            {else}
                <h2>Add a speaker</h2>
                <form method="POST" action="backend_speakers.php">
                    <label class="span6" for="Lastname">Last name</label>
                    <input class="span6" type="text" name="Lastname" value="" autofocus >
                    <label class="span6" for="Firstname">First name</label>
                    <input class="span6" type="text" name="Firstname" value="" required>
                    <label class="span6" for="Date">Date of birth:</label>
                    <input class="span6" type="date" name="Date" value="" required>
                    <label class="span6" for="Address">Address</label>
                    <input class="span6" type="text" name="Address" value="" required>
                    <label class="span6" for="City">City</label>
                    <input  class="span6" type="text" name="City" value="" required>
                    <label class="span6" for="Country">Country</label>
                    <input  class="span6" type="text" name="Country" value="" required>
                    <label class="span6" for="Phone">Phone number</label>
                    <input  class="span6" type="tel" name="Phone" value="" required >
                    <label class="span6" for="Email">Email</label>
                    <input  class="span6" type="email" name="Email" value="" required autocomplete>
                    <label class="span6" for="Description">Description</label>
                    <textarea type="text" name="Description" required ></textarea>
                    <input type="submit" name="add" title="Add" value="Add" class="add2">
                </form>
            {/if}
        </article>
    </section>
</section>


