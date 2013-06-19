<!--
home.tpl

Author : Knuchel Flavien
Date : 19.6.2013

Description : Basic structure of the homepage
-->

<!-- inscription form -->
<form id="inscription-form" action="/" method="post">
    <h3>Inscription for this event</h3>
    <h4>Fill in the form below, and keep an eye on your mailbox!</h4>

<!-- Person infos -->
    <div>
             <label>Firstname: (required)</label>
            <input placeholder="your Firstname" type="text" tabindex="1" required autofocus>
    </div>
    <div>
            <label>Nname: (required)</label>
            <input placeholder="your name" type="text" tabindex="2" required >
    </div>
    <div>
            <label>Date of Birth: (required)</label>
            <input type="date" tabindex="3" required>
    </div>
    <div>
            <label>Email: (required)</label>
            <input placeholder="your email" type="email" tabindex="4" required >
    </div>
    <div>
            <label>Telephone: (required)</label>
            <input placeholder="your phone number" type="tel" tabindex="5" required>
    </div>
    <div>
            <label>Description (optional)</label>
            <input placeholder="Describe yourself" type="text" tabindex="6">
    </div>

    <!-- motivation -->
    <div>
            <label>Motivations: (required)</label>
            <textarea placeholder="Your motivations to come at our TEDx event" tabindex="7" required></textarea>
    </div>

    <!-- keywords -->
    <div>
            <label>Keywords: (optional, describing you)</label>
            <input type="text" placeholder="keyword" tabindex="8" maxlength="20">
            <input type="text" placeholder="keyword" tabindex="9" maxlength="20">
            <input type="text" placeholder="keyword" tabindex="10" maxlength="20">
    </div>

    <!-- validation buttons -->
    <div>
        <button name="Save" type="submit" id="inscription_save">Save (for further edit)</button>
    </div>
    <div>
        <button name="Validate" type="submit" id="inscription_validate">Send Inscription</button>
    </div>
</form>