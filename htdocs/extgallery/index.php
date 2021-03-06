<?php
/**
 * ExtGallery User area
 *
 * You may not change or alter any portion of this comment or credits
 * of supporting developers from this source code or any supporting source code
 * which is considered copyrighted (c) material of the original comment or credit authors.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright   {@link http://xoops.org/ XOOPS Project}
 * @license     GNU GPL 2 (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
 * @author      Zoullou (http://www.zoullou.net)
 * @package     ExtGallery
 */

include __DIR__ . '/header.php';

$GLOBALS['xoopsOption']['template_main'] = $moduleDirName . '_index.tpl';
include XOOPS_ROOT_PATH . '/header.php';
if ($xoopsUser && $xoopsUser->uid() < 1) unset($xoopsUser);

/** @var ExtgalleryPublicCatHandler $catHandler */
$catHandler = xoops_getModuleHandler('publiccat', $moduleDirName);

$cats = $catHandler->objectToArray($catHandler->getChildren(0), array('photo_id'));
$xoopsTpl->assign('cats', $cats);

$rel                 = 'alternate';
$attributes['rel']   = $rel;
$attributes['type']  = 'application/rss+xml';
$attributes['title'] = _MD_EXTGALLERY_RSS;
$attributes['href']  = XOOPS_URL . '/modules/extgallery/public-rss.php';
$xoTheme->addMeta('link', $rel, $attributes);
$xoTheme->addStylesheet('modules/extgallery/assets/css/style.css');

$lang = array(
    'categoriesAlbums' => _MD_EXTGALLERY_CATEGORIESALBUMS,
    'nbAlbums'         => _MD_EXTGALLERY_NBALBUMS,
    'nbPhotos'         => _MD_EXTGALLERY_NBPHOTOS
);
$xoopsTpl->assign('lang', $lang);

$xoopsTpl->assign('extgalleryName', $xoopsModule->getVar('name'));
$xoopsTpl->assign('disp_cat_img', $xoopsModuleConfig['disp_cat_img']);
$xoopsTpl->assign('display_type', $xoopsModuleConfig['display_type']);
$xoopsTpl->assign('thumb_width', $xoopsModuleConfig['thumb_width']);
$xoopsTpl->assign('thumb_heigth', $xoopsModuleConfig['thumb_heigth']);
$xoopsTpl->assign('show_rss', $xoopsModuleConfig['show_rss']);

// pk ------------------- add upload and view-my-album links to main page
$albumlinkname = $albumurl = $uploadlinkname = $uploadurl = '';
if (isset($GLOBALS['xoopsModule']) && $GLOBALS['xoopsModule']->getVar('dirname') == $moduleDirName) {
    if ($GLOBALS['xoopsUser'] != null) {
        $albumlinkname = _MD_EXTGALLERY_USERALBUM;
        $albumurl      = 'public-useralbum.php?id=' . $GLOBALS['xoopsUser']->uid();
    }

    include_once XOOPS_ROOT_PATH . "/modules/{$moduleDirName}/class/publicPerm.php";

    $permHandler = ExtgalleryPublicPermHandler::getInstance();
    if (count($permHandler->getAuthorizedPublicCat($GLOBALS['xoopsUser'], 'public_upload')) > 0) {
        $uploadlinkname = _MD_EXTGALLERY_PUBLIC_UPLOAD;
        /*
        if ($GLOBALS['xoopsModuleConfig']['use_extended_upload'] === 'html') {
            $uploadurl = 'public-upload.php';
        } else {
            $uploadurl = 'public-upload-extended.php';
        }
        */
        $uploadurl = 'public-upload.php';
    }
}

$xoopsTpl->assign('albumlinkname', $albumlinkname);
$xoopsTpl->assign('albumurl', $albumurl);
$xoopsTpl->assign('uploadlinkname', $uploadlinkname);
$xoopsTpl->assign('uploadurl', $uploadurl);

// end pk mod ------------------------------

include XOOPS_ROOT_PATH . '/footer.php';
