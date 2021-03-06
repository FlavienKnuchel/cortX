<!--
backend_events.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the events page
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
                <p>Event  -{$delete->getMainTopic()}- deleted</p>
            </article>
        </section>
    {/if}
    <section class="row">
        <article class="offset2 span5 lastElement">  
            <h1>Events</h1>
            <div class="button"><a href="backend_add_event.php">New event</a></div>
            <ul>
                {section loop=$events name=event step=-1}
                    {if $smarty.section.event.iteration is div by 2}
                        <li class="line">
                    {else}
                        <li class="greyline">
                    {/if}
                    <p>{$events[event]->getMainTopic()}
                        <a href="backend_update_event.php?eventNo={$events[event]->getNo()}" title="modify" class="modify"></a>
                        <a href="backend_events.php?deleteNo={$events[event]->getNo()}" title="delete" class="delete"></a>
                    </p>
                </li>
                {/section}
            </ul>     
        </article>
    </section>
</section>
