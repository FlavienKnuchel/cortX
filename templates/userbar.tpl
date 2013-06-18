<!--
userbar.tpl
Author : CORTxTeam
Date : 14.06.2013
Description :
-->





<footer>
    {if isset($loggedin) && $loggedin==TRUE}
        {if $userLevel=='participant'}
            <a href="" title="My particpations">My participations</a>
            <a href="" title="My profile">My profile</a>
        {/if}
        <a href="home.php" title="Welcome Page">Home</a>
        <a href="backend_home.php" title="Management Area">Management Area</a>
        <p>Welcome aboard {$username} you have the rights of {$userLevel}!</p>
        <div id="login">
            <a href="login.php?action=logout">Logout</a>
        </div>
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
</div>
</body>
</html>