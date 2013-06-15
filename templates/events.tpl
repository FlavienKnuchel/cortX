<!--
events.tpl

Author : Christophe Rast

Date : 14.6.2013
Description : template of the events page

-->

<section id="event-detail">
    <section id="currentevent">
        <article class="desc_event">
            <h2>getMainTopic Event</h2>
            <p class="date">getStartingDate Event</p>
            <p>getDescription (?) Event</p>
        </article>
        <ol class="slot_event">
            <li class=slot_detail id="slot1">
                <h3>Slot 1</h3>
                <p>Slot 1 Content </p>
            </li>
            <li class=slot_detail id="slot2">
                <h3>Slot 1</h3>
                <p>Slot 1 Content </p>
            </li>
        </ol>
        <article class="speakers_event">
            <h3>Speakers</h3>
            <ul>
                <li><a href="speakers.php">
                        <img src="img/speakers/small/speaker1.jpg"/>
                    </a></li>
                <li><a href="speakers.php">
                        <img src="img/speakers/small/speaker1.jpg"/>
                    </a></li>
                <li><a href="speakers.php">
                        <img src="img/speakers/small/speaker1.jpg"/>
                    </a></li>
                <li><a href="speakers.php">
                        <img src="img/speakers/small/speaker1.jpg"/>
                    </a></li>
            </ul>
        </article>
    </section>
    <section id="oldevent">
        <table>
            <caption><p>Previous Events</p></caption>
            <thead>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <!-- section loop on events -->
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <!-- end section loop -->
            </tbody>
        </table>
    </section>
</section>
