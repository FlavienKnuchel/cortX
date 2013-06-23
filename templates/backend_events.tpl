<!--
backend_events.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the events page
-->
    <div class="row offset2">
        <section id="bk_events" class="span8">
            <article id="bk_events_list">
                <h2>Events</h2>
                <a href="backend_add_event.php">New event</a>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <p>{$event_name}<a href="backend_update_event.php" title="modify"><img  src="./img/modify.png" alt="modify" title="modify" /></a><a href="#" title="delete"><img  src="./img/delete.png" alt="delete" title="delete" /></a></p><!-- ATTENTION il faut ajouter boutton modifier et supprimer -- et le bouton modifier envoit sur <a href="backend_update_event.php"> bouton modif </a> -->
                    </li>
                </ul>
                 
            </article>
        </section>
    </div>