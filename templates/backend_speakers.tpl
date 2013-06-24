<!--
backend_speakers.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the speakers page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">
            <h1>Speakers</h1>    
                <ul>
                    <!-- do a loop on li-->
                    <li>
                        <p>{$speaker_name}
                            <a href="#" title="modify" class="modify">
                                <img  src="./img/modify.png" alt="modify" title="modify" />
                            </a>
                            <a href="#" title="delete" class="modify">
                                <img  src="./img/delete.png" alt="delete" title="delete" />
                            </a>
                            <!-- ATTENTION ajouter boutton modifier et supprimer-->
                        </p>
                    </li>
                </ul>     
        </article>
        <article class="span3">
            <h2>Add a speaker</h2>
                <form method="POST" action="backend_speakers.php">
                    <input class="span1" type="text" name="Lastname" placeholder="Your name" autofocus required>
                    <input class="span1" type="text" name="Firstname" placeholder="Your firstname" required>
                    <label class="span1" for="Date">Date of birth:</label>
                    <input class="span1" type="date" name="Date" required>
                    <input class="span1" type="text" name="Adress" placeholder="Your adress" required>
                    <input  class="span1" type="text" name="Town" placeholder="Your town" required>
                    <input  class="span1" type="text" name="Country" placeholder="Your country" required>
                    <input  class="span1" type="tel" name="Phone" placeholder="Your phone number" required>
                    <input  class="span1" type="email" name="Email" placeholder="Your email" required autocomplete>
                    <p><textarea type="text" name="Description" placeholder="Description" required></textarea></p>
                </form>
        </article>
    </section>
</section>


