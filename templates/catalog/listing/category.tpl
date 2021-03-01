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
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
    {include file='catalog/_partials/category-header.tpl' listing=$listing category=$category}

    {if isset($subcategories)}
    {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories)}
    <div id="subcategories">
      <div class="clearfix podkategorie rozcestnik-img-wrapper justify-content-md-center">
        {foreach from=$subcategories item=subcategory}
        {if $subcategory.id_image == "sk-default"}
        <div class="col-rozcestnik rozcestnik">
          <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img without-img">
            <div class="row">
              <div class="col-12" style="padding: 0; display: flex; align-items: center; justify-content: center; text-align: center;">
                <h5>
                  {$subcategory.name|truncate:50:'...'|escape:'html':'UTF-8'}
                </h5>
              </div>
            </div>
          </a>
        </div>
        {else}
        <div class="col-rozcestnik rozcestnik">
          <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
            <div class="row">
              <div class="col-6" style="padding: 0 5px;">
                <div class="subcategory-image">
                  <img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'category_default')|escape:'html':'UTF-8'}" alt="{$subcategory.name|escape:'html':'UTF-8'}" />
                </div>
              </div>  
              <div class="col-6" style="padding: 0; display: flex; align-items: center;">
                <h5>
                  {$subcategory.name|truncate:50:'...'|escape:'html':'UTF-8'}
                </h5>
              </div>
            </div>
          </a>
        </div>
        {/if}
        {/foreach}
      </div>
    </div>
    {/if}
  {/if}
{/block}