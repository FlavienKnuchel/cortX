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

                    <a class="offset2 span1" href="home.php" title="Welcome Page" id="home_icon"></a>
                    <a class="offset1 span1" href="backend_home.php" title="Management Area" id="setting"></a>
                {/if}
            {/if}
            <a class="offset5 span1" id="logout" href="login.php?action=logout">Logout</a>
        </div>

    {else}

        <form id="login_desktop" method="post" action="login.php" class="offset6 span4 log">
            <label for="username">Login</label>
            <input type="text" name="username" placeholder="Username">
            <label for="password">Password</label>
            <input type="password" name="password" placeholder="Password">
            <input type="submit" name="Login" value="OK" id="login">
        </form>
        
        <div id="login_smartphone" class="button">
            <a href="login.php" title="Get more infos and register to this event!">Log me in !</a>
        </div>

    {/if}    
</footer>

        </div>
    </body>
</html>