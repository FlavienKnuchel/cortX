<!--
speakers.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 17.6.2013
Description : template of the speaker section

-->
<!-- do a loop on section-->
<section id="speaker_year">
    <article class="title_year row offset2 span8">
        <h2>Speakers {$speakers_year}</h2>
        <p class="description_list_speakers_year">Here is our speakers list of the year {$speakers_year}. Have a look at their profil below</p>
    </article>
       
    <article class="speakers_photo row">
        <ul class="offset2 span8">
            <!-- do a loop on <li> -->
            <li>
                <a href="speaker_profil.php">
                    <p>{$speaker_name}</p>
                </a>
            </li>
        </ul>
    </article>
</section>
