<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->
<div class="row offset2">
    <section id="bk_add_event_form" class="span8">
        <h2>Add an event</h2>
        <form method="post" action="backend_add_event.php">
            <article class="form_bk_add_event">
                <input type="text" name="main_topic_event" placeholder="Main topic of the event" autofocus required>
                <input type="text" name="description_event" placeholder="Description of the event" required>
                <label for="Date">Starting date:</label>
                <input type="date" name="Date" required>
                <label for="Date">Ending date:</label>
                <input type="date" name="Date" required>
                <label for="Date">Starting time:</label>
                <input type="time" name="Time" required>
                <label for="Date">Ending time:</label>
                <input type="time" name="Time" required>
                <label for="Date">Location:</label>
                <input type="text" name="Location name" placeholder="Location name" required>
                <input type="text" name="Address" placeholder="Address" required>
                <input type="text" name="Town" placeholder="Town" required>
                <input type="text" name="Country" placeholder="Country" required>
            </article>
            <article class="bk_slot">
                <input type="add" name="Add" value="Add" alt="Add the slot">                        
                <label for="Date">Starting date:</label>
                <input type="date" name="Date" required>
                <label for="Date">Ending date:</label>
                <input type="date" name="Date" required>
                <label for="Date">Starting time:</label>
                <input type="time" name="Time" required>
                <label for="Date">Ending time:</label>
                <input type="time" name="Time" required>
                <input type="delete" name="Delete" value="Delete" alt="Delete this slot">
                            
                    <!-- ATTENTION il faut encore ajouter les speakers de l'evenement !! -->
                    
                            
                <input type="create" name="Create" value="Create" alt="Create this slot">
            </article>
        </form>
    </section>
</div>
        