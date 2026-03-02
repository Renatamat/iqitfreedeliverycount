{*
* 2017 IQIT-COMMERCE.COM
*
* NOTICE OF LICENSE
*
* This file is licenced under the Software License Agreement.
* With the purchase or the installation of the software in your application
* you accept the licence agreement
*
* @author    IQIT-COMMERCE.COM <support@iqit-commerce.com>
* @copyright 2017 IQIT-COMMERCE.COM
* @license   Commercial license (You can not resell or redistribute this software.)
*
*}



{*
<div class="alert alert-info iqitfreedeliverycount p-2 {if $hide}hidden-xs-up{/if}" role="alert">
    <div class="iqitfreedeliverycount-title {if isset($txt) && $txt != ''}mb-1{/if}"><strong>{l s='Spend' mod='iqitfreedeliverycount'} <span class="ifdc-remaining-price">{$free_ship_remaining}</span> {l s='more to get free shipping!' mod='iqitfreedeliverycount'}</strong></div>
    {if isset($txt) && $txt != ''}{$txt nofilter}{/if} {* HTML, cannot escape*}
{*</div>*}
  {* Pasek postępu *}
  <div class="iqitfreedeliverycount-wrapper mb-6 mt-6" data-remaining="{$free_ship_remaining}"
     data-threshold="{$free_ship_from}" data-prev-pct="0">
      <p> Darmowa dostawa <strong>od {$free_ship_from}</strong></p>
      <div class="ifdc-progress-bar" >
            <div class="ifdc-progress">
              <div class="ifdc-track"></div>
              <div class="ifdc-fill" style="width:0%"></div>

              <div class="ifdc-badge" aria-hidden="true" >
                <div class="ifdc-badge-circle d-flex ">
                    <span class="d-flex flex-column">
                        {l s="Brakuje"}
                        <strong> {$free_ship_remaining}</strong>
                    </span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
                    <path d="M27.6248 24.6287H29.4723C29.811 24.6284 30.1357 24.4937 30.3753 24.2542C30.6148 24.0147 30.7495 23.69 30.7498 23.3513V17.0563C30.7797 16.6308 30.6888 16.2056 30.4876 15.8297C30.2863 15.4537 29.9829 15.1422 29.6123 14.9313C28.6035 14.5563 26.916 14.0925 26.916 14.0925L24.6798 6.55625C24.5362 5.87908 24.1797 5.26565 23.6623 4.80569C23.145 4.34573 22.4941 4.0634 21.8048 4H4.55479C4.21916 4 3.88682 4.06613 3.57675 4.19461C3.26668 4.32309 2.98496 4.5114 2.74769 4.74878C2.51042 4.98617 2.32225 5.26798 2.19392 5.57811C2.0656 5.88824 1.99963 6.22062 1.99979 6.55625V23.3513C2.00012 23.69 2.13482 24.0147 2.37433 24.2542C2.61383 24.4937 2.93858 24.6284 3.27729 24.6287H5.12479M21.2345 24.6289H11.5145M30.7495 18.8789H28.1945M27.6245 23.9899C27.6245 24.8187 27.2953 25.6136 26.7092 26.1996C26.1232 26.7857 25.3283 27.1149 24.4995 27.1149C23.6707 27.1149 22.8759 26.7857 22.2898 26.1996C21.7038 25.6136 21.3745 24.8187 21.3745 23.9899C21.3745 23.1611 21.7038 22.3663 22.2898 21.7802C22.8759 21.1941 23.6707 20.8649 24.4995 20.8649C25.3283 20.8649 26.1232 21.1941 26.7092 21.7802C27.2953 22.3663 27.6245 23.1611 27.6245 23.9899ZM11.3745 23.9899C11.3745 24.8187 11.0453 25.6136 10.4592 26.1996C9.87317 26.7857 9.07831 27.1149 8.24951 27.1149C7.42071 27.1149 6.62586 26.7857 6.0398 26.1996C5.45375 25.6136 5.12451 24.8187 5.12451 23.9899C5.12451 23.1611 5.45375 22.3663 6.0398 21.7802C6.62586 21.1941 7.42071 20.8649 8.24951 20.8649C9.07831 20.8649 9.87317 21.1941 10.4592 21.7802C11.0453 22.3663 11.3745 23.1611 11.3745 23.9899Z" stroke="white" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M4.31396 17.14V10.4552H6.50146M6.50146 14.1014H4.31396M18.1414 10.4552H15.9539V17.14H18.1414M18.1414 14.1014H15.9539M23.3765 10.4552H21.189V17.14H23.3765M23.3765 14.1014H21.189M9.78272 17.1375V10.4526H11.3452C11.7596 10.4526 12.157 10.6127 12.4501 10.8976C12.7431 11.1825 12.9077 11.569 12.9077 11.9719C12.9077 12.3749 12.7431 12.7613 12.4501 13.0462C12.157 13.3311 11.7596 13.4912 11.3452 13.4912H9.78272H10.4077C11.0708 13.4912 11.7066 13.7473 12.1755 14.2032C12.6443 14.6591 12.9077 15.2774 12.9077 15.9221V17.1375" stroke="white" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>
              </div>
            </div>
        </div>
    <div class="alert alert-info iqitfreedeliverycount pt-2 mb-0 {if $hide}hidden-xs-up{/if}" role="alert">
        <a href="{$link->getCategoryLink(2, null, $cookie->id_lang)}" title="{l s='Continue shop' mod='iqitfreedeliverycount'}" class="text-reset text-decoration-none" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Continue shop' mod='iqitfreedeliverycount'}">
            <div class="iqitfreedeliverycount-title {if isset($txt) && $txt != ''}mb-1{/if}">                
                <div>
                   {l s='Continue shopping' d='Shop.Theme.Actions'}
                </div>
               <span class="icon-cart"></span>
            </div>
            {if isset($txt) && $txt != ''}{$txt nofilter}{/if} {* HTML, cannot escape *}
        </a>
    </div>
      
</div>