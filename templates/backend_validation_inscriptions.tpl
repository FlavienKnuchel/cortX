<!--
backend_validation_inscriptions.tpl

Author : Noémie Sandoz and Andréane Mercier, Christophe Rast
Date : 18.6.2013

Description : backend of the participant page
-->

<section class="firstElement">
    {if !empty($goodMessage)}
        <section class="row">
            <article class="offset2 span8 goodMessage">
                <p>{$goodMessage}</p>
            </article>
        </section>
    {/if}
    {if !empty($error)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <p>{$error}</p>
            </article>
        </section>
    {/if}
    <section class="row">
        <article class="offset2 span5 lastElement">
            {if $loggedin}
                <h1>Select Event</h1>
            {if isset($upcomingEvents)}
                    <div>
                        <form method="POST" action="backend_validation_inscriptions.php">
                            <label for="event">Filter by Event</label>
                            <select name="select" id="select">
                                {foreach $upcomingEvents as $event}
                                    <option value="{$event->getNo()}" {if isset($anEvent)}{if $anEvent->getNo() == $event->getNo()}selected{/if}{/if}>{$event->getMainTopic()}</option>
                                {/foreach}
                            </select>
                            <input type="submit" value="Select">
                        </form>
                    </div>
                        {if isset($sentRegistrations)&&isset($anEvent)}
                            <h1>{$anEvent->getMainTopic()}</h1>
                            {if !empty($dentRegistrations)}
                            <ul>
                                {section name=sentregistration loop=$sentRegistrations}
                                    {if $smarty.section.sentregistration.iteration is div by 2}<li class="line">{else}<li class="greyLine">{/if}
                                     <a href="backend_validation_inscriptions.php?eventNo={$anEvent->getNo()}&personNo={$sentRegistrations[sentregistration].person->getNo()}&registrationStatus={$sentRegistrations[sentregistration].registration->getStatus()}"}>
                                            {$sentRegistrations[sentregistration].person->getName()}</a> --- {$sentRegistrations[sentregistration].registration->getStatus()} </li>
                                            </a>
                                    </li>
                                {/section}
                            {else}
                                <p>No sent Registrations</p>
                            {/if}
                            </ul>
                        {else}
                            <p class="error_msg">There is no sent registration to display for this event.</p>
                        {/if}

               {if isset($acceptedOrRejectedRegistrations)}
                   <h1>Already validated Registrations</h1>
                   {if !empty($acceptedOrRejectedRegistrations)}
                   <ul>
                       {section loop=$acceptedOrRejectedRegistrations name=old}
                           <li>{$acceptedOrRejectedRegistrations[old].person->getName()} --- {$acceptedOrRejectedRegistrations[old].registration->getStatus()}</li>

                       {/section}

                   </ul>
                       {else}
                       <p>No accepted or Rejected Registrations</p>
                   {/if}
               {/if}
        </article>
                <article class="span3">
                    <h2>Motivation</h2>
                    {if isset($msgMotivation)}
                        {if $msgMotivation->getStatus()}
                            <p>{$motivation->getText()}</p>
                        {else}
                            <p class="error_msg">There is no motivation for this registration.</p>
                        {/if}
                        <form method="POST" action="">
                            <input type="hidden" name="registration" value="{$person->getNo()}-{$registration->getStatus()}-{$anEvent->getNo()}">
                            <input type="submit" name="Accept" value="Accept" alt="Accept the registration">
                            <input type="submit" name="Refuse" value="Refuse" alt="Refuse the registration">
                        </form>
                    {else}
                        <p>No registration selected.</p>
                    {/if}
                </article>






            {/if}
        {else}
        <p>You can't access this content, please log in.</p>
        {/if}

    </section>
</section>