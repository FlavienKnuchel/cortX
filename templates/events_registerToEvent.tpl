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
    <section id="row">
        <article class="offset2 span8 badMessage">
            <p>{$error}</p>
        </article>
    </section>
{/if}
<div class="row lastElement">
    <section id="event_registration" class="offset2 span8">
            <h2 class="span12">Apply to this event!</h2>
        {if empty($error)}
                <p class="span12">Fill in your informations to create your registration</p>
        {/if}
        <form method="post" action="inscription.php">
            {if !$loggedin}
                {if isset($filledDatas)}
                        <article class="coordonees span12">
                                <label for="name" class="span3">Last name</label>
                                <input type="text" class="span3" name="lastname" placeholder="Your last name" autofocus
                                       value='{if isset($filledDatas.lastname)}{$filledDatas.lastname}{/if}'>
                                <label for="firstname" class="span3">First name</label>
                            <input type="text" class="span3" name="firstname" placeholder="Your firstname" required
                                       value='{if isset($filledDatas.firstname)}{$filledDatas.firstname}{/if}'>
                             </article>
                            <article class="coordonees span12">
                                <label for="date" class="span5">Date of birth (Year-month-day)</label>
                                <input type="date" class="span3" name="date" placeholder="YYYY-MM-DD"
                                       value='{if isset($filledDatas.date)}{$filledDatas.date}{/if}'>
                            </article>
                            <article class="coordonees span12">
                                <label for="address" class="span3">Address</label>
                                <input type="text" class="span3" name="address" placeholder="Your address" required
                                       value='{if isset($filledDatas.address)}{$filledDatas.address}{/if}'>
                                <label for="city" class="span3">City</label>
                                <input type="text" class="span3" name="city" placeholder="Your town" required
                                       value='{if isset($filledDatas.city)}{$filledDatas.city}{/if}'></article>
            <article class="coordonees span12">
                                <label for="country" class="span3">Country</label>
                                <input type="text" class="span3" name="country" placeholder="Your country" required
                                       value='{if isset($filledDatas.country)}{$filledDatas.country}{/if}'>
                            
                         
                                <label for="email" class="span3">Email</label>
                                <input type="email" class="span3" name="email" placeholder="Your email" required autocomplete
                                       value='{if isset($filledDatas.email)}{$filledDatas.email}{/if}'></article>
            <article class="coordonees span12">
                                <label for="phone" class="span3">Phone</label>
                                <input type="tel" class="span3" name="phone" placeholder="Your phone number" required
                                       value='{if isset($filledDatas.phone)}{$filledDatas.phone}{/if}'></article>
            <article class="coordonees span12">
                                <label for="username" class="span3">Username</label>
                                <input type="text" class="span3" name="username" placeholder="Your username(login)" required
                                       value='{if isset($filledDatas.username)}{$filledDatas.username}{/if}'></article>
            <article class="coordonees span12">
                                <label for="password" class="span3">Password</label>
                                <input type="password" class="span3" name="password" placeholder="Choose a password" required>
                </article>
            <article class="coordonees span12">
                                <input type="password" class="margin span3" name="confirmPassword" placeholder="Confirm your password" required>
                                <input type="hidden" name="creatingAccount" value="creatingAccount">
                       
                        </article>
                {else}
                        <article class="coordonees span12">
                
                                <label for="lastname" class="span3">Last name</label>
                                <input type="text" class="span3" name="lastname" placeholder="Your last name" autofocus required>
                                <label for="firstname" class="span3">First name</label>
                                <input type="text" class="span3" name="firstname" placeholder="Your firstname" required>
                            </article>
                        <article class="coordonees span12">
                                <label for="date" class="span5">Date of birth (Year-month-day)</label>
                                <input type="date" class="span5" name="date" placeholder="YYYY-MM-DD">
                            </article>
                            <article class="coordonees span12">
                                <label for="address" class="span3">Address</label>
                                <input type="text" class="span3" name="address" placeholder="Your adress" required>
                                <label for="city" class="span3">City</label>
                                <input type="text" class="span3" name="city" placeholder="Your town" required>
                                </article>
            <article class="coordonees span12">
                                <label for="country" class="span3">Country</label>
                                <input type="text" class="span3" name="country" placeholder="Your country" required>
                            
                            
                                <label for="email" class="span3">Email</label>
                                <input type="email" class="span3" name="email" placeholder="Your email" required autocomplete>
                </article>
            <article class="coordonees span12">
                                <label for="phone" class="span3">Phone</label>
                                <input type="tel" class="span3" name="phone" placeholder="Your phone number" required>
                </article>
            <article class="coordonees span12">
                                <label for="username" class="span3">Username</label>
                                <input type="text" class="span3" name="username" placeholder="Your username(login)" required>
                </article>
            <article class="coordonees span12">
                                <label for="password" class="span3">Password</label>
                                <input type="password" class="span3" name="password" placeholder="Choose a password" required>
                </article>
            <article class="coordonees span12">
                                <input type="password" name="confirmPassword" class="span3 margin" placeholder="Confirm your password" required>
                                <input type="hidden" name="creatingAccount" value="creatingAccount">
                        
                        </article>
                {/if}
            {/if}
                {if isset($filledDatas) && !empty($filledDatas)}
                        <article class="coordonees span12 espace">
                            <label for="type" class="span7 activity">Your activity domain</label>
                            <input type="text" class="span4" name="type" placeholder="Your activity domain" required
                                   value='{if isset($filledDatas.type)}{$filledDatas.type}{/if}'>
                            </article>
            
                            <article class="coordonees span12">
                            
                                <label for="typeDescription" class="span7 activity">Your role in this domain</label>
                            <input type="text" name="typeDescription" class="span4" placeholder="Your role in this domain" required
                                   value='{if isset($filledDatas.typeDescription)}{$filledDatas.typeDescription}{/if}'>
                        </article>
                        <article class="motivation span12">
                            <h2>Explain us your motivations</h2>
                            <textarea type="text" name="motivation" class="big" required>{if isset($filledDatas.motivation)}{$filledDatas.motivation}{/if}</textarea>
                        </article>
                        <article class="span12 keywords">
                                <label for="keywords" title="describe your interests in 3 words">Keywords describing you</label>
                            <p>
                                <input type="text" class="span3" name="keyword1" placeholder="Keyword"
                                       value='{if isset($filledDatas.keyword1)}{$filledDatas.keyword1}{/if}'>
                                <input type="text" class="span3" name="keyword2" placeholder="Keyword"
                                       value='{if isset($filledDatas.keyword2)}{$filledDatas.keyword2}{/if}'>
                                <input type="text" class="span3" name="keyword3" placeholder="Keyword"
                                       value='{if isset($filledDatas.keyword3)}{$filledDatas.keyword3}{/if}'>
                                </p>
                        </article>
                        <div class="span12">
                            <p class="inscription_button">
                            <input type="submit" name="save" value="Save" alt="Save and edit later" title="Save and edit later">
                            <input type="submit" name="send" value="Send" alt="Submit your registration request"
                                   title="Submit your registration request"></p>
                    </div>

                {else}
                        <article class="coordonees span12 espace">
                                <label for="type" class="span7 activity">Your activity domain</label>
                                <input type="text" class="span4" name="type" placeholder="Your activity domain" required>
                            </article>
            <article class="coordonees span12">
                            
                                <label for="typeDescription" class="span7 activity">Your role in this domain</label>
                                <input type="text" class="span4" name="typeDescription" placeholder="Your role in this domain" required>
                        </article>

                        <article class="span12 motivation">
                            <h2>Explain us your motivations</h2>
                            <textarea type="text" name="motivation" class="big" required></textarea>
                        </article>
                        <article class="span12 keywords">
                            <p>
                                <label for="keyword" class="span12" title="describe your interests in 3 words">Keywords describing you</label>
                                <p>
                                    <input type="text" class="span3" width="100px;" name="keyword1" placeholder="Keyword" >
                                <input type="text" class="span3" name="keyword2" placeholder="Keyword" >
                                <input type="text" class="span3" name="keyword3" placeholder="Keyword" >
                                    
                            </p>
                        </article>

                        <div class="span12">
                            <p class="inscription_button">
                            <input type="submit" name="save" value="Save" alt="Save and edit later" title="Save and edit later">
                            <input type="submit" name="send" value="Send" alt="Submit your registration request" title="Submit your registration request">
                            </p>
                        </div>

                {/if}
        </form>
    </section>
</div>