<!--
backend_home.tpl

Author : Noémie Sandoz and Andréane Mercier

Date : 18.6.2013
Description : template of the backend home page

-->
{if isset($_GET['eventAddSuccess'])}
    <section id="row">
        <article class="offset2 span8 goodMessage">
            <p>The Event has successfully been added!</p>
        </article>
    </section>
{/if}
<section class="menu">    
    <article class="offset2 span8">
        <ul>
            <li>
                <a href="backend_speakers.php" title="Speakers"><h3 class="{$classUserLevel}">Speakers</h3></a>
            </li>
            <li>
                <a href="backend_events.php" title="Events"><h3 class="{$classUserLevel}">Events</h3></a>
            </li>
                {if $userLevel == 'validator' || $userLevel == 'administrator' || $userLevel == 'superadmin'}
            <li>
                <a href="backend_validation_inscriptions.php" title="Participant"><h3 class="{$classUserLevel}">Registrations</h3></a>
            </li>
                {if $userLevel == 'administrator' || $userLevel == 'superadmin'}
            <li>
                <a href="backend_team.php" title="Team"><h3 class="{$classUserLevel}">Team</h3></a>
            </li>
            <li>
                <a href="backend_account.php" title="Account"><h3 class="{$classUserLevel}">All accounts</h3></a>
            </li>
                {/if}
                {/if}
        </ul>
    </article>
</section>

