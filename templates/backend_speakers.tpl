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
        <article class="offset2 span5">
            <h1>Speakers</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Firstname</th>
                    <th>Edit</th>
                </tr>
                {section name=speaker loop=$speakers step=-1}
                          <tr>
                            <td>{$speakers[speaker]->getName()}</td>
                            <td>{$speakers[speaker]->getFirstName()}</td>
                            <td>
                    <form method="POST" action="?id={$smarty.section.speaker.index}">
                        <input type="submit" value="" title="Modify" name="modify" class="modify">
                    </form>
                            </td>
                        </tr>
                {/section}
            </table>
        </article>
        <article class="span3">
            {if isset($modify)}
                <h2>Modify a speaker</h2>
                <form method="POST" action="?id={$modify->getNo()}">
                    <input class="span1" type="text" name="Lastname" value="{$modify->getName()}" autofocus >
                    <input class="span1" type="text" name="Firstname" value="{$modify->getFirstName()}" >
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" value="{$modify->getDateOfBirth()}" >
                    <input class="span1" type="text" name="Address" value="{$modify->getAddress()}" >
                    <input  class="span1" type="text" name="City" value="{$modify->getCity()}" >
                    <input  class="span1" type="text" name="Country" value="{$modify->getCountry()}" >
                    <input  class="span1" type="tel" name="Phone" value="{$modify->getPhoneNumber()}" >
                    <input  class="span1" type="email" name="Email" value="{$modify->getEmail()}"  autocomplete>
                    <textarea type="text" name="Description" >{$modify->getDescription()}</textarea>
                    <input type="submit" name="edit" title="Edit" value="OK">
                </form>
            {else}
                <h2>Add a speaker</h2>
                <form method="POST" action="backend_speakers.php">
                    <input class="span1" type="text" name="Lastname" value="" autofocus >
                    <input class="span1" type="text" name="Firstname" value="" required>
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" value="" required>
                    <input class="span1" type="text" name="Address" value="" required>
                    <input  class="span1" type="text" name="City" value="" required>
                    <input  class="span1" type="text" name="Country" value="" required>
                    <input  class="span1" type="tel" name="Phone" value="" required >
                    <input  class="span1" type="email" name="Email" value="" required autocomplete>
                    <textarea type="text" name="Description" required ></textarea>
                    <input type="submit" name="add" title="Add" value="Add" class="add2">
                </form>
            {/if}
        </article>
    </section>
</section>


