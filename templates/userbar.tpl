<!--
userbar.tpl
Author : CORTxTeam
Date : 14.06.2013
Description :
-->





<footer class="row">
    {if isset($loggedin) && $loggedin==TRUE}
        
        {if $userLevel=='participant'}    
            <a class="offset2 span1" href="" title="My particpations">My participations</a>
            <a class="span1" href="" title="My profile">My profile</a>
        {/if}
        <a class="offset2 span1" href="home.php" title="Welcome Page">Home</a>
        <a class="span1" href="backend_home.php" title="Management Area">Management Area</a>
        <p class="span1">Welcome aboard {$username} you have the rights of {$userLevel}!</p>
        <a class="offset4 span1" id="logout" href="login.php?action=logout">Logout</a>
        
        
    {else}
        
        <form method="post" action="login.php">
            <input type="text" name="username" placeholder="Username" class="offset7 span1">
            <input type="password" name="password" placeholder="Password" class="span1">
            <input type="submit" name="Login" value="OK" id="login" class="span1">
        </form>
        
        
    {/if}    
</footer>
</div>
</body>
</html>