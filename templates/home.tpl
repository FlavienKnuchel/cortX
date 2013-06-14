/*
* home.tpl
*
* Author : Christophe Rast
* Date : 14.6.2013
*
* Description : Basic structure of the homepage
*
*
*/
<section>
    <section id="nextevent">
        <article>
            <h2>{$NextEventName}</h2>
            <p>{$NextEventDesc}</p>
            <input type="button" title="Details"/>
        </article>
        <article>
            <h2>Guests</h2>
            <ul>
                <li>
                    <img src="img/thumbs/guests/guest1.jpg" alt="Guest" />
                </li>
                <li>
                    <img src="img/guests/guest2.jpg" alt="Guest" />
                </li>
                <li>
                    <img src="img/guests/guest3.jpg" alt="Guest" />
                </li>
                <li>
                    <img src="img/guests/guest4.jpg" alt="Guest" />
                </li>
            </ul>
        </article>
    </section>
    <article id="videotape">
        
        <div class="video_home">
            <a href="#">
                <img src="img/thumbs/video/video1.jpg" alt="Miniature video"/>
            </a>
        </div>
        <div class="video_home">
            <a href="#">
                <img src="img/thumbs/video/video1.jpg" alt="Miniature video"/>
            </a>
        </div>
        <div class="video_home">
            <a href="#">
                <img src="img/thumbs/video/video1.jpg" alt="Miniature video"/>
            </a>
        </div>
        <div class="video_home">
            <a href="#">
                <img src="img/thumbs/video/video1.jpg" alt="Miniature video"/>
            </a>
        </div>
        <div class="video_home">
            <a href="#">
                <img src="img/thumbs/video/video1.jpg" alt="Miniature video"/>
            </a>
        </div>
        
    </article>
    <article id="socialnet">
    //Insert social networks embed code here
    </article>
</section>
