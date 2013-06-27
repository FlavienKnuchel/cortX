<!--
 * login.tpl
 *
 * Author : Christophe Rast
 * Date : 15.6.2013
 *
 * Description :
 *
 *
-->
{if isset($errorlogin)}
    <section class="row firstElement">
        <article class="offset2 span8 badMessage ">
            <p>{$errorlogin}</p>
        </article>
    </section>
{/if}
<div id="loginForm" class="offset5 span2 lastElement" id="passwordForm">
    <form method="POST" action="login.php">
        <div class="span12">
        <label class="span12" for="username" title="username">Username:</label>
        <input class="span12" type="text" name="username" placeholder="Username">
        </div>
        <div class="span12">
        <label class="span12" for="password" title="password">Password:</label>
        <input class="span12" type="password" name="password" placeholder="Password">
        </div>
        <input class="span12 button" type="submit" name="Login" value="OK"/>
    </form>
</div>
