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
<aside id="loginToAccount">
    <p>{$errorlogin}</p>
    <form method="POST" action="login.php">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <input type="submit" name="Login" value="OK"/>
    </form>
</aside>
