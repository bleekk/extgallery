<script type="text/javascript">
<{if $use_ajax_effects == 'lightbox'}>
$(function() {
   $('a[rel*=lightbox]').lightBox({
	overlayOpacity: 0.6,
  imageBlank: '<{xoAppUrl modules/extgallery/assets/images/lightbox/}>lightbox-blank.gif',
	imageLoading: '<{xoAppUrl modules/extgallery/assets/images/lightbox/}>lightbox-ico-loading.gif',
	imageBtnClose: '<{xoAppUrl modules/extgallery/assets/images/lightbox/}>lightbox-btn-close.gif',
	imageBtnPrev: '<{xoAppUrl modules/extgallery/assets/images/lightbox/}>lightbox-btn-prev.gif',
	imageBtnNext: '<{xoAppUrl modules/extgallery/assets/images/lightbox/}>lightbox-btn-next.gif',
	containerResizeSpeed: 350,
	txtImage: 'Picture',
	txtOf: 'de'
   });
});
<{/if}>

</script>
<{$use_ajax_effects}>
<div class="extGalleryAlbum">
    <div class="row">
        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><a title="<{$extgalleryName}>" href="<{xoAppUrl modules/extgallery/}>"><{$extgalleryName}></a></li>
                <{foreachq item=node from=$catPath name=breadcrumb}>
                <li><a title="<{$node.cat_name}>"
                       href="<{xoAppUrl modules/extgallery/}>public-categories.php?id=<{$node.cat_id}>"><{$node.cat_name}></a></li>
                <{/foreach}>
                <li><{$cat.cat_name}></li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 aligncenter">
            <h4 class="gallerytitle"><{$extgallerySortbyOrderby}></h4>
        </div>

        <div class="col-md-12 aligncenter orderbyicons">


          <div class="btn-group btn-group" role="group" aria-label="...">
            <button type="button" class="btn btn-sm btn-default">
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_date&amp;orderby=DESC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTDATEDESC}>">
                  <span class="glyphicon glyphicon-chevron-up"></span>
              </a>
              <span><{$smarty.const._MD_EXTGALLERY_SORTDATE}></span>
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_date&amp;orderby=ASC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTDATEASC}>">
                  <span class="glyphicon glyphicon-chevron-down"></span>
              </a>
            </button>
            <button type="button" class="btn btn-sm btn-default">
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_title&amp;orderby=ASC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTNAMEASC}>">
                  <span class="glyphicon glyphicon-chevron-up"></span>
              </a>
              <span><{$smarty.const._MD_EXTGALLERY_SORTNAME}></span>
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_title&amp;orderby=DESC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTNAMEDESC}>">
                  <span class="glyphicon glyphicon-chevron-down"></span>
              </a>
            </button>
            <button type="button" class="btn btn-sm btn-default">
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_hits&amp;orderby=DESC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTHITSDESC}>">
                  <span class="glyphicon glyphicon-chevron-up"></span>
              </a>
              <span><{$smarty.const._MD_EXTGALLERY_SORTHITS}></span>
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_hits&amp;orderby=ASC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTHITSASC}>">
                  <span class="glyphicon glyphicon-chevron-down"></span>
              </a>
            </button>
            <button type="button" class="btn btn-sm btn-default">
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_rating&amp;orderby=DESC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTNOTEDESC}>">
                  <span class="glyphicon glyphicon-chevron-up"></span>
              </a>
              <span><{$smarty.const._MD_EXTGALLERY_SORTNOTE}></span>
              <a href="<{xoAppUrl modules/extgallery/}>public-album.php?id=<{$extgalleryID}>&amp;start=<{$extgalleryStart}>&amp;sortby=photo_rating&amp;orderby=ASC"
                 title="<{$smarty.const._MD_EXTGALLERY_SORTNOTEASC}>">
                  <span class="glyphicon glyphicon-chevron-down"></span>
              </a>
            </button>
          </div>
        </div><!-- .orderbyicons -->
    </div>


    <h4><{$cat.cat_name}></h4>
    <hr>

    <div id="xoopsgrid">

        <{section name=photo loop=$photos}>
            <div class="col-xs-6 col-sm-6 col-md-4 album-thumb">


                <{if $photos[photo].photo_id}>
                <div class="panel panel-default">
                  <div class="panel-thumbnail" style="overflow: hidden;">
                    <{if $photos[photo].photo_serveur && $photos[photo].photo_name}>
                        <a href="<{xoAppUrl modules/extgallery/}>public-photo.php?photoId=<{$photos[photo].photo_id}>" title="<{$photos[photo].photo_title}>">
                            <img src="<{$photos[photo].photo_serveur}>thumb_<{$photos[photo].photo_name}>" alt="<{$photos[photo].photo_title}>">
                        </a>
                    <{elseif $photos[photo].photo_name}>

                      <{if $use_ajax_effects == 'none'}>
                      <a href="<{xoAppUrl modules/extgallery/}>public-photo.php?photoId=<{$photos[photo].photo_id}>" title="<{$photos[photo].photo_title}>">
                      <{elseif $use_ajax_effects == 'lightbox'}>
                      <a href="<{$xoops_url}>/uploads/extgallery/public-photo/medium/<{$photos[photo].photo_name}>" rel="lightbox" data-lightbox="image-<{$photos[photo].photo_id}>" data-title="<{$photos[photo].photo_title}>">
                      <{elseif $use_ajax_effects == 'tooltip'}>
                      <a href="<{xoAppUrl modules/extgallery/}>public-photo.php?photoId=<{$photos[photo].photo_id}>"
                        rel="<{$xoops_url}>/uploads/extgallery/public-photo/medium/<{$photos[photo].photo_name}>" class="screenshot" title="<{$photos[photo].photo_title}>">
                      <{elseif $use_ajax_effects == 'overlay'}>
                      <div class="simple_overlay" id="photo<{$photos[photo].photo_id}>">
                        <a href="<{$xoops_url}>/uploads/extgallery/public-photo/medium/<{$photos[photo].photo_name}>" >
                      </div>
                      <{else}>
                      <a href="<{xoAppUrl modules/extgallery/}>public-photo.php?photoId=<{$photos[photo].photo_id}>" title="<{$photos[photo].photo_title}>">
                      <{/if}>

                            <img src="<{$xoops_url}>/uploads/extgallery/public-photo/thumb/thumb_<{$photos[photo].photo_name}>"
                                 alt="<{$photos[photo].photo_title}>" rel="#photo<{$photos[photo].photo_id}>">
                        </a>
                    <{/if}>

                  </div>
                  <div class="panel-body">
                    <h4><{$photos[photo].photo_title}></h4>

                    <{if $enableRating || $enable_show_comments || $enable_photo_hits || $enable_date || $enable_submitter_lnk || $xoops_isadmin}>
                      <ul class="list-unstyled">

                        <{if $enable_show_comments && $enable_photo_hits}>
                            <li><{$photos[photo].photo_comment}> <{$lang.comments}> | <{$photos[photo].photo_hits}> <{$lang.hits}></li>
                        <{elseif $enable_show_comments && !$enable_photo_hits}>
                            <li><{$photos[photo].photo_comment}> <{$lang.comments}></li>
                        <{elseif !$enable_show_comments && $enable_photo_hits}>
                            <li><{$photos[photo].photo_hits}> <{$lang.hits}></li>
                        <{/if}>

                        <{if $enable_date && $enable_submitter_lnk}>
                            <li><span class="glyphicon glyphicon-calendar"></span> <{$photos[photo].photo_date}> |
                              <a title="<{$photos[photo].user.uname}>" href="<{$xoops_url}>/userinfo.php?uid=<{$photos[photo].user.uid}>"><{$photos[photo].user.uname}></li>
                        <{elseif $enable_date && !$enable_submitter_lnk}>
                            <li><span class="glyphicon glyphicon-calendar"></span> <{$photos[photo].photo_date}></li>
                        <{elseif !$enable_date && $enable_submitter_lnk}>
                            <li><a title="<{$photos[photo].user.uname}>" href="<{$xoops_url}>/userinfo.php?uid=<{$photos[photo].user.uid}>"><{$photos[photo].user.uname}></a></li>
                        <{/if}>
                        <{if $enableRating}>
                            <li>
                              <img src="<{xoAppUrl modules/extgallery/}>assets/images/rating_<{$photos[photo].photo_rating}>.gif" alt="<{$lang.rate_score}> : <{$photos[photo].photo_rating}>"
                              title="<{$lang.rate_score}>" >
                            </li>
                        <{/if}>
                        <{if $xoops_isadmin}>
                            <li>
                              <a title="edit" href="<{xoAppUrl modules/extgallery/}>public-modify.php?op=edit&id=<{$photos[photo].photo_id}>">
                              <span class="glyphicon glyphicon-edit"></span>
                              </a> |
                              <a title="delete" href="<{xoAppUrl modules/extgallery/}>public-modify.php?op=delete&id=<{$photos[photo].photo_id}>">
                              <span class="glyphicon glyphicon-trash"></span>
                              </a>
                            </li>
                        <{/if}>
                      </ul>
                    <{/if}>



                    <{foreachq item=pluginLink from=$photos[photo].link}>
                    <a href="<{$pluginLink.link}><{$photos[photo].photo_id}>" title="<{$pluginLink.name}>"><{$pluginLink.name}></a>
                    <{/foreach}>
                  </div>
                </div> <!-- close .panel -->
                <{/if}>
            </div> <!-- close .col-md-4 album-thumb -->
        <{/section}>
    </div>

</div><!-- .extGalleryAlbum -->

<div class="pageNav">
    <{$pageNav}>
</div>

<{if $show_rss}>
    <div id="rss">
        <a href="<{xoAppUrl modules/extgallery/public-rss.php?id=}><{$extgalleryID}>" title="<{$smarty.const._MD_EXTGALLERY_ALBUMRSS}>">
            <img src="<{xoAppUrl modules/extgallery/assets/images/feedblue.png}>" alt="<{$smarty.const._MD_EXTGALLERY_ALBUMRSS}>"/>
        </a>
        <a href="<{xoAppUrl modules/extgallery/public-rss.php}>" title="<{$smarty.const._MD_EXTGALLERY_RSS}>">
            <img src="<{xoAppUrl modules/extgallery/assets/images/feed.png}>" alt="<{$smarty.const._MD_EXTGALLERY_RSS}>"/>
        </a>
    </div>
<{/if}>
<script>
  $(document).ready(function() {
      $("img[rel]").overlay();
    });
</script>
<{include file='db:system_notification_select.tpl'}>
