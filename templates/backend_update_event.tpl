<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->

<section class="firstElement lastElement">
    {if !empty($error)}
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
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event">{$event->getDescription()}</textarea>

                    <label for="Date" class="span6">Date format:</label><p class="span6">YYYY-mm-dd</p>

                    <label for="Date" class="span6" placeholder="Starting date">Starting date:</label>
                    <input type="date" class="span6" name="startDate" value="{$event->getStartingDate()}">

                    <label for="Date" class="span6">Ending date:</label>
                    <input type="date" class="span6" name="endDate" value="{$event->getEndingDate()}">

                    <label for="Time" class="span6">Starting time:</label>
                    <input type="time" class="span6" name="startTime" value="{$event->getStartingTime()}">

                    <label for="Time" class="span6">Ending time:</label>
                    <input type="time" class="span6" name="endTime" value="{$event->getEndingTime()}">
                    <input type="hidden" class="span12" name="eventNo" value="{$event->getNo()}" />
                    <input  type="submit" title="Update event" value="Update" name="update" class="span5">
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
                    <input type="hidden" class="span12" name="eventNo" value="{$filledDatas.eventNo}" />
                    <input  type="submit" title="Update event" value="Update" name="update" class="span5">
                {/if}
                </article>
    {if !empty($filledDatas)}
    	
                    <div class="offset1 span4">
                        {if isset($iterationNumber)}
                            {section loop=$iterationNumber name=slots}
                                {capture name=happeningDate}happeningDate{$iterationNumber[slots]}{/capture}
                                {capture name=slotStartingTime}slotStartingTime{$iterationNumber[slots]}{/capture}
                                {capture name=slotEndingTime}slotEndingTime{$iterationNumber[slots]}{/capture}
                                {capture name=slotNo}slotNo{$iterationNumber[slots]}{/capture}
                                <article class="span12 slot">
                                    <h1>Slot {$iterationNumber[slots]}</h1>
                                    <label for="Date" class="span12">Happening date:</label>
                                    <input type="date" class="span12" name="happeningDate{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.happeningDate})}
                                        value="{$filledDatas.{$smarty.capture.happeningDate}}"
                                            {/if}>
                                    <label for="Date" class="span12">Starting time:</label>
                                    <input type="time" class="span12" name="slotStartingTime{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.slotStartingTime})}
                                        value="{$filledDatas.{$smarty.capture.slotStartingTime}}"
                                            {/if}>
                                    <label for="Date" class="span12">Ending time:</label>
                                    <input type="time" class="span12" name="slotEndingTime{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.slotEndingTime})}
                                        value="{$filledDatas.{$smarty.capture.slotEndingTime}}"
                                            {/if}>
                                            <input type="hidden" class="span12" name="slotNo{$iterationNumber[slots]}"
                                            {if isset($filledDatas.{$smarty.capture.slotNo})}
                                        value="{$filledDatas.{$smarty.capture.slotNo}}"
                                            {/if}>
                                </article>
                            {/section}
                        {/if}
                </div>
            </form>
        
    {/if}
    </article>
    </section>



</section>

        