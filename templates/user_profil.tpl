<!--
user_profil.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user profil

-->
<section id="registerToEvent">
        <h2>My profil</h2>
        <h3>My co-ordinates</h3>
        <form method="post" action="register.php">
            <article class="coordonees">
                <input type="text" name="Lastname" placeholder="Your name" autofocus required>
                <input type="text" name="Firstname" placeholder="Your firstname" required>
                <label for="Date">Date of birth:</label>
                <input type="date" name="Date" required>
                <input type="text" name="Adress" placeholder="Your adress" required>
                <input type="text" name="Town" placeholder="Your town" required>
                <input type="text" name="Country" placeholder="Your country" required>
                <input type="email" name="Email" placeholder="Your email" required autocomplete>
                <input type="tel" name="Phone" placeholder="Your phone number" required>
                <input type="password" name="Password" placeholder="Choose a password" required>
                <input type="password" name="ConfirmPassword" placeholder="Confirm your password" required>
            </article>
            
        </form>
</section>