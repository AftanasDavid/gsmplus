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
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">
    <div class="container">
      <div class="row product-container">
        <div class="col-md-6">
          {block name='page_content_container'}
            <section class="page-content" id="content">
              {block name='page_content'}
                {include file='catalog/_partials/product-flags.tpl'}

                {block name='product_cover_thumbnails'}
                  {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                {/block}
                <div class="scroll-box-arrows">
                  <i class="material-icons left">&#xE314;</i>
                  <i class="material-icons right">&#xE315;</i>
                </div>

              {/block}
            </section>
          {/block}
          </div>
          <div class="col-md-6">
            {block name='page_header_container'}
              {block name='page_header'}
                <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
              {/block}
            {/block}
            {block name='product_prices'}
              {include file='catalog/_partials/product-prices.tpl'}
            {/block}

            <div class="product-information">
              {block name='product_description_short'}
                <div id="product-description-short-{$product.id}" class="product-description" itemprop="description">{$product.description_short nofilter}</div>
              {/block}

              {block name='product_features'}
                {if $product.grouped_features}
                  <section class="product-features">
                    <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
                    <dl class="data-sheet">
                      {foreach from=$product.grouped_features item=feature}
                        <dt class="name">{$feature.name}</dt>
                        <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                      {/foreach}
                    </dl>
                  </section>
                {/if}
              {/block}

              {*{if isset($product_manufacturer->id)}
                <div class="product-manufacturer">
                  {if isset($manufacturer_image_url)}
                    <a href="{$product_brand_url}">
                      <h6>{l s='Brand' d='Shop.Theme.Catalog'}</h6>
                      <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
                    </a>
                  {else}
                    <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                    <span>
                      <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                    </span>
                  {/if}
                </div>
              {/if}*}

              {*<div id="product-rating">
                <div class="row p-2">
                  <div class="col-6">
                    <p>{l s='Hodnotenie:' d='Shop.Theme.Catalog'}</p>
                    <button><i class="fas fa-heart"></i> {l s='Produkt sa mi páči' d='Shop.Theme.Catalog'}</button>
                  </div>
                  <div class="col-6 d-flex align-items-center justify-content-center">
                    <span><i class="fas fa-heart"></i> 312</span>
                  </div>
                </div>
              </div>*}

              {if $product.is_customizable && count($product.customizations.fields)}
                {block name='product_customization'}
                  {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                {/block}
              {/if}

              <div class="product-actions">
                {block name='product_buy'}
                  <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                    <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                    {block name='product_variants'}
                      {include file='catalog/_partials/product-variants.tpl'}
                    {/block}

                    {block name='product_pack'}
                      {if $packItems}
                        <section class="product-pack">
                          <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                          {foreach from=$packItems item="product_pack"}
                            {block name='product_miniature'}
                              {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                            {/block}
                          {/foreach}
                      </section>
                      {/if}
                    {/block}

                    {block name='product_discounts'}
                      {include file='catalog/_partials/product-discounts.tpl'}
                    {/block}

                    {block name='product_add_to_cart'}
                      {include file='catalog/_partials/product-add-to-cart.tpl'}
                    {/block}

                    {block name='product_additional_info'}
                      {include file='catalog/_partials/product-additional-info.tpl'}
                    {/block}

                    {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                    {block name='product_refresh'}{/block}
                  </form>
                {/block}

              </div>
          </div>
        </div>
      </div>
      {block name='product_tabs'}
        <div class="container mt-5">
          <div id="accordion" class="accordion">
            <div class="card mb-0">
                <div class="card-header mt-2" data-toggle="collapse" href="#long-description">
                    <a class="card-title">
                        {l s='Popis' d='Shop.Theme.Catalog'}
                    </a>
                </div>
                <div id="long-description" class="card-body collapse show in" data-parent="#accordion">
                    {block name='product_description'}
                      <div class="product-description">{$product.description nofilter}</div>
                    {/block}
                </div>
                <div class="card-header mt-2 collapsed" data-toggle="collapse" data-parent="#accordion" href="#carier-payment">
                    <a class="card-title">
                      {l s='Doprava a platba' d='Shop.Theme.Catalog'}
                    </a>
                </div>
                <div id="carier-payment" class="card-body collapse" data-parent="#accordion">
                    <p>Spôsob dopravy</p>
                    <div class="row m-0">
                      <div class="col-6 col-sm-4 text-center">
                        <img width="150" src="https://gsmplus.sk/img/s/8.jpg" alt="">
                        <br>
                        <p class="mt-2">Zásielkovňa</p>
                        <p>Cena: 2.50€</p>
                      </div>
                      <div class="col-6 col-sm-4 text-center">
                        <img width="150" src="https://gsmplus.sk/img/s/9.jpg" alt="">
                        <br>
                        <p class="mt-2">123 kuriér</p>
                        <p>Cena: 3.90€</p>
                      </div>
                      <div class="col-6 col-sm-4 text-center">
                        <img width="150" src="https://gsmplus.sk/img/s/10.jpg" alt="">
                        <br>
                        <p class="mt-2">Osobný odber</p>
                        <p>Cena: zadarmo</p>
                      </div>
                    </div>
                    <p>Spôsob platby</p>
                    <div class="row m-0">
                      <div class="col-6 col-sm-4 text-center">
                        <img width="150" src="https://gsmplus.sk/themes/markas/assets/img/footer/karty.png" alt="">
                      </div>
                      <div class="col-6 col-sm-4 text-center">
                        <p>Bankovým prevodom</p>
                      </div>
                    </div>
                    <!-- <p><iframe width="100%" style="border: none;" src="https://gsmplus.sk/dopravaSK.php"></iframe></p> -->
                </div>
                <div class="card-header mt-2 collapsed" data-toggle="collapse" data-parent="#accordion" href="#product-info">
                    <a class="card-title">
                      {l s='Informácie' d='Shop.Theme.Catalog'}
                    </a>
                </div>
                <div id="product-info" class="collapse" data-parent="#accordion" >
                    <div class="card-body">
                    {block name='product_reference'}
                      {*{if isset($product_manufacturer->id)}
                        <div class="product-manufacturer mb-2">
                          {if isset($manufacturer_image_url)}
                            <a href="{$product_brand_url}">
                              {l s='Brand' d='Shop.Theme.Catalog'}
                              <br>
                              <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
                            </a>
                          {else}
                            <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                            <span>
                              <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                            </span>
                          {/if}
                        </div>
                      {/if}*}
                      {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
                        <div class="product-reference">
                          <label class="label">{l s='Reference' d='Shop.Theme.Catalog'}: </label>
                          <span itemprop="sku">{$product.reference_to_display}</span>
                          <br>
                          <label class="label">{l s='EAN' d='Shop.Theme.Catalog'}: </label>
                          <span itemprop="ean">{$product.ean13}</span>
                        </div>
                      {/if}
                    {/block}

                    {block name='product_quantities'}
                      {if $product.show_quantities}
                        <div class="product-quantities">
                          <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
                          <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
                        </div>
                      {/if}
                    {/block}

                    {block name='product_availability_date'}
                      {if $product.availability_date}
                        <div class="product-availability-date">
                          <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                          <span>{$product.availability_date}</span>
                        </div>
                      {/if}
                    {/block}

                    {block name='product_out_of_stock'}
                      <div class="product-out-of-stock">
                        {hook h='actionProductOutOfStock' product=$product}
                      </div>
                    {/block}

                    {block name='product_features'}
                      {if $product.grouped_features}
                        <section class="product-features">
                          <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
                          <dl class="data-sheet">
                            {foreach from=$product.grouped_features item=feature}
                              <dt class="name">{$feature.name}</dt>
                              <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                            {/foreach}
                          </dl>
                        </section>
                      {/if}
                    {/block}

                    {* if product have specific references, a table will be added to product details section *}
                    {block name='product_specific_references'}
                      {if !empty($product.specific_references)}
                        <section class="product-features">
                          <p class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</p>
                            <dl class="data-sheet">
                              {foreach from=$product.specific_references item=reference key=key}
                                <dt class="name">{$key}</dt>
                                <dd class="value">{$reference}</dd>
                              {/foreach}
                            </dl>
                        </section>
                      {/if}
                    {/block}

                    {block name='product_condition'}
                      {if $product.condition}
                        <div class="product-condition">
                          <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
                          <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                          <span>{$product.condition.label}</span>
                        </div>
                      {/if}
                    {/block}
                    {block name='hook_display_reassurance'}
                      {hook h='displayReassurance'}
                    {/block}
                  </div>
                </div>
            </div>
        </div>
      </div>
      {/block}
      {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix mt-3">
          <p class="h5 text-uppercase text-center">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="products" itemscope itemtype="http://schema.org/ItemList">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}
    </div>

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
