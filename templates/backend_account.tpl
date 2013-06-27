<!--
backend_account.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the account page
-->
<section class="firstElement">
    {if !empty($error)}
        <section id="row">
            <article class="offset2 span8 badMessage">
                <p>{$error}</p>
            </article>
        </section>
    {/if}
    {if isset($delete)}
        <section id="row">
            <article class="offset2 span8 badMessage">
                <p>User  -{$delete->getFirstName()} {$delete->getName()}- deleted</p>
            </article>
        </section>
    {/if}

    <section class="row">
        <article class="offset2 span5 lastElement">     
            <h1>Members</h1>
            <ul>
            {section loop=$persons name=person}

                {if $smarty.section.person.iteration is div by 2}
                <li class="line">
                {else}
                <li class="greyline">
                {/if}
                    <p>
                        {$persons[person].firstname} {$persons[person].lastname}
                        <a href="backend_account.php?id={$persons[person].num}" title="modify" class="modify"></a>
                        <a href="backend_account.php?deleteNo={$persons[person].num}" title="delete" class="delete"></a>
                    </p>
                    
                    <!-- ATTENTION ajouter boutton modifier /!\ modifier renvoit au champ infos du comptes selectionné sur la meme page!(section ci-dessous) et supprimer-->
                    
                 </li>
            {/section}
             </ul>
        </article>
        <article class="span3">
        <h2>Informations of selected Member</h2>
            {if isset($selectedPerson)}
                <h2>Modify a Member</h2>
                <form class="span12" method="POST" action="?id={$selectedPerson->getNo()}" id="addEvent">
                    <label class="span6" for="Lastname">Last name</label>
                    <input class="span6" type="text" name="Lastname" value="{$selectedPerson->getName()}" autofocus required>
                    <label class="span6" for="Firstname">First name</label>
                    <input class="span6" type="text" name="Firstname" value="{$selectedPerson->getFirstName()}" required>
                    <label class="span6" for="Date">Date of birth</label>
                    <input class="span6" type="date" name="Date" value="{$selectedPerson->getDateOfBirth()}" required>
                    <label class="span6" for="Address">Address</label>
                    <input class="span6" type="text" name="Address" value="{$selectedPerson->getAddress()}" required>
                    <label class="span6" for="City">City</label>
                    <input  class="span6" type="text" name="City" value="{$selectedPerson->getCity()}" required>
                    <label class="span6" for="Country">Country</label>
                    <input  class="span6" type="text" name="Country" value="{$selectedPerson->getCountry()}" required>
                    <label class="span6" for="Phone">Phone number</label>
                    <input  class="span6" type="tel" name="Phone" value="{$selectedPerson->getPhoneNumber()}" required>
                    <label class="span6" for="Email">Email</label>
                    <input  class="span6" type="email" name="Email" value="{$selectedPerson->getEmail()}"  autocomplete required>
                    <input type="submit" name="update" title="update" value="Update">
                </form>

            {else}
                <p>No account selected</p>
            {/if}

        </article>
    </section>    
</section>
