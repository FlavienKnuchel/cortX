<!--
backend_events.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the events page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">  
            <h1>Events</h1>
            <a href="backend_add_event.php">New event</a>
            <ul>
                <!-- do a loop on li-->
                <li>
                    <p>{$event_name}
                        <a href="backend_update_event.php" title="modify">
                            <img  src="./img/modify.png" alt="modify" title="modify" /> 
                        </a>
                        <a href="#" title="delete">
                            <img  src="./img/delete.png" alt="delete" title="delete" />
                        </a>
                    </p>
                    <!-- ATTENTION il faut ajouter boutton modifier et supprimer -- et le bouton modifier envoit sur <a href="backend_update_event.php"> bouton modif </a> -->
                </li>
            </ul>     
        </article>
    </section>
</section>
