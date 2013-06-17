<!--
userbar.tpl
Author : CORTxTeam
Date : 14.06.2013
Description :
-->





<footer>
    {if $loggedIn}
        <div id="options">
            <img src="./img/userbar/gears.png" />
        </div>
        <p>Welcome aboard {$username}!</p>

    {else}
        <div id="login">
            <form method="post" action="login.php">  
                <input type="text" name="username" placeholder="Username">
                <input type="password" name="password" placeholder="Password">
                <input type="submit" name="Login" value="OK"/>
            </form>
        </div>
    {/if}    
</footer>
</body>
</html>