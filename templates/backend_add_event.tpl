<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->
<section class="firstElement">
    {if !empty($error)}
        <section id="row">
            <article class="offset2 span8 badMessage">
                <h1>{$error}</h1>
            </article>
        </section>
    {/if}


    <section class="row">
        <article class="offset2 span8">
            <h1>Add an event</h1>
            <form method="post" action="backend_add_event.php?create=true">
                <article class="span5">
                    
                    <label for="main_topic_event" class="span1">Main topic of the event</label>
                    <input type="text" class="span1" name="mainTopic" placeholder="Main topic of the event" autofocus>
                    
                    <label for="description_event" class="span1">Description of the event</label>
                    <textarea class="desc" type="text" name="description" placeholder="Description of the event"></textarea>
                    
                    <label for="Date" class="span1">Starting date:</label>
                    <input type="date" class="span1" name="startDate" >

                    <label for="Date" class="span1">Ending date:</label>
                    <input type="date" class="span1" name="endDate" >

                    <label for="Time" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="stratTime" >

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
                <div class="button" style="width:26px;padding-left:5px;">
                    <a style="width:20px;" title="Create a new event" href="backend_add_event.php?addSlot=true">+</a>
                </div></h2>

                <article class="span3">
                    <input type="hidden" name ="slot1" value="slot1">
                    <label for="Date" class="span1">Happening date:</label>
                    <input type="date" class="span1" name="happeningDate">
                    <label for="Date" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="slotStartingTime">
                    <label for="Date" class="span1">Ending time:</label>
                    <input type="time" class="span1" name="slotEndingTime">
                   <!-- mettre un bouton delete (image "delete.png")-->

                    <!-- ATTENTION il faut encore ajouter les speakers de l'evenement !! -->

                        <input type="submit" title="Create a new event" value="Create"></a>
                </article>
            </form>
        </article>
    </section>
</section>

        