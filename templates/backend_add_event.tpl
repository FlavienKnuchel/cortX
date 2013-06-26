<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->
<section class="firstElement">
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
{if !empty($filledDatas)}
    <section class="row">
        <article class="offset2 span8">
            <h1>Add an event</h1>
            <form method="post" action="backend_add_event.php?create=true">
                <article class="span5">
                    
                    <label for="main_topic_event" class="span1">Main topic of the event</label>
                    <input type="text" class="span1" name="mainTopic" placeholder="Main topic of the event" autofocus {if isset($filledDatas.mainTopic)}value="{$filledDatas.mainTopic}"{/if}>
                    
                    <label for="description_event" class="span1">Description of the event</label>
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event">{if isset($filledDatas.description)}{$filledDatas.description}{/if}</textarea>

                    <label for="Date" class="span1">date Format:</label><p>YYYY-mm-dd</p>


                    <label for="Date" class="span1">Starting date:</label>
                    <input type="date" class="span1" name="startDate" {if isset($filledDatas.startDate)}value="{$filledDatas.startDate}"{/if}>

                    <label for="Date" class="span1">Ending date:</label>
                    <input type="date" class="span1" name="endDate" {if isset($filledDatas.endDate)}value="{$filledDatas.endDate}"{/if}>

                    <label for="Time" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="startTime" {if isset($filledDatas.startTime)}value="{$filledDatas.startTime}"{/if}>

                    <label for="Time" class="span1">Ending time:</label>
                    <input type="time" class="span1" name="endTime" {if isset($filledDatas.endTime)}value="{$filledDatas.endTime}"{/if}>

                    <label for="Location" class="span1">Location:</label>
                    <input type="text" class="span1" name="location" placeholder="Location name" {if isset($filledDatas.location)}value="{$filledDatas.location}"{/if}>

                    <label for="Address" class="span1">Address:</label>
                    <input type="text" class="span1" name="address" placeholder="Address"{if isset($filledDatas.address)}value="{$filledDatas.address}"{/if}>

                    <label for="Town" class="span1">Town:</label>
                    <input type="text" class="span1" name="city" placeholder="Town" {if isset($filledDatas.city)}value="{$filledDatas.city}"{/if}>

                    <label for="Country" class="span1">Country:</label>
                    <input type="text" class="span1" name="country" placeholder="Country"{if isset($filledDatas.country)}value="{$filledDatas.country}"{/if}>
                </article>
            <h2>Add slot
                <div class="button" id="buttonPlus">
                    <a  title="Create a new event" href="backend_add_event.php?addSlot=true">+</a>
                </div></h2>



                    {if isset($iterationNumber)}
                        {section loop=$iterationNumber name=slots}
                <article class="span3">
                            <label for="Date" class="span1">Happening date:</label>
                    {capture name=happeningDate}happeningDate{$iterationNumber[slots]}{/capture}
                    {capture name=slotStartingTime}slotStartingTime{$iterationNumber[slots]}{/capture}
                    {capture name=slotEndingTime}slotEndingTime{$iterationNumber[slots]}{/capture}
                            <input type="date" class="span1" name="happeningDate{$iterationNumber[slots]}"
                                   {if isset($filledDatas.{$smarty.capture.happeningDate})}
                                    value="{$filledDatas.{$smarty.capture.happeningDate}}"
                                    {/if}>
                            <label for="Date" class="span1">Starting time:</label>
                            <input type="time" class="span1" name="slotStartingTime{$iterationNumber[slots]}"
                                    {if isset($filledDatas.{$smarty.capture.slotStartingTime})}
                                    value="{$filledDatas.{$smarty.capture.slotStartingTime}}"
                                    {/if}>
                            <label for="Date" class="span1">Ending time:</label>
                            <input type="time" class="span1" name="slotEndingTime{$iterationNumber[slots]}"
                                    {if isset($filledDatas.{$smarty.capture.slotEndingTime})}
                                    value="{$filledDatas.{$smarty.capture.slotEndingTime}}"
                                    {/if}>
                            <!-- mettre un bouton delete (image "delete.png")-->
                </article>
                        {/section}
                    {/if}
                        <input type="submit" title="Create a new event" value="Create">

            </form>
        </article>
    </section>
{else}
    <section class="row">
        <article class="offset2 span8">
            <h1>Add an event</h1>
            <form method="post" action="backend_add_event.php?create=true">
                <article class="span5">

                    <label for="main_topic_event" class="span1">Main topic of the event</label>
                    <input type="text" class="span1" name="mainTopic" placeholder="Main topic of the event" autofocus >

                    <label for="description_event" class="span1">Description of the event</label>
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event"></textarea>

                    <label for="Date" class="span1">date Format:</label><p>YYYY-mm-dd</p>

                    <label for="Date" class="span1" placeholder="Starting date">Starting date:</label>
                    <input type="date" class="span1" name="startDate" >

                    <label for="Date" class="span1">Ending date:</label>
                    <input type="date" class="span1" name="endDate" >

                    <label for="Time" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="startTime" >

                    <label for="Time" class="span1">Ending time:</label>
                    <input type="time" class="span1" name="endTime" >

                    <label for="Location" class="span1">Location:</label>
                    <input type="text" class="span1" name="location" placeholder="Location name" >

                    <label for="Address" class="span1">Address:</label>
                    <input type="text" class="span1" name="address" placeholder="Address">

                    <label for="Town" class="span1">Town:</label>
                    <input type="text" class="span1" name="city" placeholder="Town">

                    <label for="Country" class="span1">Country:</label>
                    <input type="text" class="span1" name="country" placeholder="Country">
                </article>
                <h2>Add slot
                    <div class="button" id="buttonPlus">
                        <a style="width:20px;" title="Create a new event" href="backend_add_event.php?addSlot=true">+</a>
                    </div></h2>

                {if isset($iterationNumber)}
                    {section loop=$iterationNumber name=slots}
                        <article class="span3">
                        <label for="Date" class="span1">Happening date:</label>
                        <input type="date" class="span1" name="happeningDate{$iterationNumber[slots]}">
                        <label for="Date" class="span1">Starting time:</label>
                        <input type="time" class="span1" name="slotStartingTime{$iterationNumber[slots]}">
                        <label for="Date" class="span1">Ending time:</label>
                        <input type="time" class="span1" name="slotEndingTime{$iterationNumber[slots]}">
                        <!-- mettre un bouton delete (image "delete.png")-->
                        </article>
                    {/section}
                {/if}
                <input type="submit" title="Create a new event" value="Create">
            </form>
        </article>
    </section>

{/if}


</section>

        