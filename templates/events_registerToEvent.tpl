<!--
events_registerToEvent.tpl

Author : Christophe Rast, Noémie Sandoz and Andréane Mercier

Date : 17.6.2013
Description : template of the registration to an event

-->

{if isset($userCameFrom)}
    <div class="row">
        <div class="button_back offset2"><a title="go back to last page" href='{$userCameFrom}&fromInsc=true'>Back</a></div>
    </div>
{else}
    <div class="row">
        <div class="button_back offset2"><a title="go back to events page" href='events.php'>Back</a></div>
    </div>
{/if}
{if !empty($error)}
    <div id="row">
        <p class="offset2 span8 goodMessage">{$error}</p>
    </div>

{else}
{/if}
<section class="row">
    <div class="row">
        <h2 class="offset2 span8">Apply to this event!</h2>
    </div>

    {if empty($error)}
    <div class="row">
        <p class="subtitle offset2 span8">Fill in your informations to create your registration</p>
    </div>
    {/if}
    <form method="post" action="inscription.php">

        {if !$loggedin}
            {if isset($filledDatas)}
                <div class="row">
                    <article class="coordonees offset2 span8">
                        <p>
                            <input type="text" name="lastname" placeholder="Your last name" autofocus
                                   value='{if isset($filledDatas.lastname)}{$filledDatas.lastname}{/if}'>
                            <input type="text" name="firstname" placeholder="Your firstname" required
                                   value='{if isset($filledDatas.firstname)}{$filledDatas.firstname}{/if}'>
                            <label for="date">Date of birth:</label>
                            <input type="date" name="date" placeholder="YYYY-MM-DD"
                                   value='{if isset($filledDatas.date)}{$filledDatas.date}{/if}'>
                        </p>
                        <p>
                            <input type="text" name="address" placeholder="Your address" required
                                   value='{if isset($filledDatas.address)}{$filledDatas.address}{/if}'>
                            <input type="text" name="city" placeholder="Your town" required
                                   value='{if isset($filledDatas.city)}{$filledDatas.city}{/if}'>
                            <input type="text" name="country" placeholder="Your country" required
                                   value='{if isset($filledDatas.country)}{$filledDatas.country}{/if}'>
                        </p>
                        <p>
                            <input type="email" name="email" placeholder="Your email" required autocomplete
                                   value='{if isset($filledDatas.email)}{$filledDatas.email}{/if}'>
                            <input type="tel" name="phone" placeholder="Your phone number" required
                                   value='{if isset($filledDatas.phone)}{$filledDatas.phone}{/if}'>
                            <input type="text" name="username" placeholder="Your username(login)" required
                                   value='{if isset($filledDatas.username)}{$filledDatas.username}{/if}'>
                            <input type="password" name="password" placeholder="Choose a password" required>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                        </p>
                    </article>
                </div>
            {else}
                <div class="row">
                    <article class="coordonees offset2 span8">
                        <p>
                            <input type="text" name="lastname" placeholder="Your last name" autofocus required>
                            <input type="text" name="firstname" placeholder="Your firstname" required>
                            <label for="date">Date of birth:</label>
                            <input type="date" name="date" placeholder="YYYY-MM-DD">
                        </p>
                        <p>
                            <input type="text" name="address" placeholder="Your adress" required>
                            <input type="text" name="city" placeholder="Your town" required>
                            <input type="text" name="country" placeholder="Your country" required>
                        </p>
                        <p>
                            <input type="email" name="email" placeholder="Your email" required autocomplete>
                            <input type="tel" name="phone" placeholder="Your phone number" required>
                            <input type="text" name="username" placeholder="Your username(login)" required>
                            <input type="password" name="password" placeholder="Choose a password" required>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                        </p>
                    </article>
                </div>
            {/if}

        {/if}

        {if isset($filledDatas) && !empty($filledDatas)}
            <div class="row">
                <article class="domain offset2 span8">
                    <label for="type">What do you do?</label>
                    <input type="text" name="type" placeholder="Your activity domain" required
                           value='{if isset($filledDatas.type)}{$filledDatas.type}{/if}'>
                    <input type="text" name="typeDescription" placeholder="Your role in this domain" required
                           value='{if isset($filledDatas.typeDescription)}{$filledDatas.typeDescription}{/if}'>
                </article>
            </div>
            <div class="row">
                <article class="motivation offset2 span6">
                    <p class="subtitle">Explain us your motivations</p>
                    <textarea type="text" name="motivation" class="big" required>
                        {if isset($filledDatas.lastname)}{$filledDatas.lastname}{/if}
                    </textarea>
                </article>
                <article class="span2">
                    <p>
                        <label for="Keyword" title="describe your interests in 3 words">Keywords:</label>
                        <input type="text" name="keyword1" placeholder="Keyword"
                               value='{if isset($filledDatas.keyword1)}{$filledDatas.keyword1}{/if}'>
                        <input type="text" name="keyword2" placeholder="Keyword"
                               value='{if isset($filledDatas.keyword2)}{$filledDatas.keyword2}{/if}'>
                        <input type="text" name="keyword3" placeholder="Keyword"
                               value='{if isset($filledDatas.keyword3)}{$filledDatas.keyword3}{/if}'>
                    </p>
                </article>
            </div>
            <div class="row">
                <div class="offset2 span8">
                    <input type="submit" name="save" value="Save" alt="Save and edit later" title="Save and edit later">
                    <input type="submit" name="send" value="Send" alt="Submit your registration request"
                           title="Submit your registration request">
                </div>
            </div>
            
        {else}
            <div class="row">
                <article class="domain offset2 span8">
                    <label for="type">What do you do?</label>
                    <input type="text" name="type" placeholder="Your activity domain" required>
                    <input type="text" name="typeDescription" placeholder="Your role in this domain" required>
                </article>
            </div>
            <div class="row">
                
                <article class="offset2 span6 motivation">
                    <p class="subtitle">Explain us your motivations</p>
                    <textarea type="text" name="motivation" class="big" required></textarea>
                </article>
                <article class="span2 keywords">
                    <p>
                        <label for="Keyword" title="describe your interests in 3 words"><p>Keywords:</p></label>
                        <input type="text" name="keyword1" placeholder="Keyword" >
                        <input type="text" name="keyword2" placeholder="Keyword" >
                        <input type="text" name="keyword3" placeholder="Keyword" >
                    </p>
                </article>
             
            </div>
            <div class="row">
                <div class="offset2 span8">
                    <input type="submit" name="save" value="Save" alt="Save and edit later" title="Save and edit later">
                    <input type="submit" name="send" value="Send" alt="Submit your registration request"
                               title="Submit your registration request">
                    </div>
                </div>
               
        {/if}
    </form>
</section>