<!--
user_inscriptions.tpl

Author : Noémie Sandoz et Andréane Mercier

Date : 18.6.2013
Description : template of the user inscription

-->

<section class="firstElement row">
    {if isset($errorSendMotiv)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <h1>Error!</h1>
                <p>You did not fill you motivation before sending it. Please do so, and try again.</p>
            </article>
        </section>
    {/if}
    {if isset($errorSendKW)}
        <section class="row">
            <article class="offset2 span8 badMessage">
                <h1>Error!</h1>
                <p>You did not fill all the keywords fields. Please do so, and try again.</p>
            </article>
        </section>
    {/if}
    <section class="firstElement">
        <article class="offset2 span8">
            {if $loggedin}
                {if $participant->getStatus()}
                    {if !empty($arrayReg) }
                        {section name=loopReg loop=$arrayReg}
                            {if $arrayReg[loopReg]['registration']->getStatus() == 'Pending'}
                                <article class="span12">

                                    <h1>You are applying to </h1>
                                    <h2>{$arrayReg[loopReg]['event']->getMainTopic()}</h2>

                                    <form method="POST" action="">
                                        <label for="type">Your activity domain</label>
                                        <p>{$arrayReg[loopReg]['registration']->getType()}</p>
                                        <label for="typeDescription">Your role in this domain</label>
                                        <p>{$arrayReg[loopReg]['registration']->getTypeDescription()}</p>
                                        <label for="motivation" class="subtitle">Explain us your motivations</label>
                                        <textarea name="motivation" title="motivation" class="big" spellcheck>{if isset($arrayReg[loopReg]['motivation'])}{$arrayReg[loopReg]['motivation']}{/if}</textarea>
                                        <label for="Keyword" title="Describe youself in 3 words">Keywords that describes you the best</label>
                                        <p class="span12">
                                            <input type="text" name="Keyword1" value="{if isset($arrayReg[loopReg]['arrayKW'][0])}{$arrayReg[loopReg]['arrayKW'][0]->getValue()}{/if}" >
                                            <input type="text" name="Keyword2" value="{if isset($arrayReg[loopReg]['arrayKW'][1])}{$arrayReg[loopReg]['arrayKW'][1]->getValue()}{/if}" >
                                            <input type="text" name="Keyword3" value="{if isset($arrayReg[loopReg]['arrayKW'][2])}{$arrayReg[loopReg]['arrayKW'][2]->getValue()}{/if}" ></p>

                                        <!--<input type="submit" name="preview" value="preview of the badge" alt="preview of the badge">-->
                                        <p class="inscription_button"><input type="hidden" name="value" value="{$smarty.section.loopReg.index}">
                                            <input type="submit" name="Save" value="Save" alt="Save and edit later">
                                            <input type="submit" name="Send" value="Send" alt="Submit your registration request"></p>
                                    </form>
                                </article>
                                {elseif ($arrayReg[loopReg]['registration']->getStatus() == 'Sent' || 
$arrayReg[loopReg]['registration']->getStatus() == 'Accepted' || 
$arrayReg[loopReg]['registration']->getStatus() == 'Rejected')}
                                <article class="span12">
                                    <h1 class="subtitle">You applied to</h1> 
                                    <h2>{$arrayReg[loopReg]['event']->getMainTopic()}</h2>
                                    <p class="subtitle">Satus of your registration : <strong>{$arrayReg[loopReg]['registration']->getStatus()}</strong></p>
                                    <p class="label" >Your activity domain:</p>
                                    <p class="activitydomain">{$arrayReg[loopReg]['registration']->getType()}</p>
                                    <p class="label">Your role in this domain</p>
                                    <p class="roledomain">{$arrayReg[loopReg]['registration']->getTypeDescription()}</p>
                                    <p class="label">Motivation:</p>
                                    <p class="motivation">
                                        {if isset($arrayReg[loopReg]['motivation'])}
                                            {$arrayReg[loopReg]['motivation']}
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
                        <article class="offset2 span8">
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

