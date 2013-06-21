<!--
backend_account.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the account page
-->
<div class="row offset2">       
    <section id="bk_account">
        <article>
            <h2>Account</h2>
                
            <ul>
                <!-- do a loop on li-->
                <li>
                    {$person_name}{$person_first_name} <!-- ATTENTION ajouter boutton modifier /!\ modifier renvoit au champ infos du comptes selectionné sur la meme page!(section ci-dessous) et supprimer-->
                </li>
            </ul>
                    
        </article>
    </section>
    <asside id="info_of_one_account">
        <h2>Informations of this account</h2>
        <!-- a mettre les infos du comptes ou on a cliqué sur modifier...-->
    </asside>
</div> 

