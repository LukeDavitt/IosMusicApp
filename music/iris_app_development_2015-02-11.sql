# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.19)
# Database: iris_app_development
# Generation Time: 2015-02-11 14:37:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table calendar_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `calendar_events`;

CREATE TABLE `calendar_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `start_time` datetime DEFAULT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_session` tinyint(1) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;

INSERT INTO `calendar_events` (`id`, `title`, `description`, `start_time`, `studio_id`, `client_id`, `address`, `city`, `state`, `zip`, `created_at`, `updated_at`, `end_time`, `is_session`, `session_id`)
VALUES
	(1,'Meet for coffee','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2015-01-13 18:00:00',1,5,'21 S Range Line Rd','Carmel','IN','46032','2015-01-23 00:16:28','2015-01-23 00:16:28','2015-01-13 20:00:00',0,NULL);

/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `secondary_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_clients_on_studio_id` (`studio_id`),
  CONSTRAINT `fk_rails_270164878a` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `first_name`, `phone`, `email`, `active`, `secondary_phone`, `notes`, `created_at`, `updated_at`, `address`, `city`, `state`, `last_name`, `studio_id`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`)
VALUES
	(1,'Tim Smith','(317) 214-2242','tim@westlakedesign.com',1,NULL,'These are some notes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'Tim','317-372-7254','tim@westlakeinteractive.com',0,'','','2015-01-09 14:56:48','2015-01-09 14:56:48','','','','Smith',1,'calvin_and_Hobbes.jpeg','image/jpeg',48178,'2015-01-09 14:56:47'),
	(4,'Tim','317-372-7254','tim@westlakeinteractive.com',1,'','','2015-01-09 14:57:36','2015-01-09 14:57:36','10 main Street','Carmel','IN','Smith',1,'calvin_and_Hobbes.jpeg','image/jpeg',48178,'2015-01-09 14:57:35'),
	(5,'Meredith','317-555-1234','meredithgradle@gmail.com',1,'','Testing Notes','2015-01-09 22:23:09','2015-01-21 17:26:54','1234 Street Lane','Indianapolis','IN','Gradle',2,'gradlefam2014a_hp-30.jpg','image/jpeg',1594263,'2015-01-21 17:26:51'),
	(6,'Greg','','greg@westlakeinteractive.com',1,'','','2015-01-23 14:27:56','2015-01-23 14:27:56','','','','Woods',1,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table family_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `family_members`;

CREATE TABLE `family_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_family_members_on_client_id` (`client_id`),
  CONSTRAINT `fk_rails_8abeb49981` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `family_members` WRITE;
/*!40000 ALTER TABLE `family_members` DISABLE KEYS */;

INSERT INTO `family_members` (`id`, `client_id`, `name`, `relation`, `birthday`, `created_at`, `updated_at`)
VALUES
	(1,6,'Kim','spouse','1985-11-22','2015-01-23 14:28:17','2015-01-23 15:00:55'),
	(2,6,'Ada','child','2014-03-03','2015-01-23 14:28:55','2015-01-23 15:00:50'),
	(3,4,'Cheryl','spouse','2014-12-02','2015-01-23 14:38:17','2015-01-23 14:38:17'),
	(4,5,'Audrey','child','2012-01-02','2015-01-26 14:36:13','2015-01-26 14:36:13'),
	(5,5,'Elias','child','2013-08-20','2015-01-26 14:36:26','2015-01-26 14:36:26'),
	(6,5,'Drew','spouse','1982-07-16','2015-01-26 14:37:05','2015-01-26 14:37:05');

/*!40000 ALTER TABLE `family_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_line_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_line_items`;

CREATE TABLE `invoice_line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoice_line_items` WRITE;
/*!40000 ALTER TABLE `invoice_line_items` DISABLE KEYS */;

INSERT INTO `invoice_line_items` (`id`, `invoice_type`, `description`, `price`, `quantity`, `created_at`, `updated_at`, `invoice_id`)
VALUES
	(2,'Session','Family - Child',150.00,1,'2015-01-23 14:37:29','2015-01-23 14:37:29',1);

/*!40000 ALTER TABLE `invoice_line_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `issued_at` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_line_item_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_at` date DEFAULT NULL,
  `paid_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoices_on_client_id` (`client_id`),
  KEY `index_invoices_on_studio_id` (`studio_id`),
  KEY `index_invoices_on_invoice_line_item_id` (`invoice_line_item_id`),
  CONSTRAINT `fk_rails_6c937b2e95` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`),
  CONSTRAINT `fk_rails_be32cfce94` FOREIGN KEY (`invoice_line_item_id`) REFERENCES `invoice_line_items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;

INSERT INTO `invoices` (`id`, `client_id`, `issued_at`, `due_date`, `created_at`, `updated_at`, `studio_id`, `uuid`, `invoice_line_item_id`, `status`, `sent_at`, `paid_at`)
VALUES
	(1,6,'2015-01-23 00:00:00','2015-02-16','2015-01-23 14:33:50','2015-01-23 14:33:50',1,NULL,NULL,NULL,NULL,NULL),
	(2,5,'2015-01-26 05:00:00','2015-01-30','2015-01-26 15:25:46','2015-01-26 15:25:46',2,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table leads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `leads`;

CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `studio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leads_on_client_id` (`client_id`),
  KEY `index_leads_on_studio_id` (`studio_id`),
  CONSTRAINT `fk_rails_90cccae94c` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;

INSERT INTO `leads` (`id`, `first_name`, `last_name`, `email`, `phone`, `source`, `client_id`, `created_at`, `updated_at`, `studio_id`)
VALUES
	(1,'Tim','Smith','tim@westlakeinteractive.com','317-372-7254','website',4,'2015-01-09 14:55:37','2015-01-09 14:57:36',1),
	(2,'Spencer','Smith','spencer@westlake.com','317-555-1212','website',NULL,'2015-01-09 15:16:18','2015-01-09 15:16:18',1),
	(3,'Andrew','Gradle','drew.gradle@gmail.com','317-555-2345','website',NULL,'2015-01-09 22:23:56','2015-01-09 22:23:56',2);

/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `spud_user_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `is_shared` tinyint(1) DEFAULT '0',
  `picture_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_file_size` int(11) DEFAULT NULL,
  `picture_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_spud_user_id` (`spud_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`id`, `title`, `address`, `description`, `created_at`, `updated_at`, `latitude`, `longitude`, `spud_user_id`, `city`, `state`, `zip`, `is_shared`, `picture_file_name`, `picture_content_type`, `picture_file_size`, `picture_updated_at`)
VALUES
	(1,'Test','Carmel, IN','Test','2014-11-21 16:38:46','2014-11-21 16:38:46',39.9784,-86.118,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
	(2,'Test','Indianapolis, IN','Test','2014-11-21 16:39:02','2014-11-21 16:39:02',39.7684,-86.1581,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
	(3,'Testing','1339 Clay Spring Dr, Carmel, IN 46032','','2015-01-12 16:26:50','2015-01-12 16:26:50',39.9633,-86.1861,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
	(4,'','','','2015-01-23 14:38:49','2015-01-23 14:38:49',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20141106203923'),
	('20141110144131'),
	('20141111155559'),
	('20141111191600'),
	('20141118153646'),
	('20141118153647'),
	('20141118153648'),
	('20141118153649'),
	('20141118153650'),
	('20141118153651'),
	('20141118153652'),
	('20141118153653'),
	('20141118153654'),
	('20141118171317'),
	('20141204151530'),
	('20141204151531'),
	('20141204151532'),
	('20141204151533'),
	('20141204151534'),
	('20141204151535'),
	('20141204151536'),
	('20141204151537'),
	('20141204151538'),
	('20141204151539'),
	('20141204151540'),
	('20141204151541'),
	('20141204151542'),
	('20141204151543'),
	('20141204151544'),
	('20141204151545'),
	('20141204151546'),
	('20141204151547'),
	('20141204151548'),
	('20141204200223'),
	('20141204200224'),
	('20141204200225'),
	('20141208212417'),
	('20141209151807'),
	('20141231202414'),
	('20150102154420'),
	('20150102182003'),
	('20150102182041'),
	('20150102183359'),
	('20150102183922'),
	('20150106173344'),
	('20150106174006'),
	('20150106174240'),
	('20150106174527'),
	('20150106174710'),
	('20150106182419'),
	('20150113164250'),
	('20150113195404'),
	('20150113195711'),
	('20150114151407'),
	('20150114152539'),
	('20150115155504'),
	('20150115185404'),
	('20150116155049'),
	('20150116155147'),
	('20150116161748'),
	('20150116171334'),
	('20150116171451'),
	('20150118174542'),
	('20150119184639'),
	('20150120151042'),
	('20150121214417'),
	('20150126202854'),
	('20150126203136'),
	('20150129191319'),
	('20150129192539'),
	('20150129192845'),
	('20150131131542'),
	('20150131132134'),
	('20150131144800'),
	('20150131175447'),
	('20150131175605'),
	('20150131180409'),
	('20150201154602');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table session_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `session_types`;

CREATE TABLE `session_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `workflow_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `session_types` WRITE;
/*!40000 ALTER TABLE `session_types` DISABLE KEYS */;

INSERT INTO `session_types` (`id`, `name`, `created_at`, `updated_at`, `studio_id`, `workflow_template_id`)
VALUES
	(3,'Wedding','2015-01-30 15:13:30','2015-01-31 14:38:46',1,1),
	(20,'Family Portraits','2015-01-31 15:04:44','2015-01-31 18:13:34',1,2),
	(32,'blahBlah','2015-02-01 15:35:50','2015-02-01 15:35:50',1,NULL);

/*!40000 ALTER TABLE `session_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_type_id` int(11) DEFAULT NULL,
  `calendar_event_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_liquid_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_liquid_tags`;

CREATE TABLE `spud_liquid_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_liquid_tags_on_tag_name_and_value` (`tag_name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_permalinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_permalinks`;

CREATE TABLE `spud_permalinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `site_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_permalink_attachment` (`attachment_type`,`attachment_id`),
  KEY `idx_permalinks_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_permissions`;

CREATE TABLE `spud_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_spud_permissions_on_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_categories`;

CREATE TABLE `spud_post_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_post_categories_on_url_name` (`url_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_post_categories_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_categories_posts`;

CREATE TABLE `spud_post_categories_posts` (
  `spud_post_id` int(11) DEFAULT NULL,
  `spud_post_category_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_spud_post_categories_posts_on_spud_post_category_id` (`spud_post_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_post_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_comments`;

CREATE TABLE `spud_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_post_id` int(11) DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `approved` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `spam` tinyint(1) DEFAULT NULL,
  `user_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referrer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blog_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_post_comments_on_spud_post_id` (`spud_post_id`),
  KEY `index_spud_post_comments_on_approved` (`approved`),
  KEY `index_spud_post_comments_on_blog_key` (`blog_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_post_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_post_sites`;

CREATE TABLE `spud_post_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_post_id` int(11) NOT NULL,
  `spud_site_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_post_sites_on_spud_post_id` (`spud_post_id`),
  KEY `index_spud_post_sites_on_spud_site_id` (`spud_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_posts`;

CREATE TABLE `spud_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `comments_enabled` tinyint(1) DEFAULT '0',
  `visible` tinyint(1) DEFAULT '1',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_news` tinyint(1) DEFAULT '0',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `comments_count` int(11) DEFAULT '0',
  `content_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'HTML',
  `content_processed` text COLLATE utf8_unicode_ci,
  `blog_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_posts_on_spud_user_id` (`spud_user_id`),
  KEY `index_spud_posts_on_visible` (`visible`),
  KEY `index_spud_posts_on_url_name` (`url_name`),
  KEY `index_spud_posts_on_is_news` (`is_news`),
  KEY `index_spud_posts_on_blog_key` (`blog_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_role_permissions`;

CREATE TABLE `spud_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_role_id` int(11) NOT NULL,
  `spud_permission_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_role_permissions_on_spud_role_id` (`spud_role_id`),
  KEY `index_spud_role_permissions_on_spud_permission_tag` (`spud_permission_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_roles`;

CREATE TABLE `spud_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_user_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_user_settings`;

CREATE TABLE `spud_user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table spud_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spud_users`;

CREATE TABLE `spud_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `super_admin` tinyint(1) DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `single_access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spud_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spud_users_on_login` (`login`),
  KEY `index_spud_users_on_email` (`email`),
  KEY `index_spud_users_on_spud_role_id` (`spud_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `spud_users` WRITE;
/*!40000 ALTER TABLE `spud_users` DISABLE KEYS */;

INSERT INTO `spud_users` (`id`, `first_name`, `last_name`, `super_admin`, `login`, `email`, `crypted_password`, `password_salt`, `persistence_token`, `single_access_token`, `perishable_token`, `login_count`, `failed_login_count`, `last_request_at`, `current_login_at`, `last_login_at`, `current_login_ip`, `last_login_ip`, `created_at`, `updated_at`, `time_zone`, `spud_role_id`)
VALUES
	(1,NULL,NULL,1,'westlake','accounts@westlakedesign.com','400$8$48$4fda5d67199068c0$8421cc022bcce3c80be9188f07e381b5637a47f463fbcb585e0502d37effe4b1','cfAJckbNRbTuvqDDCxS','2905a03d430cb2865486ab6b3ef4ace9397786b99f0b366e9fcad175b4be63b4d8ed917964841f11e9ceb28b3b8b8065f836bb5f6006a671444ae36f57d703a1','RjlxBavWyzRPs70EVWBf','hvmJIDwL9wfH7HDEnIJr',21,0,'2015-02-01 17:30:04','2015-02-01 15:17:10','2015-01-31 21:40:10','::1','::1','2014-11-21 18:10:57','2015-02-01 17:30:04',NULL,NULL),
	(2,'Meredith','Gradle',0,'iris','iris-user@westlakedesign.com','400$8$3d$08866136f6ed9c31$4b4c7c9a76bf49220e7c912a7adb6dcba2dc9621b4c89a3d3f88162cf3a4571e','15oWfBVCB7Y3SlKSjd7k','2fcd489b469e810af306ce0456f974371ff3f1a881146d5f053a4c5ba338ebfdc150373a07eb3da1685f5a45157966434cd109f6114e066eae793c1ec59bfa99','ioQjPHMizKXYrlx9qSgz','EpmgvpFdey25tpw42zON',14,0,'2015-01-26 15:31:24','2015-01-26 14:35:12','2015-01-23 16:57:11','64.134.196.174','107.218.54.150','2015-01-09 15:19:21','2015-01-26 15:31:24','Eastern Time (US & Canada)',NULL);

/*!40000 ALTER TABLE `spud_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table studios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `studios`;

CREATE TABLE `studios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spud_user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_studios_on_spud_user_id` (`spud_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;

INSERT INTO `studios` (`id`, `spud_user_id`, `name`, `address`, `city`, `state`, `postal`, `country`, `website`, `created_at`, `updated_at`)
VALUES
	(1,1,'Westlake Design','21 S Range Line Rd','Carmel','IN','46032','USA','http://www.westlakedesign.com','2015-01-09 09:40:17','2015-01-09 09:40:17'),
	(2,2,'Iris','1 Test St','Carmel','IN','46032','USA','http://iris-works.westlakelab.com','2015-01-09 10:20:29','2015-01-09 10:20:29');

/*!40000 ALTER TABLE `studios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table to_dos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `to_dos`;

CREATE TABLE `to_dos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_to_dos_on_studio_id` (`studio_id`),
  KEY `index_to_dos_on_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `to_dos` WRITE;
/*!40000 ALTER TABLE `to_dos` DISABLE KEYS */;

INSERT INTO `to_dos` (`id`, `studio_id`, `client_id`, `description`, `due_date`, `completed_at`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,'Pick up rental lense',NULL,NULL,'2015-01-09 14:40:39','2015-01-09 14:40:39'),
	(2,1,NULL,'Edit wedding photos',NULL,NULL,'2015-01-09 14:40:46','2015-01-09 14:40:46'),
	(3,1,NULL,'Mail CD to the client','2015-01-20',NULL,'2015-01-09 14:41:04','2015-01-23 14:25:07'),
	(4,1,NULL,'Drop off the mail','2015-01-09',NULL,'2015-01-09 14:41:26','2015-01-09 15:11:36'),
	(5,1,NULL,'Respond to client email','2015-01-09',NULL,'2015-01-09 14:42:01','2015-01-09 14:42:01'),
	(7,1,NULL,'Test','2015-01-07',NULL,'2015-01-09 15:14:01','2015-01-09 15:14:26'),
	(8,2,NULL,'Testing To-Dos today','2015-01-09',NULL,'2015-01-09 15:34:20','2015-01-09 15:34:20'),
	(9,2,NULL,'Cull Images from Christmas','2015-01-10','2015-01-10 16:11:19','2015-01-09 22:24:39','2015-01-10 16:11:19'),
	(10,2,NULL,'Meet with New Bride ','2015-01-12',NULL,'2015-01-10 17:59:59','2015-01-10 17:59:59'),
	(11,2,NULL,'Add an item','2015-01-14','2015-01-14 17:32:04','2015-01-14 17:31:54','2015-01-14 17:32:04'),
	(12,1,4,'Edit Photos','2015-02-02',NULL,'2015-01-19 14:51:56','2015-01-19 14:51:56'),
	(13,1,4,'Test something','2015-01-21',NULL,'2015-01-21 14:51:23','2015-01-21 14:51:23'),
	(14,2,5,'Testing','2015-01-21',NULL,'2015-01-21 16:53:36','2015-01-21 16:53:36'),
	(15,2,5,'Testing Post','2015-01-29',NULL,'2015-01-21 16:53:46','2015-01-21 16:53:46'),
	(17,1,6,'example for Greg','2015-02-03',NULL,'2015-01-23 15:08:27','2015-01-23 15:08:35'),
	(18,1,6,'examp 2','2015-02-03',NULL,'2015-01-23 15:08:53','2015-01-23 15:08:53'),
	(20,1,6,'no due date',NULL,NULL,'2015-01-23 15:09:49','2015-01-23 15:10:12'),
	(21,1,6,'no due date 2','2015-02-23',NULL,'2015-01-23 15:10:34','2015-01-23 15:10:34');

/*!40000 ALTER TABLE `to_dos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_items`;

CREATE TABLE `workflow_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `workflow_template_item_id` int(11) DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_items_on_workflow_id` (`workflow_id`),
  KEY `index_workflow_items_on_workflow_template_item_id` (`workflow_template_item_id`),
  CONSTRAINT `fk_rails_1f365f2697` FOREIGN KEY (`workflow_template_item_id`) REFERENCES `workflow_template_items` (`id`),
  CONSTRAINT `fk_rails_663be50cd0` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table workflow_template_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_template_items`;

CREATE TABLE `workflow_template_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_template_id` int(11) DEFAULT NULL,
  `schedule_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_offset` int(11) DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_template_items_on_workflow_template_id` (`workflow_template_id`),
  CONSTRAINT `fk_rails_ff0940e7da` FOREIGN KEY (`workflow_template_id`) REFERENCES `workflow_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `workflow_template_items` WRITE;
/*!40000 ALTER TABLE `workflow_template_items` DISABLE KEYS */;

INSERT INTO `workflow_template_items` (`id`, `workflow_template_id`, `schedule_type`, `schedule_offset`, `item_type`, `config`, `created_at`, `updated_at`)
VALUES
	(1,2,'booked',0,'ScheduledEmail','--- !ruby/hash:ActionController::Parameters\ntemplate_id: \'2\'\n','2015-01-23 00:09:19','2015-01-23 00:09:19'),
	(2,2,'booked',0,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Send Invoice\n','2015-01-23 00:09:39','2015-01-23 00:09:39'),
	(3,2,'pre',21,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Collect Deposit\n','2015-01-23 00:10:00','2015-01-23 00:10:00'),
	(4,2,'post',3,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Cull Images\n','2015-01-23 00:10:55','2015-01-23 00:10:55'),
	(6,2,'post',14,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Edit images\n','2015-01-23 00:11:29','2015-01-23 00:11:29'),
	(7,2,'post',3,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Share 1-4 images on social media sites\n','2015-01-23 00:12:00','2015-01-23 00:12:00'),
	(8,2,'post',21,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Blog session\n','2015-01-23 00:12:25','2015-01-23 00:12:25'),
	(9,2,'post',21,'ScheduledEmail','--- !ruby/hash:ActionController::Parameters\ntemplate_id: \'2\'\n','2015-01-23 00:12:56','2015-01-23 00:12:56'),
	(10,2,'post',21,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Upload images to client gallery and release to the client\n','2015-01-23 00:13:25','2015-01-23 00:13:25'),
	(12,2,'post',42,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Send hand-written thank you letter to client\n','2015-01-23 00:14:16','2015-01-23 00:14:16'),
	(13,1,'post',7,'ToDo','--- !ruby/hash:ActionController::Parameters\ndescription: Cull Images\n','2015-01-23 15:05:22','2015-01-23 15:05:22'),
	(14,3,'pre',2,'ScheduledEmail','--- !ruby/hash:ActionController::Parameters\ntemplate_id: \'1\'\n','2015-01-23 16:57:48','2015-01-23 16:57:48'),
	(15,3,'post',1,'ScheduledEmail','--- !ruby/hash:ActionController::Parameters\ntemplate_id: \'2\'\n','2015-01-23 16:58:04','2015-01-23 16:58:04'),
	(16,4,'pre',2,'ScheduledEmail','--- !ruby/hash:ActionController::Parameters\ntemplate_id: \'1\'\n','2015-01-26 15:21:08','2015-01-26 15:21:08');

/*!40000 ALTER TABLE `workflow_template_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflow_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_templates`;

CREATE TABLE `workflow_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `session_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_templates_on_studio_id` (`studio_id`),
  KEY `index_workflow_templates_on_session_type_id` (`session_type_id`),
  CONSTRAINT `fk_rails_1fc4ae05f1` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `workflow_templates` WRITE;
/*!40000 ALTER TABLE `workflow_templates` DISABLE KEYS */;

INSERT INTO `workflow_templates` (`id`, `studio_id`, `session_type_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'Weddings','2015-01-23 00:08:39','2015-01-31 14:43:28'),
	(2,1,20,'Family Portraits','2015-01-23 00:09:01','2015-01-31 15:04:44'),
	(3,2,NULL,'Wedding','2015-01-23 16:57:39','2015-01-23 16:57:39'),
	(4,2,NULL,'Test','2015-01-26 15:20:51','2015-01-26 15:20:51'),
	(28,1,NULL,'Blahblah','2015-02-01 15:36:09','2015-02-01 15:36:09');

/*!40000 ALTER TABLE `workflow_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table workflows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflows`;

CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `workflow_template_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflows_on_studio_id` (`studio_id`),
  KEY `index_workflows_on_client_id` (`client_id`),
  KEY `index_workflows_on_workflow_template_id` (`workflow_template_id`),
  CONSTRAINT `fk_rails_3bd1fa81ce` FOREIGN KEY (`workflow_template_id`) REFERENCES `workflow_templates` (`id`),
  CONSTRAINT `fk_rails_a32c629766` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_rails_debe7e8d8f` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
