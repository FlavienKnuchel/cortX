<!--/*
 * media.php
 *
 * Author : Knuchel Flavien
 * Date : 25.06.2013
 *
 * Description : talk detail
 */  -->
<div class="firstElement">
{if !empty($error)}
    <section id="row">
        <article class="offset2 span8 badMessage">
            <p>{$error}</p>
        </article>
    </section>
{/if}
{if isset($talk)}
    <section class="row">
        <div class="offset2 span8">

            <div class="span5">
                <h1>{$talk->getVideoTitle()}</h1>
                <p>{$talk->getVideoDescription()}</p>
            </div>
            <div class="span7">
                {$iframeVideo}
            </div>


        </div>
    </section>
{/if}
</div>