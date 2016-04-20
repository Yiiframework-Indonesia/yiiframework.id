/*
SQLyog Ultimate v11.28 (64 bit)
MySQL - 10.0.21-MariaDB : Database - yiiframe_work
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yiiframe_work` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `yiiframe_work`;

/*Table structure for table `auth` */

DROP TABLE IF EXISTS `auth`;

CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_auth_user` (`user_id`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth` */

/*Table structure for table `auth_assignment` */

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_assignment` */

insert  into `auth_assignment`(`item_name`,`user_id`,`created_at`) values ('administrator',2,1461172332),('administrator',3,1461172463);

/*Table structure for table `auth_item` */

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `type` (`type`),
  KEY `group_code` (`group_code`),
  KEY `rule_name` (`rule_name`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `auth_item_ibfk_2` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_item` */

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`group_code`,`data`,`created_at`,`updated_at`) values ('/admin/',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/#mediafile',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/bulk-spam',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/bulk-trash',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/comment/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/album/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/category/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/default/settings',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/info',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/resize',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/upload',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/media/manage/uploader',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/menu/link/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/page/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/category/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/post/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/seo/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/settings/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/settings/cache/flush',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/settings/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/settings/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/settings/reading/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/site/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/site/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/source/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/source/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/source/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/translation/source/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/change-password',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/default/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission-groups/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/refresh-routes',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/set-child-permissions',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/set-child-routes',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/permission/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/set-child-permissions',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/set-child-roles',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/role/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/user-permission/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/user-permission/set',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/user-permission/set-roles',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/*',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/bulk-activate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/bulk-deactivate',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/bulk-delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/create',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/delete',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/grid-page-size',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/grid-sort',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/index',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/toggle-attribute',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/update',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('/admin/user/visit-log/view',3,NULL,NULL,NULL,NULL,1440180000,1440180000),('administrator',1,'Administrator',NULL,NULL,NULL,1440180000,1440180000),('assignRolesToUsers',2,'Assign roles to users',NULL,'userManagement',NULL,1440180000,1440180000),('author',1,'Author',NULL,NULL,NULL,1440180000,1440180000),('bindUserToIp',2,'Bind user to IP',NULL,'userManagement',NULL,1440180000,1440180000),('changeGeneralSettings',2,'Change general settings',NULL,'settings',NULL,1440180000,1440180000),('changeOwnPassword',2,'Change own password',NULL,'userCommonPermissions',NULL,1440180000,1440180000),('changeReadingSettings',2,'Change reading settings',NULL,'settings',NULL,1440180000,1440180000),('changeUserPassword',2,'Change user password',NULL,'userManagement',NULL,1440180000,1440180000),('commonPermission',2,'Common permission',NULL,NULL,NULL,1440180000,1440180000),('createMediaAlbums',2,'Create media albums',NULL,'mediaManagement',NULL,1440180000,1440180000),('createMediaCategories',2,'Create media categories',NULL,'mediaManagement',NULL,1440180000,1440180000),('createMenuLinks',2,'Create menu links',NULL,'menuManagement',NULL,1440180000,1440180000),('createMenus',2,'Create menus',NULL,'menuManagement',NULL,1440180000,1440180000),('createPages',2,'Create pages',NULL,'pageManagement',NULL,1440180000,1440180000),('createPostCategories',2,'Create post categories',NULL,'postManagement',NULL,1440180000,1440180000),('createPosts',2,'Create posts',NULL,'postManagement',NULL,1440180000,1440180000),('createSeo',2,'Create SEO records',NULL,'seoManagement',NULL,1440180000,1440180000),('createSourceMessages',2,'Create source messages',NULL,'translations',NULL,1440180000,1440180000),('createUsers',2,'Create users',NULL,'userManagement',NULL,1440180000,1440180000),('deleteComments',2,'Delete comments',NULL,'commentsManagement',NULL,1440180000,1440180000),('deleteMedia',2,'Delete media',NULL,'mediaManagement',NULL,1440180000,1440180000),('deleteMediaAlbums',2,'Delete media albums',NULL,'mediaManagement',NULL,1440180000,1440180000),('deleteMediaCategories',2,'Delete media categories',NULL,'mediaManagement',NULL,1440180000,1440180000),('deleteMenuLinks',2,'Delete menu links',NULL,'menuManagement',NULL,1440180000,1440180000),('deleteMenus',2,'Delete menus',NULL,'menuManagement',NULL,1440180000,1440180000),('deletePages',2,'Delete pages',NULL,'pageManagement',NULL,1440180000,1440180000),('deletePostCategories',2,'Delete post categories',NULL,'postManagement',NULL,1440180000,1440180000),('deletePosts',2,'Delete posts',NULL,'postManagement',NULL,1440180000,1440180000),('deleteSeo',2,'Delete SEO records',NULL,'seoManagement',NULL,1440180000,1440180000),('deleteSourceMessages',2,'Delete source messages',NULL,'translations',NULL,1440180000,1440180000),('deleteUsers',2,'Delete users',NULL,'userManagement',NULL,1440180000,1440180000),('editComments',2,'Edit comments',NULL,'commentsManagement',NULL,1440180000,1440180000),('editMedia',2,'Edit media',NULL,'mediaManagement',NULL,1440180000,1440180000),('editMediaAlbums',2,'Edit media albums',NULL,'mediaManagement',NULL,1440180000,1440180000),('editMediaCategories',2,'Edit media categories',NULL,'mediaManagement',NULL,1440180000,1440180000),('editMediaSettings',2,'Edit media settings',NULL,'mediaManagement',NULL,1440180000,1440180000),('editMenuLinks',2,'Edit menu links',NULL,'menuManagement',NULL,1440180000,1440180000),('editMenus',2,'Edit menus',NULL,'menuManagement',NULL,1440180000,1440180000),('editPages',2,'Edit pages',NULL,'pageManagement',NULL,1440180000,1440180000),('editPostCategories',2,'Edit post categories',NULL,'postManagement',NULL,1440180000,1440180000),('editPosts',2,'Edit posts',NULL,'postManagement',NULL,1440180000,1440180000),('editSeo',2,'Edit SEO records',NULL,'seoManagement',NULL,1440180000,1440180000),('editUserEmail',2,'Edit user email',NULL,'userManagement',NULL,1440180000,1440180000),('editUsers',2,'Edit users',NULL,'userManagement',NULL,1440180000,1440180000),('flushCache',2,'Flush Cache',NULL,'settings',NULL,1440180000,1440180000),('fullMediaAccess',2,'Manage other users\' media',NULL,'mediaManagement',NULL,1440180000,1440180000),('fullMediaAlbumAccess',2,'Manage other users\' albums',NULL,'mediaManagement',NULL,1440180000,1440180000),('fullMediaCategoryAccess',2,'Manage other users\' categories',NULL,'mediaManagement',NULL,1440180000,1440180000),('fullMenuAccess',2,'Manage other users\' menus',NULL,'menuManagement',NULL,1440180000,1440180000),('fullMenuLinkAccess',2,'Manage other users\' menu links',NULL,'menuManagement',NULL,1440180000,1440180000),('fullPageAccess',2,'Manage other users\' pages',NULL,'pageManagement',NULL,1440180000,1440180000),('fullPostAccess',2,'Manage other users\' posts',NULL,'postManagement',NULL,1440180000,1440180000),('fullPostCategoryAccess',2,'Manage other users\' post categories',NULL,'postManagement',NULL,1440180000,1440180000),('fullSeoAccess',2,'Manage other users\' SEO records',NULL,'seoManagement',NULL,1440180000,1440180000),('manageRolesAndPermissions',2,'Manage roles and permissions',NULL,'userManagement',NULL,1440180000,1440180000),('moderator',1,'Moderator',NULL,NULL,NULL,1440180000,1440180000),('updateImmutableSourceMessages',2,'Update immutable source messages',NULL,'translations',NULL,1440180000,1440180000),('updateSourceMessages',2,'Update source messages',NULL,'translations',NULL,1440180000,1440180000),('updateTranslations',2,'Update message translation',NULL,'translations',NULL,1440180000,1440180000),('uploadMedia',2,'Upload media',NULL,'mediaManagement',NULL,1440180000,1440180000),('user',1,'User',NULL,NULL,NULL,1440180000,1440180000),('viewComments',2,'View comments',NULL,'commentsManagement',NULL,1440180000,1440180000),('viewDashboard',2,'View dashboard',NULL,'dashboard',NULL,1440180000,1440180000),('viewMedia',2,'View media',NULL,'mediaManagement',NULL,1440180000,1440180000),('viewMediaAlbums',2,'View media albums',NULL,'mediaManagement',NULL,1440180000,1440180000),('viewMediaCategories',2,'View media categories',NULL,'mediaManagement',NULL,1440180000,1440180000),('viewMenuLinks',2,'View menu links',NULL,'menuManagement',NULL,1440180000,1440180000),('viewMenus',2,'View menus',NULL,'menuManagement',NULL,1440180000,1440180000),('viewPages',2,'View pages',NULL,'pageManagement',NULL,1440180000,1440180000),('viewPostCategories',2,'View post categories',NULL,'postManagement',NULL,1440180000,1440180000),('viewPosts',2,'View posts',NULL,'postManagement',NULL,1440180000,1440180000),('viewRegistrationIp',2,'View registration IP',NULL,'userManagement',NULL,1440180000,1440180000),('viewRolesAndPermissions',2,'View roles and permissions',NULL,'userManagement',NULL,1440180000,1440180000),('viewSeo',2,'View SEO records',NULL,'seoManagement',NULL,1440180000,1440180000),('viewTranslations',2,'View message translation',NULL,'translations',NULL,1440180000,1440180000),('viewUserEmail',2,'View user email',NULL,'userManagement',NULL,1440180000,1440180000),('viewUserRoles',2,'View user roles',NULL,'userManagement',NULL,1440180000,1440180000),('viewUsers',2,'View users',NULL,'userManagement',NULL,1440180000,1440180000),('viewVisitLog',2,'View visit log',NULL,'userManagement',NULL,1440180000,1440180000);

/*Table structure for table `auth_item_child` */

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_item_child` */

insert  into `auth_item_child`(`parent`,`child`) values ('administrator','assignRolesToUsers'),('administrator','author'),('administrator','bindUserToIp'),('administrator','changeGeneralSettings'),('administrator','changeOwnPassword'),('administrator','changeReadingSettings'),('administrator','changeUserPassword'),('administrator','createMenuLinks'),('administrator','createMenus'),('administrator','createPages'),('administrator','createSeo'),('administrator','createSourceMessages'),('administrator','createUsers'),('administrator','deleteMedia'),('administrator','deleteMediaAlbums'),('administrator','deleteMediaCategories'),('administrator','deletePages'),('administrator','deletePostCategories'),('administrator','deleteSeo'),('administrator','deleteSourceMessages'),('administrator','deleteUsers'),('administrator','editMenuLinks'),('administrator','editMenus'),('administrator','editPages'),('administrator','editSeo'),('administrator','editUserEmail'),('administrator','editUsers'),('administrator','flushCache'),('administrator','fullMenuAccess'),('administrator','fullMenuLinkAccess'),('administrator','fullPageAccess'),('administrator','fullSeoAccess'),('administrator','moderator'),('administrator','updateSourceMessages'),('administrator','updateTranslations'),('administrator','user'),('administrator','viewMenuLinks'),('administrator','viewMenus'),('administrator','viewPages'),('administrator','viewRolesAndPermissions'),('administrator','viewSeo'),('administrator','viewTranslations'),('administrator','viewUsers'),('assignRolesToUsers','/admin/user/user-permission/set'),('assignRolesToUsers','/admin/user/user-permission/set-roles'),('assignRolesToUsers','viewUserRoles'),('assignRolesToUsers','viewUsers'),('author','changeOwnPassword'),('author','createMediaAlbums'),('author','createPosts'),('author','editPosts'),('author','uploadMedia'),('author','user'),('author','viewDashboard'),('author','viewPosts'),('changeGeneralSettings','/admin/settings/default/index'),('changeReadingSettings','/admin/settings/reading/index'),('changeUserPassword','/admin/user/default/change-password'),('changeUserPassword','viewUsers'),('createMediaAlbums','/admin/media/album/create'),('createMediaAlbums','viewMediaAlbums'),('createMediaCategories','/admin/media/category/create'),('createMediaCategories','viewMediaCategories'),('createMenuLinks','/admin/menu/link/create'),('createMenuLinks','viewMenuLinks'),('createMenus','/admin/menu/default/create'),('createMenus','viewMenus'),('createPages','/admin/page/default/create'),('createPages','viewPages'),('createPostCategories','/admin/post/category/create'),('createPostCategories','viewPostCategories'),('createPosts','/admin/post/default/create'),('createPosts','viewPosts'),('createSeo','/admin/seo/default/create'),('createSeo','viewSeo'),('createSourceMessages','/admin/translation/source/create'),('createSourceMessages','updateSourceMessages'),('createSourceMessages','viewTranslations'),('createUsers','/admin/user/default/create'),('createUsers','viewUsers'),('deleteComments','/admin/comment/default/bulk-delete'),('deleteComments','/admin/comment/default/delete'),('deleteComments','viewComments'),('deleteMedia','/admin/media/manage/delete'),('deleteMedia','viewMedia'),('deleteMediaAlbums','/admin/media/album/bulk-delete'),('deleteMediaAlbums','/admin/media/album/delete'),('deleteMediaAlbums','viewMediaAlbums'),('deleteMediaCategories','/admin/media/category/bulk-delete'),('deleteMediaCategories','/admin/media/category/delete'),('deleteMediaCategories','viewMediaCategories'),('deleteMenuLinks','/admin/menu/link/bulk-delete'),('deleteMenuLinks','/admin/menu/link/delete'),('deleteMenuLinks','viewMenuLinks'),('deleteMenus','/admin/menu/default/bulk-delete'),('deleteMenus','/admin/menu/default/delete'),('deleteMenus','viewMenus'),('deletePages','/admin/page/default/bulk-delete'),('deletePages','/admin/page/default/delete'),('deletePages','viewPages'),('deletePostCategories','/admin/post/category/bulk-delete'),('deletePostCategories','/admin/post/category/delete'),('deletePostCategories','viewPostCategories'),('deletePosts','/admin/post/default/bulk-delete'),('deletePosts','/admin/post/default/delete'),('deletePosts','viewPosts'),('deleteSeo','/admin/seo/default/bulk-delete'),('deleteSeo','/admin/seo/default/delete'),('deleteSeo','viewSeo'),('deleteSourceMessages','/admin/translation/source/delete'),('deleteSourceMessages','updateSourceMessages'),('deleteSourceMessages','viewTranslations'),('deleteUsers','/admin/user/default/bulk-delete'),('deleteUsers','/admin/user/default/delete'),('deleteUsers','viewUsers'),('editComments','/admin/comment/default/bulk-activate'),('editComments','/admin/comment/default/bulk-deactivate'),('editComments','/admin/comment/default/bulk-spam'),('editComments','/admin/comment/default/bulk-trash'),('editComments','/admin/comment/default/toggle-attribute'),('editComments','/admin/comment/default/update'),('editComments','viewComments'),('editMedia','/admin/media/manage/update'),('editMedia','viewMedia'),('editMediaAlbums','/admin/media/album/toggle-attribute'),('editMediaAlbums','/admin/media/album/update'),('editMediaAlbums','viewMediaAlbums'),('editMediaCategories','/admin/media/category/toggle-attribute'),('editMediaCategories','/admin/media/category/update'),('editMediaCategories','viewMediaCategories'),('editMediaSettings','/admin/media/default/settings'),('editMediaSettings','/admin/media/manage/resize'),('editMediaSettings','viewMedia'),('editMenuLinks','/admin/menu/link/update'),('editMenuLinks','viewMenuLinks'),('editMenus','/admin/menu/default/update'),('editMenus','viewMenus'),('editPages','/admin/page/default/bulk-activate'),('editPages','/admin/page/default/bulk-deactivate'),('editPages','/admin/page/default/toggle-attribute'),('editPages','/admin/page/default/update'),('editPages','viewPages'),('editPostCategories','/admin/post/category/toggle-attribute'),('editPostCategories','/admin/post/category/update'),('editPostCategories','viewPostCategories'),('editPosts','/admin/post/default/bulk-activate'),('editPosts','/admin/post/default/bulk-deactivate'),('editPosts','/admin/post/default/toggle-attribute'),('editPosts','/admin/post/default/update'),('editPosts','viewPosts'),('editSeo','/admin/seo/default/bulk-activate'),('editSeo','/admin/seo/default/bulk-deactivate'),('editSeo','/admin/seo/default/toggle-attribute'),('editSeo','/admin/seo/default/update'),('editSeo','viewSeo'),('editUserEmail','viewUserEmail'),('editUsers','/admin/user/default/bulk-activate'),('editUsers','/admin/user/default/bulk-deactivate'),('editUsers','/admin/user/default/toggle-attribute'),('editUsers','/admin/user/default/update'),('editUsers','viewUsers'),('flushCache','/admin/settings/cache/flush'),('manageRolesAndPermissions','/admin/user/permission-groups/bulk-activate'),('manageRolesAndPermissions','/admin/user/permission-groups/bulk-deactivate'),('manageRolesAndPermissions','/admin/user/permission-groups/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission-groups/create'),('manageRolesAndPermissions','/admin/user/permission-groups/delete'),('manageRolesAndPermissions','/admin/user/permission-groups/toggle-attribute'),('manageRolesAndPermissions','/admin/user/permission-groups/update'),('manageRolesAndPermissions','/admin/user/permission/bulk-activate'),('manageRolesAndPermissions','/admin/user/permission/bulk-deactivate'),('manageRolesAndPermissions','/admin/user/permission/bulk-delete'),('manageRolesAndPermissions','/admin/user/permission/create'),('manageRolesAndPermissions','/admin/user/permission/delete'),('manageRolesAndPermissions','/admin/user/permission/refresh-routes'),('manageRolesAndPermissions','/admin/user/permission/set-child-permissions'),('manageRolesAndPermissions','/admin/user/permission/set-child-routes'),('manageRolesAndPermissions','/admin/user/permission/toggle-attribute'),('manageRolesAndPermissions','/admin/user/permission/update'),('manageRolesAndPermissions','/admin/user/role/bulk-activate'),('manageRolesAndPermissions','/admin/user/role/bulk-deactivate'),('manageRolesAndPermissions','/admin/user/role/bulk-delete'),('manageRolesAndPermissions','/admin/user/role/create'),('manageRolesAndPermissions','/admin/user/role/delete'),('manageRolesAndPermissions','/admin/user/role/set-child-permissions'),('manageRolesAndPermissions','/admin/user/role/set-child-roles'),('manageRolesAndPermissions','/admin/user/role/toggle-attribute'),('manageRolesAndPermissions','/admin/user/role/update'),('manageRolesAndPermissions','/admin/user/visit-log/bulk-activate'),('manageRolesAndPermissions','/admin/user/visit-log/bulk-deactivate'),('manageRolesAndPermissions','/admin/user/visit-log/bulk-delete'),('manageRolesAndPermissions','/admin/user/visit-log/create'),('manageRolesAndPermissions','/admin/user/visit-log/delete'),('manageRolesAndPermissions','/admin/user/visit-log/toggle-attribute'),('manageRolesAndPermissions','/admin/user/visit-log/update'),('manageRolesAndPermissions','editUsers'),('manageRolesAndPermissions','viewRolesAndPermissions'),('moderator','author'),('moderator','createMediaCategories'),('moderator','createPostCategories'),('moderator','deleteComments'),('moderator','deletePosts'),('moderator','editComments'),('moderator','editMediaAlbums'),('moderator','editMediaCategories'),('moderator','editPostCategories'),('moderator','fullMediaAccess'),('moderator','fullMediaAlbumAccess'),('moderator','fullMediaCategoryAccess'),('moderator','fullPostAccess'),('moderator','fullPostCategoryAccess'),('moderator','user'),('moderator','viewComments'),('moderator','viewDashboard'),('moderator','viewUserEmail'),('moderator','viewUsers'),('updateImmutableSourceMessages','updateSourceMessages'),('updateImmutableSourceMessages','viewTranslations'),('updateSourceMessages','/admin/translation/source/update'),('updateSourceMessages','updateTranslations'),('updateSourceMessages','viewTranslations'),('updateTranslations','viewTranslations'),('uploadMedia','/admin/media/manage/upload'),('uploadMedia','/admin/media/manage/uploader'),('uploadMedia','editMedia'),('uploadMedia','viewMedia'),('viewComments','/admin/comment/default/grid-page-size'),('viewComments','/admin/comment/default/grid-sort'),('viewComments','/admin/comment/default/index'),('viewComments','/admin/comment/default/view'),('viewDashboard','/admin/'),('viewDashboard','/admin/site/index'),('viewMedia','/admin/#mediafile'),('viewMedia','/admin/media/default/index'),('viewMedia','/admin/media/manage/index'),('viewMedia','/admin/media/manage/info'),('viewMediaAlbums','/admin/media/album/grid-page-size'),('viewMediaAlbums','/admin/media/album/grid-sort'),('viewMediaAlbums','/admin/media/album/index'),('viewMediaCategories','/admin/media/category/grid-page-size'),('viewMediaCategories','/admin/media/category/grid-sort'),('viewMediaCategories','/admin/media/category/index'),('viewMenuLinks','/admin/menu/link/grid-page-size'),('viewMenuLinks','/admin/menu/link/grid-sort'),('viewMenuLinks','/admin/menu/link/index'),('viewMenuLinks','/admin/menu/link/view'),('viewMenuLinks','viewMenus'),('viewMenus','/admin/menu/default/grid-page-size'),('viewMenus','/admin/menu/default/grid-sort'),('viewMenus','/admin/menu/default/index'),('viewMenus','/admin/menu/default/view'),('viewPages','/admin/page/default/grid-page-size'),('viewPages','/admin/page/default/grid-sort'),('viewPages','/admin/page/default/index'),('viewPages','/admin/page/default/view'),('viewPostCategories','/admin/post/category/grid-page-size'),('viewPostCategories','/admin/post/category/grid-sort'),('viewPostCategories','/admin/post/category/index'),('viewPosts','/admin/post/default/grid-page-size'),('viewPosts','/admin/post/default/grid-sort'),('viewPosts','/admin/post/default/index'),('viewPosts','/admin/post/default/view'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission-groups/grid-sort'),('viewRolesAndPermissions','/admin/user/permission-groups/index'),('viewRolesAndPermissions','/admin/user/permission-groups/view'),('viewRolesAndPermissions','/admin/user/permission/grid-page-size'),('viewRolesAndPermissions','/admin/user/permission/grid-sort'),('viewRolesAndPermissions','/admin/user/permission/index'),('viewRolesAndPermissions','/admin/user/permission/view'),('viewRolesAndPermissions','/admin/user/role/grid-page-size'),('viewRolesAndPermissions','/admin/user/role/grid-sort'),('viewRolesAndPermissions','/admin/user/role/index'),('viewRolesAndPermissions','/admin/user/role/view'),('viewRolesAndPermissions','viewUserRoles'),('viewRolesAndPermissions','viewUsers'),('viewSeo','/admin/seo/default/grid-page-size'),('viewSeo','/admin/seo/default/grid-sort'),('viewSeo','/admin/seo/default/index'),('viewSeo','/admin/seo/default/view'),('viewTranslations','/admin/translation/default/index'),('viewUsers','/admin/user/default/grid-page-size'),('viewUsers','/admin/user/default/grid-sort'),('viewUsers','/admin/user/default/index'),('viewUsers','/admin/user/default/view'),('viewVisitLog','/admin/user/visit-log/grid-page-size'),('viewVisitLog','/admin/user/visit-log/grid-sort'),('viewVisitLog','/admin/user/visit-log/index'),('viewVisitLog','/admin/user/visit-log/view');

/*Table structure for table `auth_item_group` */

DROP TABLE IF EXISTS `auth_item_group`;

CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_item_group` */

insert  into `auth_item_group`(`code`,`name`,`created_at`,`updated_at`) values ('commentsManagement','Comments Management',1440180000,1440180000),('dashboard','Dashboard',1440180000,1440180000),('mediaManagement','Media Management',1440180000,1440180000),('menuManagement','Menu Management',1440180000,1440180000),('pageManagement','Page Management',1440180000,1440180000),('postManagement','Post Management',1440180000,1440180000),('seoManagement','SEO Management',1440180000,1440180000),('settings','Settings',1440180000,1440180000),('translations','Translations',1440180000,1440180000),('userCommonPermissions','Common Permissions',1440180000,1440180000),('userManagement','User Management',1440180000,1440180000);

/*Table structure for table `auth_rule` */

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_rule` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL DEFAULT '',
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `super_parent_id` int(11) DEFAULT NULL COMMENT 'null-has no parent, int-1st level parent id',
  `parent_id` int(11) DEFAULT NULL COMMENT 'null-is not a reply, int-replied comment id',
  `content` text NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-pending,1-published,2-spam,3-deleted',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_model` (`model`),
  KEY `comment_model_id` (`model`,`model_id`),
  KEY `comment_status` (`status`),
  KEY `comment_reply` (`parent_id`),
  KEY `comment_super_parent_id` (`super_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `size` varchar(255) NOT NULL,
  `thumbs` text,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_album_id` (`album_id`),
  KEY `fk_media_created_by` (`created_by`),
  KEY `fk_media_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_album` FOREIGN KEY (`album_id`) REFERENCES `media_album` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media` */

/*Table structure for table `media_album` */

DROP TABLE IF EXISTS `media_album`;

CREATE TABLE `media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_album_slug` (`slug`),
  KEY `media_album_category_id` (`category_id`),
  KEY `media_album_visible` (`visible`),
  KEY `fk_media_album_created_by` (`created_by`),
  KEY `fk_media_album_updated_by` (`updated_by`),
  CONSTRAINT `fk_album_category_id` FOREIGN KEY (`category_id`) REFERENCES `media_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_album_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media_album` */

insert  into `media_album`(`id`,`category_id`,`title`,`slug`,`description`,`visible`,`created_at`,`updated_at`,`created_by`,`updated_by`) values (1,1,'Workshop','workshop','',1,1461146891,1461146891,1,1);

/*Table structure for table `media_album_lang` */

DROP TABLE IF EXISTS `media_album_lang`;

CREATE TABLE `media_album_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_album_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_album_lang_id` (`media_album_id`),
  KEY `media_album_lang_language` (`language`),
  CONSTRAINT `fk_media_album_lang` FOREIGN KEY (`media_album_id`) REFERENCES `media_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media_album_lang` */

insert  into `media_album_lang`(`id`,`media_album_id`,`language`,`title`,`description`) values (1,1,'en-US','Workshop','');

/*Table structure for table `media_category` */

DROP TABLE IF EXISTS `media_category`;

CREATE TABLE `media_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_category_slug` (`slug`),
  KEY `media_category_visible` (`visible`),
  KEY `fk_media_category_created_by` (`created_by`),
  KEY `fk_media_category_updated_by` (`updated_by`),
  CONSTRAINT `fk_media_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_media_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media_category` */

insert  into `media_category`(`id`,`slug`,`title`,`description`,`visible`,`created_at`,`updated_at`,`created_by`,`updated_by`) values (1,'general','General','',1,1461146872,1461146872,1,1);

/*Table structure for table `media_category_lang` */

DROP TABLE IF EXISTS `media_category_lang`;

CREATE TABLE `media_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_category_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_category_lang_id` (`media_category_id`),
  KEY `media_category_lang_language` (`language`),
  CONSTRAINT `fk_media_category_lang` FOREIGN KEY (`media_category_id`) REFERENCES `media_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media_category_lang` */

insert  into `media_category_lang`(`id`,`media_category_id`,`language`,`title`,`description`) values (1,1,'en-US','General','');

/*Table structure for table `media_lang` */

DROP TABLE IF EXISTS `media_lang`;

CREATE TABLE `media_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `media_lang_id` (`media_id`),
  KEY `media_lang_language` (`language`),
  CONSTRAINT `fk_media_lang` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `media_lang` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_created_by` (`created_by`),
  KEY `fk_menu_updated_by` (`updated_by`),
  CONSTRAINT `fk_menu_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`created_at`,`updated_at`,`created_by`,`updated_by`) values ('admin-menu',0,NULL,1,NULL),('main-menu',0,NULL,1,NULL);

/*Table structure for table `menu_lang` */

DROP TABLE IF EXISTS `menu_lang`;

CREATE TABLE `menu_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_lang_post_id` (`menu_id`),
  KEY `menu_lang_language` (`language`),
  CONSTRAINT `fk_menu_lang` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `menu_lang` */

insert  into `menu_lang`(`id`,`menu_id`,`language`,`title`) values (1,'admin-menu','en-US','Control Panel Menu'),(2,'main-menu','en-US','Main Menu');

/*Table structure for table `menu_link` */

DROP TABLE IF EXISTS `menu_link`;

CREATE TABLE `menu_link` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alwaysVisible` smallint(1) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_link_created_by` (`created_by`),
  KEY `fk_menu_link_updated_by` (`updated_by`),
  KEY `link_menu_id` (`menu_id`),
  KEY `link_parent_id` (`parent_id`),
  CONSTRAINT `fk_menu_link` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_menu_link_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_link_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu_link` */

insert  into `menu_link`(`id`,`menu_id`,`link`,`parent_id`,`image`,`alwaysVisible`,`order`,`created_at`,`updated_at`,`created_by`,`updated_by`) values ('about','main-menu','/site/about','',NULL,1,9,0,NULL,1,NULL),('comment','admin-menu','/comment/default/index','','comment',0,8,0,NULL,1,NULL),('contact','main-menu','/site/contact','',NULL,1,10,0,NULL,1,NULL),('dashboard','admin-menu','/','','th',0,1,0,NULL,1,NULL),('home','main-menu','/site/index','',NULL,1,1,0,NULL,1,NULL),('image-settings','admin-menu','/media/default/settings','settings',NULL,0,5,0,NULL,1,NULL),('media','admin-menu',NULL,'','image',0,5,0,NULL,1,NULL),('media-album','admin-menu','/media/album/index','media',NULL,0,2,0,NULL,1,NULL),('media-category','admin-menu','/media/category/index','media',NULL,0,3,0,NULL,1,NULL),('media-media','admin-menu','/media/default/index','media',NULL,0,1,0,NULL,1,NULL),('menu','admin-menu','/menu/default/index','','align-justify',0,10,0,NULL,1,NULL),('page','admin-menu','/page/default/index','','file',0,2,0,NULL,1,NULL),('post','admin-menu',NULL,'','pencil',0,3,0,NULL,1,NULL),('post-category','admin-menu','/post/category/index','post',NULL,0,2,0,NULL,1,NULL),('post-post','admin-menu','/post/default/index','post',NULL,0,1,0,NULL,1,NULL),('seo','admin-menu','/seo/default/index','','line-chart',0,19,0,NULL,1,NULL),('settings','admin-menu',NULL,'','cog',0,20,0,NULL,1,NULL),('settings-cache','admin-menu','/settings/cache/flush','settings',NULL,0,99,0,NULL,1,NULL),('settings-general','admin-menu','/settings/default/index','settings',NULL,0,1,0,NULL,1,NULL),('settings-reading','admin-menu','/settings/reading/index','settings',NULL,0,2,0,NULL,1,NULL),('settings-translations','admin-menu','/translation/default/index','settings',NULL,0,5,0,NULL,1,NULL),('test-page','main-menu','/site/test','',NULL,1,2,0,NULL,1,NULL),('user','admin-menu',NULL,'','user',0,15,0,NULL,1,NULL),('user-groups','admin-menu','/user/permission-groups/index','user',NULL,0,4,0,NULL,1,NULL),('user-log','admin-menu','/user/visit-log/index','user',NULL,0,10,0,NULL,1,NULL),('user-permission','admin-menu','/user/permission/index','user',NULL,0,3,0,NULL,1,NULL),('user-role','admin-menu','/user/role/index','user',NULL,0,2,0,NULL,1,NULL),('user-user','admin-menu','/user/default/index','user',NULL,0,1,0,NULL,1,NULL);

/*Table structure for table `menu_link_lang` */

DROP TABLE IF EXISTS `menu_link_lang`;

CREATE TABLE `menu_link_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(6) NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_link_lang_link_id` (`link_id`),
  KEY `menu_link_lang_language` (`language`),
  CONSTRAINT `fk_menu_link_lang` FOREIGN KEY (`link_id`) REFERENCES `menu_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `menu_link_lang` */

insert  into `menu_link_lang`(`id`,`link_id`,`language`,`label`) values (1,'dashboard','en-US','Dashboard'),(2,'settings','en-US','Settings'),(3,'settings-general','en-US','General Settings'),(4,'settings-reading','en-US','Reading Settings'),(5,'settings-cache','en-US','Flush Cache'),(6,'menu','en-US','Menus'),(7,'comment','en-US','Comments'),(8,'user','en-US','Users'),(9,'user-groups','en-US','Permission groups'),(10,'user-log','en-US','Visit log'),(11,'user-permission','en-US','Permissions'),(12,'user-role','en-US','Roles'),(13,'user-user','en-US','Users'),(14,'post','en-US','Posts'),(15,'post-post','en-US','Posts'),(16,'post-category','en-US','Categories'),(17,'media','en-US','Media'),(18,'media-media','en-US','Media'),(19,'media-album','en-US','Albums'),(20,'media-category','en-US','Categories'),(21,'image-settings','en-US','Image Settings'),(22,'page','en-US','Pages'),(23,'settings-translations','en-US','Message Translation'),(24,'seo','en-US','SEO'),(25,'home','en-US','Home'),(26,'about','en-US','About'),(27,'test-page','en-US','Test Page'),(28,'contact','en-US','Contact');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `language` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`),
  KEY `message_index` (`source_id`,`language`),
  CONSTRAINT `fk_message_source_message` FOREIGN KEY (`source_id`) REFERENCES `message_source` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `message_source` */

DROP TABLE IF EXISTS `message_source`;

CREATE TABLE `message_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text NOT NULL,
  `immutable` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

/*Data for the table `message_source` */

insert  into `message_source`(`id`,`category`,`message`,`immutable`) values (1,'yee','--- With selected ---',1),(2,'yee','Activate',1),(3,'yee','Active',1),(4,'yee','Add New',1),(5,'yee','All',1),(6,'yee','Always Visible',1),(7,'yee','An unknown error occurred.',1),(8,'yee','Approved',1),(9,'yee','Author',1),(10,'yee','Banned',1),(11,'yee','Bind to IP',1),(12,'yee','Browse',1),(13,'yee','Browser',1),(14,'yee','Cancel',1),(15,'yee','Category',1),(16,'yee','Clear filters',1),(17,'yee','Closed',1),(18,'yee','Code',1),(19,'yee','Comment Status',1),(20,'yee','Comments Activity',1),(21,'yee','Confirm',1),(22,'yee','Confirmation Token',1),(23,'yee','Content',1),(24,'yee','Control Panel',1),(25,'yee','Create {item}',1),(26,'yee','Create',1),(27,'yee','Created By',1),(28,'yee','Created',1),(29,'yee','Dashboard',1),(30,'yee','Data',1),(31,'yee','Deactivate',1),(32,'yee','Default Language',1),(33,'yee','Default Value',1),(34,'yee','Delete',1),(35,'yee','Description',1),(36,'yee','E-mail confirmed',1),(37,'yee','E-mail',1),(38,'yee','Edit',1),(39,'yee','Error',1),(40,'yee','For example',1),(41,'yee','Group',1),(42,'yee','ID',1),(43,'yee','IP',1),(44,'yee','Icon',1),(45,'yee','Inactive',1),(46,'yee','Insert',1),(47,'yee','Invalid settings for dashboard widgets',1),(48,'yee','Key',1),(49,'yee','Label',1),(50,'yee','Language',1),(51,'yee','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(52,'yee','Link',1),(53,'yee','Login',1),(54,'yee','Logout {username}',1),(55,'yee','Menu ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(56,'yee','Menu',1),(57,'yee','Name',1),(58,'yee','No Parent',1),(59,'yee','No comments found.',1),(60,'yee','Not Selected',1),(61,'yee','OK',1),(62,'yee','OS',1),(63,'yee','Open',1),(64,'yee','Order',1),(65,'yee','PHP Version',1),(66,'yee','Parent Link',1),(67,'yee','Password',1),(68,'yee','Pending',1),(69,'yee','Processing',1),(70,'yee','Publish',1),(71,'yee','Published',1),(72,'yee','Read more',1),(73,'yee','Records per page',1),(74,'yee','Registration IP',1),(75,'yee','Repeat password',1),(76,'yee','Required',1),(77,'yee','Revision',1),(78,'yee','Role',1),(79,'yee','Roles',1),(80,'yee','Rule',1),(81,'yee','Save All',1),(82,'yee','Save',1),(83,'yee','Saved',1),(84,'yee','Settings',1),(85,'yee','Size',1),(86,'yee','Slug',1),(87,'yee','Spam',1),(88,'yee','Start',1),(89,'yee','Status',1),(90,'yee','Superadmin',1),(91,'yee','System Info',1),(92,'yee','The changes have been saved.',1),(93,'yee','This e-mail already exists',1),(94,'yee','Title',1),(95,'yee','Token',1),(96,'yee','Trash',1),(97,'yee','Type',1),(98,'yee','URL',1),(99,'yee','Unpublish',1),(100,'yee','Update \"{item}\"',1),(101,'yee','Update',1),(102,'yee','Updated By',1),(103,'yee','Updated',1),(104,'yee','Uploaded',1),(105,'yee','User agent',1),(106,'yee','User',1),(107,'yee','Username',1),(108,'yee','Value',1),(109,'yee','View',1),(110,'yee','Visible',1),(111,'yee','Visit Time',1),(112,'yee','Wrong format. Enter valid IPs separated by comma',1),(113,'yee','Yee CMS Version',1),(114,'yee','Yee Core Version',1),(115,'yee','Yii Framework Version',1),(116,'yee','Your item has been updated.',1),(117,'yee/translation','Add New Source Message',1),(118,'yee/translation','Category',1),(119,'yee/translation','Create Message Source',1),(120,'yee/translation','Create New Category',1),(121,'yee/translation','Immutable',1),(122,'yee/translation','Message Translation',1),(123,'yee/translation','New Category Name',1),(124,'yee/translation','Please, select message group and language to view translations...',1),(125,'yee/translation','Source Message',1),(126,'yee/translation','Update Message Source',1),(127,'yee/translation','{n, plural, =1{1 message} other{# messages}}',1),(128,'yee/media','Add files',1),(129,'yee/media','Album',1),(130,'yee/media','Albums',1),(131,'yee/media','All Media Items',1),(132,'yee/media','Alt Text',1),(133,'yee/media','Back to file manager',1),(134,'yee/media','Cancel upload',1),(135,'yee/media','Categories',1),(136,'yee/media','Category',1),(137,'yee/media','Changes have been saved.',1),(138,'yee/media','Changes haven\'t been saved.',1),(139,'yee/media','Create Category',1),(140,'yee/media','Current thumbnail sizes',1),(141,'yee/media','Dimensions',1),(142,'yee/media','Do resize thumbnails',1),(143,'yee/media','File Size',1),(144,'yee/media','Filename',1),(145,'yee/media','If you change the thumbnails sizes, it is strongly recommended resize image thumbnails.',1),(146,'yee/media','Image Settings',1),(147,'yee/media','Large size',1),(148,'yee/media','Manage Albums',1),(149,'yee/media','Manage Categories',1),(150,'yee/media','Media Activity',1),(151,'yee/media','Media Details',1),(152,'yee/media','Media',1),(153,'yee/media','Medium size',1),(154,'yee/media','No images found.',1),(155,'yee/media','Original',1),(156,'yee/media','Please, select file to view details.',1),(157,'yee/media','Select image size',1),(158,'yee/media','Small size',1),(159,'yee/media','Start upload',1),(160,'yee/media','Thumbnails settings',1),(161,'yee/media','Thumbnails sizes has been resized successfully!',1),(162,'yee/media','Thumbnails',1),(163,'yee/media','Update Category',1),(164,'yee/media','Updated By',1),(165,'yee/media','Upload New File',1),(166,'yee/media','Uploaded By',1),(167,'yee/menu','Menu',1),(168,'yee/menu','Menus',1),(169,'yee/menu','Link ID can only contain lowercase alphanumeric characters, underscores and dashes.',1),(170,'yee/menu','Parent Link',1),(171,'yee/menu','Always Visible',1),(172,'yee/menu','No Parent',1),(173,'yee/menu','Create Menu Link',1),(174,'yee/menu','Update Menu Link',1),(175,'yee/menu','Menu Links',1),(176,'yee/menu','Add New Menu',1),(177,'yee/menu','Add New Link',1),(178,'yee/menu','An error occurred during saving menu!',1),(179,'yee/menu','The changes have been saved.',1),(180,'yee/menu','Please, select menu to view menu links...',1),(181,'yee/menu','Selected menu doesn\'t contain any link. Click \"Add New Link\" to create a link for this menu.',1),(182,'yee/page','Page',1),(183,'yee/page','Pages',1),(184,'yee/page','Create Page',1),(185,'yee/post','No posts found. ',1),(186,'yee/post','Post',1),(187,'yee/post','Posted in',1),(188,'yee/post','Posts Activity',1),(189,'yee/post','Posts',1),(190,'yee/post','Thumbnail',1),(191,'yee/settings','General Settings',1),(192,'yee/settings','Reading Settings',1),(193,'yee/settings','Site Title',1),(194,'yee/settings','Site Description',1),(195,'yee/settings','Admin Email',1),(196,'yee/settings','Timezone',1),(197,'yee/settings','Date Format',1),(198,'yee/settings','Time Format',1),(199,'yee/settings','Page Size',1),(200,'yee/user','Child permissions',1),(201,'yee/user','Child roles',1),(202,'yee/user','Create Permission Group',1),(203,'yee/user','Create Permission',1),(204,'yee/user','Create Role',1),(205,'yee/user','Create User',1),(206,'yee/user','Log №{id}',1),(207,'yee/user','No users found.',1),(208,'yee/user','Password',1),(209,'yee/user','Permission Groups',1),(210,'yee/user','Permission',1),(211,'yee/user','Permissions for \"{role}\" role',1),(212,'yee/user','Permissions',1),(213,'yee/user','Refresh routes',1),(214,'yee/user','Registration date',1),(215,'yee/user','Role',1),(216,'yee/user','Roles and Permissions for \"{user}\"',1),(217,'yee/user','Roles',1),(218,'yee/user','Routes',1),(219,'yee/user','Search route',1),(220,'yee/user','Show all',1),(221,'yee/user','Show only selected',1),(222,'yee/user','Update Permission Group',1),(223,'yee/user','Update Permission',1),(224,'yee/user','Update Role',1),(225,'yee/user','Update User Password',1),(226,'yee/user','Update User',1),(227,'yee/user','User not found',1),(228,'yee/user','User',1),(229,'yee/user','Users',1),(230,'yee/user','Visit Log',1),(231,'yee/user','You can not change own permissions',1),(232,'yee/user','You can\'t update own permissions!',1),(233,'yee/user','{permission} Permission Settings',1),(234,'yee/user','{permission} Role Settings',1),(235,'yee/auth','Are you sure you want to delete your profile picture?',1),(236,'yee/auth','Are you sure you want to unlink this authorization?',1),(237,'yee/auth','Authentication error occurred.',1),(238,'yee/auth','Authorization',1),(239,'yee/auth','Authorized Services',1),(240,'yee/auth','Captcha',1),(241,'yee/auth','Change profile picture',1),(242,'yee/auth','Check your E-mail for further instructions',1),(243,'yee/auth','Check your e-mail {email} for instructions to activate account',1),(244,'yee/auth','Click to connect with service',1),(245,'yee/auth','Click to unlink service',1),(246,'yee/auth','Confirm E-mail',1),(247,'yee/auth','Confirm',1),(248,'yee/auth','Could not send confirmation email',1),(249,'yee/auth','Current password',1),(250,'yee/auth','E-mail confirmation for',1),(251,'yee/auth','E-mail confirmed',1),(252,'yee/auth','E-mail is invalid',1),(253,'yee/auth','E-mail with activation link has been sent to <b>{email}</b>. This link will expire in {minutes} min.',1),(254,'yee/auth','E-mail',1),(255,'yee/auth','Forgot password?',1),(256,'yee/auth','Incorrect username or password',1),(257,'yee/auth','Login has been taken',1),(258,'yee/auth','Login',1),(259,'yee/auth','Logout',1),(260,'yee/auth','Non Authorized Services',1),(261,'yee/auth','Password has been updated',1),(262,'yee/auth','Password recovery',1),(263,'yee/auth','Password reset for',1),(264,'yee/auth','Password',1),(265,'yee/auth','Registration - confirm your e-mail',1),(266,'yee/auth','Registration',1),(267,'yee/auth','Remember me',1),(268,'yee/auth','Remove profile picture',1),(269,'yee/auth','Repeat password',1),(270,'yee/auth','Reset Password',1),(271,'yee/auth','Reset',1),(272,'yee/auth','Save Profile',1),(273,'yee/auth','Save profile picture',1),(274,'yee/auth','Set Password',1),(275,'yee/auth','Set Username',1),(276,'yee/auth','Signup',1),(277,'yee/auth','This E-mail already exists',1),(278,'yee/auth','Token not found. It may be expired',1),(279,'yee/auth','Token not found. It may be expired. Try reset password once more',1),(280,'yee/auth','Too many attempts',1),(281,'yee/auth','Unable to send message for email provided',1),(282,'yee/auth','Update Password',1),(283,'yee/auth','User Profile',1),(284,'yee/auth','User with the same email as in {client} account already exists but isn\'t linked to it. Login using email first to link it.',1),(285,'yee/auth','Wrong password',1),(286,'yee/auth','You could not login from this IP',1),(287,'yee/seo','Create SEO Record',1),(288,'yee/seo','Follow',1),(289,'yee/seo','Index',1),(290,'yee/seo','Keywords',1),(291,'yee/seo','SEO',1),(292,'yee/seo','Search Engine Optimization',1),(293,'yee/seo','Update SEO Record',1);

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `alias` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `migration` */

insert  into `migration`(`version`,`alias`,`apply_time`) values ('m000000_000000_base','@app/migrations',1461142431),('m130524_201442_init','@app/migrations',1461142434),('m150319_150657_alter_user_table','@yeesoft/yii2-yee-core/migrations/',1461142438),('m150319_155941_init_yee_core','@yeesoft/yii2-yee-core/migrations/',1461142441),('m150319_184824_init_settings','@yeesoft/yii2-yee-core/migrations/',1461142442),('m150319_194321_init_menus','@yeesoft/yii2-yee-core/migrations/',1461142451),('m150320_102452_init_translations','@yeesoft/yii2-yee-translation/migrations/',1461142454),('m150628_124401_create_media_table','@yeesoft/yii2-yee-media/migrations/',1461142457),('m150630_121101_create_post_table','@yeesoft/yii2-yee-post/migrations/',1461142461),('m150703_182055_create_auth_table','@yeesoft/yii2-yee-auth/migrations/',1461142463),('m150706_175101_create_comment_table','@yeesoft/yii2-comments/migrations/',1461142464),('m150719_154955_add_setting_menu_links','@yeesoft/yii2-yee-settings/migrations/',1461142465),('m150719_182533_add_menu_and_links','@yeesoft/yii2-yee-menu/migrations/',1461142465),('m150727_175300_add_comments_menu_links','@yeesoft/yii2-yee-comment/migrations/',1461142465),('m150729_121634_add_user_menu_links','@yeesoft/yii2-yee-user/migrations/',1461142466),('m150729_122614_add_post_menu_links','@yeesoft/yii2-yee-post/migrations/',1461142467),('m150729_131014_add_media_menu_links','@yeesoft/yii2-yee-media/migrations/',1461142468),('m150731_150101_create_page_table','@yeesoft/yii2-yee-page/migrations/',1461142472),('m150731_150644_add_page_menu_links','@yeesoft/yii2-yee-page/migrations/',1461142473),('m150821_140141_add_core_permissions','@yeesoft/yii2-yee-core/migrations/',1461142475),('m150825_202231_add_post_permissions','@yeesoft/yii2-yee-post/migrations/',1461142479),('m150825_205531_add_user_permissions','@yeesoft/yii2-yee-user/migrations/',1461142765),('m150825_211322_add_menu_permissions','@yeesoft/yii2-yee-menu/migrations/',1461142767),('m150825_212310_add_settings_permissions','@yeesoft/yii2-yee-settings/migrations/',1461142768),('m150825_212941_add_comments_permissions','@yeesoft/yii2-yee-comment/migrations/',1461142770),('m150825_213610_add_media_permissions','@yeesoft/yii2-yee-media/migrations/',1461142774),('m150825_220620_add_page_permissions','@yeesoft/yii2-yee-page/migrations/',1461142777),('m151116_212614_add_translations_menu_links','@yeesoft/yii2-yee-translation/migrations/',1461142777),('m151121_091144_i18n_yee_source','@yeesoft/yii2-yee-core/migrations/',1461142784),('m151121_131210_add_translation_permissions','@yeesoft/yii2-yee-translation/migrations/',1461142786),('m151121_184634_i18n_yee_translation_source','@yeesoft/yii2-yee-translation/migrations/',1461142786),('m151121_225504_i18n_yee_media_source','@yeesoft/yii2-yee-media/migrations/',1461142788),('m151121_232115_i18n_yee_menu_source','@yeesoft/yii2-yee-menu/migrations/',1461142789),('m151121_233615_i18n_yee_page_source','@yeesoft/yii2-yee-page/migrations/',1461142789),('m151121_233715_i18n_yee_post_source','@yeesoft/yii2-yee-post/migrations/',1461142789),('m151121_235015_i18n_yee_settings_source','@yeesoft/yii2-yee-settings/migrations/',1461142790),('m151121_235512_i18n_yee_user_source','@yeesoft/yii2-yee-user/migrations/',1461142792),('m151126_061233_i18n_yee_auth_source','@yeesoft/yii2-yee-auth/migrations/',1461142795),('m151226_230101_create_seo_table','@yeesoft/yii2-yee-seo/migrations/.',1461142799),('m151226_231101_add_seo_menu_links','@yeesoft/yii2-yee-seo/migrations/.',1461142800),('m151226_233401_add_seo_permissions','@yeesoft/yii2-yee-seo/migrations/.',1461142802),('m151226_234401_i18n_yee_seo_source','@yeesoft/yii2-yee-seo/migrations/.',1461142803),('m160131_124523_init_demo','@app/migrations',1461142805),('m160207_123123_add_super_parent_id','@yeesoft/yii2-comments/migrations/',1461142807),('m160414_212551_add_view_page','@yeesoft/yii2-yee-page/migrations/',1461142809),('m160414_212558_add_view_post','@yeesoft/yii2-yee-post/migrations/',1461142810);

/*Table structure for table `page` */

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL DEFAULT '',
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `published_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(11) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'page',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `fk_page_updated_by` (`updated_by`),
  KEY `page_slug` (`slug`),
  KEY `page_status` (`status`),
  KEY `page_author` (`created_by`),
  CONSTRAINT `fk_page_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_page_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `page` */

insert  into `page`(`id`,`slug`,`status`,`comment_status`,`published_at`,`created_by`,`created_at`,`updated_at`,`updated_by`,`revision`,`view`,`layout`) values (1,'test',1,0,1440720000,1,1440763228,1440771930,1,1,'page','main');

/*Table structure for table `page_lang` */

DROP TABLE IF EXISTS `page_lang`;

CREATE TABLE `page_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `page_lang_post_id` (`page_id`),
  KEY `page_lang_language` (`language`),
  CONSTRAINT `fk_page_lang` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `page_lang` */

insert  into `page_lang`(`id`,`page_id`,`language`,`title`,`content`) values (1,1,'en-US','Test Page','<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer id ullamcorper nibh, id blandit ante. Suspendisse non ante commodo, finibus nibh at, sollicitudin felis. Aliquam interdum eros eget tempor porta. Quisque viverra velit magna, ac eleifend mi vehicula nec. Curabitur sollicitudin metus eget odio posuere pulvinar. Nullam vestibulum massa ac dolor mattis pharetra. Vestibulum finibus non massa ut cursus.</p><p style=\"text-align: justify;\">Proin eget ullamcorper elit, ac luctus ex. Pellentesque mattis nibh nec nunc fermentum lobortis. Cras malesuada ipsum eget massa pulvinar euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pellentesque, tortor in efficitur semper, tellus lorem blandit augue, sed euismod purus velit nec libero. Pellentesque dictum faucibus augue, ac rutrum velit. Quisque tristique neque sit amet turpis consectetur rutrum. Aliquam ac vulputate mauris.</p>');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(127) NOT NULL DEFAULT '',
  `category_id` int(11) DEFAULT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-pending,1-published',
  `comment_status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-closed,1-open',
  `thumbnail` varchar(255) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `revision` int(11) NOT NULL DEFAULT '1',
  `view` varchar(255) NOT NULL DEFAULT 'post',
  `layout` varchar(255) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `fk_post_updated_by` (`updated_by`),
  KEY `post_slug` (`slug`),
  KEY `post_category_id` (`category_id`),
  KEY `post_status` (`status`),
  KEY `post_author` (`created_by`),
  CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`id`,`slug`,`category_id`,`status`,`comment_status`,`thumbnail`,`published_at`,`created_at`,`updated_at`,`created_by`,`updated_by`,`revision`,`view`,`layout`) values (1,'welcome-to-yii-framework-indonesia',NULL,1,0,'',1440720000,1440763228,1461146324,1,1,4,'post','main');

/*Table structure for table `post_category` */

DROP TABLE IF EXISTS `post_category`;

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `visible` int(11) NOT NULL DEFAULT '1' COMMENT '0-hidden,1-visible',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `left_border` int(11) NOT NULL,
  `right_border` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_category_slug` (`slug`),
  KEY `post_category_visible` (`visible`),
  KEY `fk_post_category_created_by` (`created_by`),
  KEY `fk_post_category_updated_by` (`updated_by`),
  KEY `left_border` (`left_border`,`right_border`),
  KEY `right_border` (`right_border`),
  CONSTRAINT `fk_post_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_category_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `post_category` */

insert  into `post_category`(`id`,`slug`,`visible`,`created_at`,`updated_at`,`created_by`,`updated_by`,`left_border`,`right_border`,`depth`) values (1,'root',0,1455033000,NULL,NULL,NULL,0,2147483647,0);

/*Table structure for table `post_category_lang` */

DROP TABLE IF EXISTS `post_category_lang`;

CREATE TABLE `post_category_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `post_category_lang_id` (`post_category_id`),
  KEY `post_category_lang_language` (`language`),
  CONSTRAINT `fk_post_category_lang` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `post_category_lang` */

/*Table structure for table `post_lang` */

DROP TABLE IF EXISTS `post_lang`;

CREATE TABLE `post_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language` varchar(6) NOT NULL,
  `title` text NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `post_lang_post_id` (`post_id`),
  KEY `post_lang_language` (`language`),
  CONSTRAINT `fk_post_lang` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `post_lang` */

insert  into `post_lang`(`id`,`post_id`,`language`,`title`,`content`) values (1,1,'en-US','Welcome to Yii Framework Indonesia','<h1 style=\"box-sizing: border-box; margin: 20px 0px 10px; font-size: 36px; font-family: \'Open Sans\', sans-serif; font-weight: 500; line-height: 1.1; color: #333333;\">&nbsp;</h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; line-height: 20px;\">Selamat datang di web resmi komunitas Yii Framework Indonesia!!!..</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; line-height: 20px;\">Yii adalah satu dari sekian banyak PHP Framework yang terbukti memiliki penggemar yang sangat banyak di seluruh dunia maupun di Indonesia. Yii Framework terbukti digemari oleh banyak praktisi programmer yang ingin membuat aplikasi mereka cepat, aman, dan profesional.&nbsp;<em style=\"box-sizing: border-box;\">Tagline&nbsp;</em>ini tidak dibuat tanpa alasan karena Yii Framework terbukti merupakan framework yang dapat membuat aplikasi apapun dengan cepat karena didukung oleh internal fitur yang lengkap dan fungsional. Disisi lain, isu keamanan data dan skrip kode menjadi hal yang amat dipertimbangkan oleh ratusan&nbsp;kontributor Yii Framework di seluruh dunia. Yii Framework terbukti mampu mengatasi semua isu-isu keamanan web yang menjadi topik pembicaraan semua ahli-ahli di bidang keamanan data. Sebut saja SQL injection, XSS script, dsb.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; line-height: 20px;\">Kehadiran website ini untuk menunjukkan eksistensi komunitas Yii Framework di Indonesia. Kami, para pengurus web ini meluangkan waktu untuk membantu teman-teman dari seluruh Indonesia untuk belajar Yii Framework. Kami sangat terbantu dan&nbsp;sudah merasakan manfaat yang besar dari penggunaan Framework ini, maka kami ingin berbagi dan membantu teman-teman di seluruh Indonesia untuk ayo!!!.. kita belajar dan menguasai framework ini.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: \'Open Sans\', sans-serif; font-size: 14px; line-height: 20px;\">Dalam&nbsp;web ini, secara bersama-sama akan&nbsp;dikelola oleh&nbsp;<strong style=\"box-sizing: border-box;\">Misbahul Munir</strong>&nbsp;- Yii2 International Contributor,&nbsp;<strong style=\"box-sizing: border-box;\">Hafid Mukhlazin</strong>&nbsp;- Yii2 Indonesian Book Writer,&nbsp;<strong style=\"box-sizing: border-box;\">Henry Dewa</strong>&nbsp;-&nbsp;<span style=\"font-family: \'Source Sans Pro\', Calibri, Candara, Arial, sans-serif; font-size: 15px; line-height: 21.4286px; text-align: justify;\">Yii Enthuasiast</span>,&nbsp;<strong style=\"box-sizing: border-box;\">Surya Shaillendra</strong>&nbsp;- Master Yii,&nbsp;<strong style=\"box-sizing: border-box;\">Muhammad Cahya</strong>&nbsp;- Yii Enthuasiast,&nbsp;<strong style=\"box-sizing: border-box;\">Peter Kambey</strong>&nbsp;- Admin Group Yii Framework Facebook Group.</p>');

/*Table structure for table `seo` */

DROP TABLE IF EXISTS `seo`;

CREATE TABLE `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(127) NOT NULL DEFAULT '',
  `keywords` text,
  `description` text,
  `index` smallint(6) NOT NULL DEFAULT '1',
  `follow` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `seo_created_by` (`created_by`),
  KEY `seo_url` (`url`),
  KEY `seo_author` (`created_by`),
  KEY `fk_seo_updated_by` (`updated_by`),
  CONSTRAINT `fk_seo_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_seo_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `seo` */

insert  into `seo`(`id`,`url`,`title`,`author`,`keywords`,`description`,`index`,`follow`,`created_at`,`updated_at`,`created_by`,`updated_by`) values (1,'/en','Homepage','Site Owner','yii2, cms, yeecms','Seo meta description',1,1,1452544164,1452545049,1,1);

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'general',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `setting_group_lang` (`group`,`key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `setting` */

insert  into `setting`(`id`,`group`,`key`,`language`,`value`,`description`) values (1,'general','title','en-US','Yii Framework Indonesia',NULL),(2,'general','description','en-US','',NULL),(3,'general','email',NULL,'admin@yiiframework.id',NULL),(4,'general','timezone',NULL,'Asia/Bangkok',NULL),(5,'general','dateformat',NULL,'dd/MM/yyyy',NULL),(6,'general','timeformat',NULL,'h:mm a',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `superadmin` smallint(6) DEFAULT '0',
  `avatar` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT '0',
  `bind_to_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`superadmin`,`avatar`,`created_at`,`updated_at`,`confirmation_token`,`email_confirmed`,`bind_to_ip`,`registration_ip`) values (1,'root','','$2y$13$mpPCztYLmJvS4oLZloHAheMTj9OXIm3cVkGhP6.jBqfqGe2LUeNSy',NULL,'admin@yiiframework.id',10,1,NULL,0,0,NULL,0,NULL,NULL),(2,'peterjkambey','ceuJGmkZIk0RaL0R9wpwanq2UolP_ruu','$2y$13$uwJDBm7eK27uEeB7J8MQGedw/upi7mn7ppiDKDOCKC2KzpMuUlEHm',NULL,'peterjkambey@yiiframework.id',10,0,NULL,1461172293,1461172293,NULL,1,'','127.0.0.1'),(3,'mdmunir','I1VRfZVFZZWcB3otT1FFy90fZdV9eEju','$2y$13$n1dXk320374IRyMDe2RRiuXd0X0qu7ggRJFQYwjTImfam.hw3R5B2',NULL,'mdmunir@yiiframework.id',10,0,NULL,1461172452,1461172452,NULL,1,'','127.0.0.1');

/*Table structure for table `user_setting` */

DROP TABLE IF EXISTS `user_setting`;

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`key`),
  CONSTRAINT `user_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_setting` */

/*Table structure for table `user_visit_log` */

DROP TABLE IF EXISTS `user_visit_log`;

CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` varchar(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `os` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_visit_log` */

insert  into `user_visit_log`(`id`,`token`,`ip`,`language`,`user_agent`,`browser`,`os`,`user_id`,`visit_time`) values (1,'57174d51196dc','127.0.0.1','en','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','Chrome','Windows',1,1461144913),(2,'57174d83e908a','127.0.0.1','en','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','Chrome','Windows',1,1461144963),(3,'571754dd4de97','127.0.0.1','en','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','Chrome','Windows',1,1461146845);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
