{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

<div class="block-contact col-md-3 links wrapper">
  <div>
    <p class="h3">{l s='Rýchly kontakt' d='Shop.Theme.Global'}</p>
      {*{$contact_infos.address.formatted nofilter}*}
      {if $contact_infos.phone}
        <p>
        {l s='%phone%'
          sprintf=[
          '[1]' => '<p>',
          '[/1]' => '</p>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
      </p>
      {/if}
      <p>Plavnica 217</p>
      <p>065 45, Plavnica</p>
      {if $contact_infos.email && $display_email}
        {l
          s='[1]%email%[/1]'
          sprintf=[
            '[1]' => '<p><a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
            '[/1]' => '</a></p>',
            '%email%' => $contact_infos.email
          ]
          d='Shop.Theme.Global'
        }
      {/if}
  </div>
  {*<div class="hidden-md-up">
    <div class="title">
      <a class="h3" href="{$urls.pages.stores}">{l s='Store information' d='Shop.Theme.Global'}</a>
    </div>
  </div>*}
</div>
<div class="block-contact col-md-3 socials wrapper">
  <p class="h3">{l s='Sociálne siete' d='Shop.Theme.Global'}</p>
  <ul class="text-center text-md-left">
    <li><a href="#"><img width="45" src="https://gsmplus.sk/themes/markas/assets/img/footer/fb.png" alt=""></a></li>
    <li><a href="#"><img width="45" src="https://gsmplus.sk/themes/markas/assets/img/footer/insta.png" alt=""></a></li>
    <li><a href="#"><img width="45" src="https://gsmplus.sk/themes/markas/assets/img/footer/yt.png" alt=""></a></li>
  </ul>
  <div class="text-center text-md-left">
    <img class="mt-2 w-75" src="https://gsmplus.sk/themes/markas/assets/img/footer/zasielkovna.png" alt="">
    <br>
    <img class="mt-2 w-75" src="https://gsmplus.sk/themes/markas/assets/img/footer/karty.png" alt="">
  </div>
</div>