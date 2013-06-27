<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->
<section class="firstElement lastElement">
    {if isset($error)}
        <section id="row">
            <article class="offset2 span8 badMessage">
                <p>{$error}</p>
            </article>
        </section>
    {/if}
    {if isset($goodMessage)}
        <section id="row">
            <article class="offset2 span8 goodMessage">
                <p>{$goodMessage}</p>
            </article>
        </section>
    {/if}
    {if isset($event)}
    <section class="row">
        <article class="offset2 span8">
            <h1>Update event</h1>
            <form method="post" action="backend_update_event.php?update=true" id="addEvent">
                <article class="span6">

                    <label for="main_topic_event" class="span6">Main topic of the event</label>
                    <input type="text" class="span6" name="mainTopic" placeholder="Main topic of the event" autofocus value="{$event->getMainTopic()}">

                    <label for="description_event" class="span6">Description of the event</label>
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event">{$event-getDescription()}</textarea>

                    <label for="Date" class="span6">Date format:</label><p class="span6">YYYY-mm-dd</p>

                    <label for="Date" class="span6" placeholder="Starting date">Starting date:</label>
                    <input type="date" class="span6" name="startDate" {if isset($event.startDate)}value="{$event->getStartingDate()}"{/if}>

                    <label for="Date" class="span6">Ending date:</label>
                    <input type="date" class="span6" name="endDate" {if isset($event.endDate)}value="{$event->getEndingDate()}"{/if}>

                    <label for="Time" class="span6">Starting time:</label>
                    <input type="time" class="span6" name="startTime" {if isset($event.startTime)}value="{$event->getStartingTime()}"{/if}>

                    <label for="Time" class="span6">Ending time:</label>
                    <input type="time" class="span6" name="endTime" {if isset($event.endTime)}value="{$event->getEndingTime()}"{/if}>

                    <label for="Location" class="span6">Location:</label>
                    <input type="text" class="span6" name="location" placeholder="Location name" {if isset($event.location)}value="{$location->getName()}"{/if}>

                    <label for="Address" class="span6">Address:</label>
                    <input type="text" class="span6" name="address" placeholder="Address" {if isset($event.address)}value="{$location->getAddress()}"{/if}>

                    <label for="Town" class="span6">Town:</label>
                    <input type="text" class="span6" name="city" placeholder="Town" {if isset($event.city)}value="{$location->getCity()}"{/if} >

                    <label for="Country" class="span6">Country:</label>
                    <input type="text" class="span6" name="country" placeholder="Country" {if isset($event.country)}value="{$location->getCountry()}"{/if}>
                    <input type="hidden" name="eventNo" value="{$event->getNo()}" />
                    <input  type="submit" title="Update event" value="Update" name="update" class="span5">
                </article>
                {else}
                    <section class="row">
        <article class="offset2 span8">
            <h1>Update event</h1>
            <form method="post" action="backend_update_event.php?update=true" id="addEvent">
                <article class="span6">

                    <label for="main_topic_event" class="span6">Main topic of the event</label>
                    <input type="text" class="span6" name="mainTopic" placeholder="Main topic of the event" autofocus {if isset($filledDatas.mainTopic)}value="{$filledDatas.mainTopic}"{/if}>

                    <label for="description_event" class="span6">Description of the event</label>
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event">{if isset($filledDatas.description)}{$filledDatas.description}{/if}</textarea>

                    <label for="Date" class="span6">Date format:</label><p class="span6">YYYY-mm-dd</p>

                    <label for="Date" class="span6" placeholder="Starting date">Starting date:</label>
                    <input type="date" class="span6" name="startDate" {if isset($filledDatas.startDate)}value="{$filledDatas.startDate}"{/if}>

                    <label for="Date" class="span6">Ending date:</label>
                    <input type="date" class="span6" name="endDate" {if isset($filledDatas.endDate)}value="{$filledDatas.endDate}"{/if}>

                    <label for="Time" class="span6">Starting time:</label>
                    <input type="time" class="span6" name="startTime" {if isset($filledDatas.startTime)}value="{$filledDatas.startTime}"{/if}>

                    <label for="Time" class="span6">Ending time:</label>
                    <input type="time" class="span6" name="endTime" {if isset($filledDatas.endTime)}value="{$filledDatas.endTime}"{/if}>
                    <input  type="submit" title="Update event" value="Update" name="update" class="span5">
                </article>
                {/if}
    {if !empty($filledDatas)}
                    <div class="offset1 span4">

                        {if isset($iterationNumber)}
                            {section loop=$iterationNumber name=slots}
                                {capture name=happeningDate}happeningDate{$iterationNumber[slots]}{/capture}
                                {capture name=slotStartingTime}slotStartingTime{$iterationNumber[slots]}{/capture}
                                {capture name=slotEndingTime}slotEndingTime{$iterationNumber[slots]}{/capture}
                                <article class="span12 slot">
                                    <h1>Slot {$iterationNumber[slots]}</h1>
                                    <label for="Date" class="span12">Happening date:</label>
                                    <input type="date" class="span12" name="happeningDate{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.happeningDate})}
                                        value="{$newSlots.{$smarty.capture.happeningDate}}"
                                            {/if}>
                                    <label for="Date" class="span12">Starting time:</label>
                                    <input type="time" class="span12" name="slotStartingTime{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.slotStartingTime})}
                                        value="{$newSlots.{$smarty.capture.slotStartingTime}}"
                                            {/if}>
                                    <label for="Date" class="span12">Ending time:</label>
                                    <input type="time" class="span12" name="slotEndingTime{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.slotEndingTime})}
                                        value="{$newSlots.{$smarty.capture.slotEndingTime}}"
                                            {/if}>
                                </article>
                            {/section}
                        {/if}
                </div>
            </form>
        </article>
    </section>
    {/if}
[/if]


</section>

        