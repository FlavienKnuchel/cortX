<!--
backend_account.tpl

Author : Noémie Sandoz and Andréane Mercier
Date : 18.6.2013

Description : backend of the account page
-->
<section class="firstElement">
    <section class="row">
        <article class="offset2 span5">     
            <h1>Account</h1>
            <ul>
            <!-- do a loop on li-->
                <li>
                    <p>{$person_name}{$person_first_name}</p>
                    <p>
                        <a href="#" title="modify"><img  src="./img/modify.png" alt="modify" title="modify" /></a>
                        <a href="#" title="delete"><img  src="./img/delete.png" alt="delete" title="delete" /></a>
                    </p>
                    
                    <!-- ATTENTION ajouter boutton modifier /!\ modifier renvoit au champ infos du comptes selectionné sur la meme page!(section ci-dessous) et supprimer-->
                    
                 </li>
             </ul>
        </article>
        <article class="span3">
        <h2>Informations of this account</h2>
        <p>
        <!-- a mettre les infos du comptes ou on a cliqué sur modifier...-->
        </p>
        </article>
    </section>    
</section>
