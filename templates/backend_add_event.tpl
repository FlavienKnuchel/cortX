<!--
backend_add_event.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the page where we can add an event
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span8">
            <h1>Add an event</h1>
            <form method="post" action="backend_add_event.php">
                <article class="span5">
                    
                    <label for="main_topic_event" class="span1">Main topic of the event</label>
                    <input type="text" class="span1" name="main_topic_event" placeholder="Main topic of the event" autofocus required>
                    
                    <label for="description_event" class="span1">Description of the event</label>
                    <textarea class="desc" type="text" name="description_event" placeholder="Description of the event" required></textarea>
                    
                    <label for="Date" class="span1">Starting date:</label>
                    <input type="date" class="span1" name="Date" required>
                    
                    <label for="Date" class="span1">Ending date:</label>
                    <input type="date" class="span1" name="Date" required>
                    
                    <label for="Time" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="Time" required>
                    
                    <label for="Time" class="span1">Ending time:</label>
                    <input type="time" class="span1" name="Time" required>
                    
                    <label for="Location" class="span1">Location:</label>
                    <input type="text" class="span1" name="Location name" placeholder="Location name" required>
                    
                    <label for="Address" class="span1">Address:</label>
                    <input type="text" class="span1" name="Address" placeholder="Address" required>
                    
                    <label for="Town" class="span1">Town:</label>
                    <input type="text" class="span1" name="Town" placeholder="Town" required>
                    
                    <label for="Country" class="span1">Country:</label>
                    <input type="text" class="span1" name="Country" placeholder="Country" required>
                </article>
                
            <h2>Add the slot</h2>
                
                <article class="span3">
                    <!-- mettre un bouton ajouter (image "add.png")-->
                    <label for="Date" class="span1">Starting date:</label>
                    <input type="date" class="span1" name="Date" required>
                    <label for="Date" class="span1">Ending date:</label>
                    <input type="date" class="span1" name="Date" required>
                    <label for="Date" class="span1">Starting time:</label>
                    <input type="time" class="span1" name="Time" required>
                    <label for="Date" class="span1">Ending time:</label>
                    <input type="time" class="span1" name="Time" required>
                   <!-- mettre un bouton delete (image "delete.png")-->
                            
                    <!-- ATTENTION il faut encore ajouter les speakers de l'evenement !! -->
                            
                    <div class="button">
                        <a title="Create a new event" href="#">Create</a>
                    </div>
                </article>
            </form>
        </article>
    </section>
</section>

        