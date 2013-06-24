<!--
backend_speakers.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the speakers page
-->
<div class="row">
    <section id="bk_speakers" class="offset2 span4">
        <article class="list">
            <h2>Speakers</h2>    
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <p>{$speaker_name}</p><a href="#" title="modify"><img  src="./img/modify.png" alt="modify" title="modify" /></a><a href="#" title="delete"><img  src="./img/delete.png" alt="delete" title="delete" /></a> <!-- ATTENTION ajouter boutton modifier et supprimer-->
                    </li>
                </ul>     
        </article>
    </section>
    <section id="add_speaker" class="span4 form">
        <article>
            <h2>Add a speaker</h2>
                <form method="POST" action="backend_speakers.php">
                    <input type="text" name="Lastname" placeholder="Your name" autofocus required>
                    <input type="text" name="Firstname" placeholder="Your firstname" required>
                    <label for="Date">Date of birth:</label>
                    <input type="date" name="Date" required>
                    <input type="text" name="Adress" placeholder="Your adress" required>
                    <input type="text" name="Town" placeholder="Your town" required>
                    <input type="text" name="Country" placeholder="Your country" required>
                    <input type="tel" name="Phone" placeholder="Your phone number" required>
                    <input type="email" name="Email" placeholder="Your email" required autocomplete>
                    <input type="text" name="Description" placeholder="Description" required>
                </form>
        </article>
    </section>
</div>

