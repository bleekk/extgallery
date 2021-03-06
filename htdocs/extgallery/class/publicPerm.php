<?php
/**
 * ExtGallery Class Manager
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

// defined('XOOPS_ROOT_PATH') || exit('XOOPS root path not defined');

/**
 * Class ExtgalleryPublicPermHandler
 */
class ExtgalleryPublicPermHandler
{
    /**
     * @return ExtgalleryPublicPermHandler
     */
    public static function getInstance()
    {
        static $instance;
        if (null === $instance) {
            $instance = new static();
        }

        return $instance;
    }

    /**
     * @param $user
     *
     * @return string
     */
    public function _getUserGroup($user)
    {
        //if (is_a($user, 'XoopsUser') && $user->getVar('uid')>0) {
        // edit by Alfred
        if (is_a($user, 'XoopsUser') && $user->getVar('uid')>0) {
            return $user->getGroups();
        } else {
            return XOOPS_GROUP_ANONYMOUS;
        }
    }

    /**
     * @param XoopsUser $user
     * @param           $perm
     *
     * @return mixed
     */
    public function getAuthorizedPublicCat($user, $perm)
    {
        static $authorizedCat;
        $userId = $user ? $user->getVar('uid') : 0;
        // edit by Alfred
        $userId = intval($userId);
        if (!isset($authorizedCat[$perm][$userId])) {
            /** @var XoopsGroupPermHandler $groupPermHandler */
            $groupPermHandler = xoops_getHandler('groupperm');
            /** @var XoopsModuleHandler $moduleHandler */
            $moduleHandler                 = xoops_getHandler('module');
            $module                        = $moduleHandler->getByDirname('extgallery');
            $authorizedCat[$perm][$userId] = $groupPermHandler->getItemIds($perm, $this->_getUserGroup($user), $module->getVar('mid'));
        }

        return $authorizedCat[$perm][$userId];
    }

    /**
     * @param $user
     * @param $perm
     * @param $catId
     *
     * @return bool
     */
    public function isAllowed($user, $perm, $catId)
    {
        $autorizedCat = $this->getAuthorizedPublicCat($user, $perm);

        return in_array($catId, $autorizedCat);
    }
}
