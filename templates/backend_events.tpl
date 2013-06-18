<!--
backend_events.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the events page
-->
        <section id="bk_events">
            <article id="bk_events_list">
                <h2>Events</h2>
                <a href="backend_add_event.php">New event</a>
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        {$event_name} <!-- ATTENTION il faut ajouter boutton modifier et supprimer -- et le bouton modifier envoit sur <a href="backend_update_event.php"> bouton modif </a> -->
                    </li>
                </ul>
                 
            </article>
        