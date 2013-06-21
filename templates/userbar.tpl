<!--
userbar.tpl
Author : CORTxTeam
Date : 14.06.2013
Description :
-->





<footer class="row">
    {if $loggedin==TRUE}
        <div id="logged">
            {if isset($userLevel)}
                {if $userLevel=='participant'}    
                    <a class="offset2 span1" href="user_inscriptions.php" title="My registrations">My registrations</a>
                    <a class="span1" href="user_profile.php" title="My profile">My profile</a>
                {else}

                    <a class="offset2 span1" href="home.php" title="Welcome Page"><div id="home_icon"></div></a>
                    <a class="span1 message" href="backend_home.php" title="Management Area"><div id="setting"></div></a>
                {/if}
            {/if}
            <a class="offset5 span1" id="logout" href="login.php?action=logout">Logout</a>
        </div>

    {else}

        <form method="post" action="login.php" class="offset7 span3">
            <input type="text" name="username" placeholder="Username" id="form_log">
            <input type="password" name="password" placeholder="Password" id="form_log">
            <input type="submit" name="Login" value="OK" id="login">
        </form>


    {/if}    
</footer>

</div>
</body>
</html>