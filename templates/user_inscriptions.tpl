<!--
user_inscriptions.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user inscription

-->

<section class="firstElement row">
    <article class="offset2 span8">
    {if $loggedin}
        {if $participant->getStatus()}
            {if !empty($arrayReg) }
                {section name=loopReg loop=$arrayReg}
                    {if $arrayReg[loopReg]['registration']->getStatus() == 'Pending'}
                        <article class="form_inscr">

                            <h2>You are applying to {$arrayReg[loopReg]['event']->getMainTopic()}</h2>

                            <form method="POST" action="?id={$smarty.section.loopReg.index}">
                                <label for="type">Your activity domain</label>
                                <input type="text" name="type" placeholder="Your activity domain"
                                       value='{$arrayReg[loopReg]['registration']->getType()}'>
                                <label for="typeDescription">Your role in this domain</label>
                                <input type="text" name="typeDescription"
                                       value="{$arrayReg[loopReg]['registration']->getTypeDescription()}">
                                <label for="motivation" class="subtitle">Explain us your motivations</label>
                                <textarea name="motivation" title="motivation" class="big" spellcheck>
                                    {if isset($arrayReg[loopReg]['motivation'])}
                                        {$arrayReg[loopReg]['motivation']->getText()}
                                    {/if}</textarea>
                                <label for="Keyword" title="Describe youself in 3 words">Keywords that describes you the best</label>
                                <input type="text" name="Keyword1" value="
                                       {if isset($arrayReg[loopReg]['arrayKW'][0])}
                                           {$arrayReg[loopReg]['arrayKW'][0]->getValue()}
                                       {/if}" >
                                <input type="text" name="Keyword2" value="
                                       {if isset($arrayReg[loopReg]['arrayKW'][1])}
                                           {$arrayReg[loopReg]['arrayKW'][1]->getValue()}
                                       {/if}" >
                                <input type="text" name="Keyword3" value="
                                       {if isset($arrayReg[loopReg]['arrayKW'][2])}
                                           {$arrayReg[loopReg]['arrayKW'][2]->getValue()}
                                       {/if}" >

                                <!--<input type="submit" name="preview" value="preview of the badge" alt="preview of the badge">-->
                                <input type="submit" name="Save" value="Save" alt="Save and edit later">
                                <input type="submit" name="Send" value="Send" alt="Submit your registration request">
                            </form>
                        </article>
                    {elseif ($arrayReg[loopReg]['registration']->getStatus() == 'Sent' || $arrayReg[loopReg]['registration']->getStatus() == 'Accepted' || $arrayReg[loopReg]['registration']->getStatus() == 'Rejected')}
                        <article class="form_closed">
                            <p class="subtitle">You applied to</p> 
                            <h2>{$arrayReg[loopReg]['event']->getMainTopic()}</h2>
                            <p class="subtitle">Satus of your registration : <strong>{$arrayReg[loopReg]['registration']->getStatus()}</strong></p>
                            <p class="label" >Your activity domain:</p>
                            <p class="activitydomain">{$arrayReg[loopReg]['registration']->getType()}</p>
                            <p class="label">Your role in this domain</p>
                            <p class="roledomain">{$arrayReg[loopReg]['registration']->getTypeDescription()}</p>
                            <p class="label">Motivation:</p>
                            <p class="motivation">
                                {if isset($arrayReg[loopReg]['motivation'])}
                                    {$arrayReg[loopReg]['motivation']->getText()}
                                {/if}</p>
                            <p class="label">Keywords:</p>
                            <p class="keyword">
                                {if isset($arrayReg[loopReg]['arrayKW'][0])}
                                    {$arrayReg[loopReg]['arrayKW'][0]->getValue()}
                                {/if}</p>
                            <p class="keyword">
                                {if isset($arrayReg[loopReg]['arrayKW'][1])}
                                    {$arrayReg[loopReg]['arrayKW'][1]->getValue()}
                                {/if}</p>
                            <p class="keyword">
                                {if isset($arrayReg[loopReg]['arrayKW'][2])}
                                    {$arrayReg[loopReg]['arrayKW'][2]->getValue()}
                                {/if}</p>
                        </article>
                    {/if}
                {/section}
            {else}
                <section class="row">
                    <article class="offset2 span8 badMessage">
                        <p>You Don't have any pending or sent registrations.</p>
                    </article>
                </section>
            {/if}
            {if !empty($arrayOldReg) }
                <article class="offset7 span3">
                    <h1>Previous registrations</h1>
                    {section name=loopOldReg loop=$arrayOldReg}
                        <article class="form_closed">
                            <h3>{$arrayOldReg[loopOldReg]['event']->getMainTopic()}</h3>
                            <p class="subtitle">You can view your appliance but cannot update it anymore.</p>
                            <p class="label" >Your activity domain:</p>
                            <p class="activitydomain">
                                {if isset($arrayOldReg[loopOldReg]['oldReg'])}
                                    {$arrayOldReg[loopOldReg]['oldReg']->getType()}
                                {/if}
                            </p>
                            <p class="label">Your role in this domain</p>
                            <p class="roledomain">
                                {if isset($arrayOldReg[loopOldReg]['oldReg'])}
                                    {$arrayOldReg[loopOldReg]['oldReg']->getTypeDescription()}
                                {/if}
                            </p>
                            <p class="label">Motivation:</p>
                            <p class="motivation">
                                {if !empty($arrayOldReg[loopOldReg]['motivation'])}
                                    {$arrayOldReg[loopOldReg]['motivation']->getText()}
                                {/if}
                            </p>
                            <p class="label">Keywords:</p>
                            <p class="keyword">
                                {if isset($arrayOldReg[loopOldReg]['arrayKW'])}
                                    {$arrayOldReg[loopOldReg]['arrayKW'][0]->getValue()}
                                {/if}
                            </p>
                            <p class="keyword">
                                {if isset($arrayOldReg[loopOldReg]['arrayKW'])}
                                    {$arrayOldReg[loopOldReg]['arrayKW'][1]->getValue()}
                                {/if}
                            </p>
                            <p class="keyword">
                                {if isset($arrayOldReg[loopOldReg]['arrayKW'])}
                                    {$arrayOldReg[loopOldReg]['arrayKW'][2]->getValue()}
                                {/if}
                            </p>
                        </article>

                    {/section}
                </article>
            {/if}
        {else}
            <p class="error_msg" {$participant->getMessage()}</p>
        {/if}
    {else}
        <p class="error_msg">
            You are not logged in, you cannot access this content.
        </p>
    {/if}
        </article>
    </section>

