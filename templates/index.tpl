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
{extends file='page.tpl'}
    {block name='page_content_container'}
      <section id="content" class="page-home">
        {block name='page_content_top'}{/block}
        {block name='page_content'}
          {block name='hook_home'}
            {$HOOK_HOME nofilter}
          {/block}
          <div id="carousel-brands">
            <div class="owl-carousel">
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/awei.png" alt="awei" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/baseus.png" alt="baseus" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/esr.png" alt="esr" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/goospery.png" alt="goospery" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/hoco.png" alt="hoco" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/iDeal.png" alt="iDeal" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/Monkey.png" alt="Monkey" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/otterbox.png" alt="otterbox" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/remax.png" alt="remax" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/roar.png" alt="roar" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/spigen.png" alt="spigen" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/UAG.png" alt="UAG" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/UiiSii.png" alt="UiiSii" /></a>
              </div>
              <div>
                  <a href="#" target="_blank" title="" itemprop="url"><img src="https://gsmplus.sk/themes/markas/assets/img/znacky/x-one.png" alt="x-one" /></a>
              </div>
            </div>
          </div>
          {hook h='displayHomeTab'}
        {/block}
      </section>
    {/block}
