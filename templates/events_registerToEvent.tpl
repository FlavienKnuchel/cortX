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
<section class="row">
    <div class="offset2 span8">
        <h1>Apply to this event!</h1>
    {if empty($error)}
        <p>Fill in your informations to create your registration</p>
    </div>
    {/if}
    <form method="post" action="inscription.php">

        {if !$loggedin}
            {if isset($filledDatas)}
                <div class="row">
                    <article class="coordonees offset2 span8">
                        <h3>Your co-ordinates</h3>
                        <p>
                            <label for="name">Last name</label>
                            <input type="text" name="lastname" placeholder="Your last name" autofocus
                                   value='{if isset($filledDatas.lastname)}{$filledDatas.lastname}{/if}'>
                            <label for="firstname">First name</label>
                            <input type="text" name="firstname" placeholder="Your firstname" required
                                   value='{if isset($filledDatas.firstname)}{$filledDatas.firstname}{/if}'>
                            <label for="date">Date of birth</label>
                            <input type="date" name="date" placeholder="YYYY-MM-DD"
                                   value='{if isset($filledDatas.date)}{$filledDatas.date}{/if}'>
                        </p>
                        <p>
                            <label for="address">Address</label>
                            <input type="text" name="address" placeholder="Your address" required
                                   value='{if isset($filledDatas.address)}{$filledDatas.address}{/if}'>
                            <label for="city">City</label>
                            <input type="text" name="city" placeholder="Your town" required
                                   value='{if isset($filledDatas.city)}{$filledDatas.city}{/if}'>
                            <label for="country">Country</label>
                            <input type="text" name="country" placeholder="Your country" required
                                   value='{if isset($filledDatas.country)}{$filledDatas.country}{/if}'>
                        </p>
                        <p>
                            <label for="email">Email</label>
                            <input type="email" name="email" placeholder="Your email" required autocomplete
                                   value='{if isset($filledDatas.email)}{$filledDatas.email}{/if}'>
                            <label for="phone">Phone</label>
                            <input type="tel" name="phone" placeholder="Your phone number" required
                                   value='{if isset($filledDatas.phone)}{$filledDatas.phone}{/if}'>
                            <label for="username">Username</label>
                            <input type="text" name="username" placeholder="Your username(login)" required
                                   value='{if isset($filledDatas.username)}{$filledDatas.username}{/if}'>
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="Choose a password" required>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                        </p>
                    </article>
                </div>
            {else}
                <div class="row">
                    <article class="coordonees offset2 span8">
                        <h3>Your co-ordinates</h3>
                        <p>
                            <label for="lastname">Last name</label>
                            <input type="text" name="lastname" placeholder="Your last name" autofocus required>
                            <label for="firstname">First name</label>
                            <input type="text" name="firstname" placeholder="Your firstname" required>


                            <label for="date">Date of birth</label>
                            <input type="date" name="date" placeholder="YYYY-MM-DD">
                        </p>
                        <p>
                            <label for="address">Address</label>
                            <input type="text" name="address" placeholder="Your adress" required>
                            <label for="city">City</label>
                            <input type="text" name="city" placeholder="Your town" required>
                            <label for="country">Country</label>
                            <input type="text" name="country" placeholder="Your country" required>
                        </p>
                        <p>
                            <label for="email">Email</label>
                            <input type="email" name="email" placeholder="Your email" required autocomplete>
                            <label for="phone">Phone</label>
                            <input type="tel" name="phone" placeholder="Your phone number" required>
                            <label for="username">Username</label>
                            <input type="text" name="username" placeholder="Your username(login)" required>
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="Choose a password" required>
                            <input type="password" name="confirmPassword" placeholder="Confirm your password" required>
                        </p>
                    </article>
                </div>
            {/if}

        {/if}

        {if isset($filledDatas) && !empty($filledDatas)}
            <div class="row">
                <article class="offset2 span8">
                    <label for="type">Your activity domain</label>
                    <input type="text" name="type" placeholder="Your activity domain" required
                           value='{if isset($filledDatas.type)}{$filledDatas.type}{/if}'>
                    <label for="typeDescription">Your role in this domain</label>
                    <input type="text" name="typeDescription" placeholder="Your role in this domain" required
                           value='{if isset($filledDatas.typeDescription)}{$filledDatas.typeDescription}{/if}'>
                </article>
            </div>
            <div class="row">
                <article class="offset2 span8">
                    <h2>Your motivations</h2>
                    <p>Explain us your motivations</p>
                    <textarea type="text" name="motivation" class="big" required>{if isset($filledDatas.motivation)}{$filledDatas.motivation}{/if}</textarea>
                        <label for="keywords" title="describe your interests in 3 words">Keywords describing you</label>
                    <p>
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
                    <label for="type">Your activity domain</label>
                    <input type="text" name="type" placeholder="Your activity domain" required>
                    <label for="typeDescription">Your role in this domain</label>
                    <input type="text" name="typeDescription" placeholder="Your role in this domain" required>
                </article>
            </div>
        
        
            <div class="row">
                <article class="offset2 span8">  
                    <h2>Your motivations</h2>
                    <p>Explain us your motivations</p>
                    <textarea type="text" name="motivation" class="big" required></textarea>
                    <h3>Keywords Describing me</h3>
                        <label for="keyword" title="describe your interests in 3 words">Keywords</label>
                    <p>
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