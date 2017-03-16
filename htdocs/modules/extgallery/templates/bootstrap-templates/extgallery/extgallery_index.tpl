<div class="row">
  <div class="col-md-12">
    <ol class="breadcrumb">
      <li><a title="<{$extgalleryName}>" href="<{xoAppUrl modules/extgallery/}>"><{$extgalleryName}></a></li>
    </ol>
  </div>
</div>
<div class="row">
    <div class="col-md-12"><h4><{$lang.categoriesAlbums}></h4></div>
    <!-- <div class="col-xs-4 col-sm-4 col-md-4"><{$lang.nbAlbums}></div> -->
    <!-- <div class="col-xs-4 col-sm-4 col-md-4"><{$lang.nbPhotos}></div> -->
</div>

<div id="xoopsgrid" class="row">
    <{foreachq item=child from=$cats}>
    <div class="col-xs-6 col-sm-4 col-md-4 xoops-gallery-thumb">
      <div class="panel panel-default">
        <{if $disp_cat_img == 1 }>
            <{if $child.cat_imgurl != "" }>
                <{if $child.cat_isalbum}>
                  <div class="panel-thumbnail">
                    <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                        <img class="img-responsive" src="<{$child.cat_imgurl}>" alt="<{$child.cat_name}>">
                    </a>
                  </div>
                <{else}>
                  <div class="panel-thumbnail">
                    <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                        <img class="img-responsive" src="<{$child.cat_imgurl}>" alt="<{$child.cat_name}>">
                    </a>
                  </div>
                <{/if}>
            <{else}>
                <{if $child.photo}>

                    <{if $child.cat_isalbum}>
                      <div class="panel-thumbnail">
                        <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                            <img class="img-responsive" src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>">
                        </a>
                      </div>
                    <{else}>
                      <div class="panel-thumbnail">
                        <a title="<{$child.cat_name}>" href="public-categories.php?id=<{$child.cat_id}>">
                            <img class="img-responsive" src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>">
                        </a>
                      </div>
                    <{/if}>
                <{/if}>
            <{/if}>
        <{else}>

            <{if $child.photo}>
                <{if $child.cat_isalbum}>
                  <div class="panel-thumbnail">
                    <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                        <img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>">
                    </a>
                  </div>
                <{else}>
                  <div class="panel-thumbnail">
                    <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                        <img class="img-responsive" src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$child.photo.photo_name}>" alt="<{$child.photo.photo_title}>">
                    </a>
                  </div>
                <{/if}>
            <{/if}>
        <{/if}>

        <{if $child.cat_isalbum}>
          <div class="panel-body">
            <h4>
            <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-<{$display_type}>.php?id=<{$child.cat_id}>">
                <{$child.cat_name}></strong>
            </a><span class="label label-success" style="font-size:60%; font-weight: normal"><{$child.cat_nb_photo}> <{$lang.nbPhotos}></span></h4>
            <p><{$child.cat_desc}></p>
          </div>

        <{else}>
          <div class="panel-body">
            <h4>
            <a title="<{$child.cat_name}>" href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$child.cat_id}>">
                <{$child.cat_name}>
            </a><span class="label label-success" style="font-size:60%; font-weight: normal"><{$child.cat_nb_photo}> <{$lang.nbPhotos}></span>
            </h4>
            <p><{$child.cat_desc}></p>
          </div>
        <{/if}>
        <!--
        <{if $child.cat_nb_album != 0}>
            <{$child.cat_nb_album}>
        <{/if}>
      -->

      </div> <!-- end .gallery-panel -->
    </div>
    <{/foreach}>
</div>

<{if $show_rss}>
    <div class="row">
        <div class="col-md-12">
            <a href="<{xoAppUrl modules/extgallery/public-rss.php}>" title="<{$smarty.const._MD_EXTGALLERY_RSS}>">
                <img src="<{xoAppUrl modules/extgallery/assets/images/feed.png}>" alt="<{$smarty.const._MD_EXTGALLERY_RSS}>">
            </a>
        </div>
    </div>
<{/if}>

<{include file='db:system_notification_select.tpl'}>
