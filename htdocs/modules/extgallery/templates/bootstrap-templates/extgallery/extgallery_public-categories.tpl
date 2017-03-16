<div class="row">
  <div class="col-md-12">
    <ol class="breadcrumb">
      <li><a title="<{$extgalleryName}>" href="<{xoAppUrl modules/extgallery/}>"><{$extgalleryName}></a></li>
      <{foreachq item=node from=$catPath name=breadcrumb}>
       <li><a title="<{$node.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$node.cat_id}>"><{$node.cat_name}></a></li>
      <{/foreach}>
      <li><{$cat.cat_name}></li>
    </ol>
  </div>
</div>
<div class="extgallery">
    <table class="table">
        <thead>
        <tr>
            <th><{$lang.categoriesAlbums}></th>
            <th class="txtcenter"><{$lang.nbAlbums}></th>
            <th class="txtcenter"><{$lang.nbPhotos}></th>
        </tr>
        </thead>
        <tbody>
        <{foreachq item=child from=$catChild}>
        <tr class="<{cycle values="even,odd"}>">
            <{if $child.cat_nb_album == 0}>
            <td colspan="2">
                <{else}>
            <td>
                <{/if}>

                <!-- Category/album image -->
                <!-- Si l'option d'affichage de la photo de la categorie est active, alors -->
                <{if $disp_cat_img == 1 }>
                    <{if $child.cat_imgurl != "" }>
                        <div class="catThumb">
                            <{if $child.cat_isalbum}>
                                <a title="<{$child.cat_name}>"
                                   href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                                   <img src="<{$child.cat_imgurl}>" 
                                        class="img-responsive" 
                                        alt="<{$child.cat_name}>" title="" 
                                        width="100"/>
                                </a>
                            <{else}>
                                <a title="<{$child.cat_name}>"
                                   href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                                   <img src="<{$child.cat_imgurl}>" 
                                        class="img-responsive" 
                                        alt="<{$child.cat_name}>" title="" 
                                        width="100"/>
                                </a>
                            <{/if}>
                        </div>
                    <{else}>
                        <{if $child.photo}>
                            <div class="catThumb">
                                <{if $child.cat_isalbum}>
                                    <a title="<{$child.cat_name}>"
                                       href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                                       <img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" 
                                            class="img-responsive"
                                            alt="<{$child.photo.photo_title}>" 
                                            title="<{$child.photo.photo_title}>"/>
                                    </a>
                                <{else}>
                                    <a title="<{$child.cat_name}>"
                                       href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                                       <img 
                                            src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" 
                                            class="img-responsive" 
                                            alt="<{$child.photo.photo_title}>" 
                                            title="<{$child.photo.photo_title}>"/>
                                    </a>
                                <{/if}>
                            </div>
                        <{/if}>
                    <{/if}>
                <{else}>
                    <{if $child.photo}>
                        <div class="catThumb">
                            <{if $child.cat_isalbum}>
                                <a title="<{$child.cat_name}>"
                                   href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                                   <img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" 
                                        class="img-responsive" 
                                        alt="<{$child.photo.photo_title}>" 
                                        title="<{$child.photo.photo_title}>"/>
                                </a>
                            <{else}>
                                <a title="<{$child.cat_name}>"
                                   href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                                   <img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" 
                                        class="img-responsive"                                         
                                        alt="<{$child.photo.photo_title}>" 
                                        title="<{$child.photo.photo_title}>"/>
                                </a>
                            <{/if}>
                        </div>
                    <{/if}>
                <{/if}>

                <!-- Fin de la modif -->
                <{if $child.cat_isalbum}>
                <h4><a title="<{$child.cat_name}>"
                       href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>"><{$child.cat_name}></a>
                </h4>
                <p><{$child.cat_desc}></p>
                </td>
            <{else}>
            <h4><a title="<{$child.cat_name}>"
                   href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>"><{$child.cat_name}></a>
            </h4>
            <p><{$child.cat_desc}></p>
            </td>
            <{/if}>

            <{if $child.cat_nb_album != 0}>
                <td class="txtcenter"><{$child.cat_nb_album}></td>
            <{/if}>
            <td class="txtcenter"><{$child.cat_nb_photo}></td>
        </tr>
        <{/foreach}>
        </tbody>
    </table>

    <{if $show_rss}>
        <div id="rss">
            <a href="<{xoAppUrl modules/extgallery/public-rss.php}>" title="<{$smarty.const._MD_EXTGALLERY_RSS}>">
                <img src="<{xoAppUrl modules/extgallery/assets/images/feed.png}>"
                     alt="<{$smarty.const._MD_EXTGALLERY_RSS}>"/>
            </a>
        </div>
    <{/if}>

    <{include file='db:system_notification_select.tpl'}>
</div>
