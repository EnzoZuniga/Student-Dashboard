# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.7.26)
# Base de données: challenge_react
# Temps de génération: 2019-11-13 15:27:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table classrooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classrooms`;

CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CLASSROOMS` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table classrooms__users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classrooms__users`;

CREATE TABLE `classrooms__users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table core_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_store`;

CREATE TABLE `core_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CORE_STORE` (`key`,`value`,`type`,`environment`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`)
VALUES
	(1,'db_model_upload_file','{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"sha256\":{\"type\":\"string\",\"configurable\":false},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),
	(2,'db_model_core_store','{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}','object',NULL,NULL),
	(3,'db_model_users-permissions_permission','{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}}','object',NULL,NULL),
	(4,'db_model_strapi_administrator','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"required\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false}}','object',NULL,NULL),
	(5,'db_model_users-permissions_user','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"Skills\":{\"group\":\"skills\",\"repeatable\":true,\"type\":\"group\"},\"Job\":{\"type\":\"string\"},\"description\":{\"type\":\"text\"},\"avatar\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),
	(6,'db_model_users-permissions_role','{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"isVirtual\":true}}','object',NULL,NULL),
	(7,'db_model_upload_file_morph','{\"upload_file_id\":{\"type\":\"integer\"},\"related_id\":{\"type\":\"integer\"},\"related_type\":{\"type\":\"text\"},\"field\":{\"type\":\"text\"}}','object',NULL,NULL),
	(8,'plugin_email_provider','{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}','object','development',''),
	(9,'plugin_upload_provider','{\"provider\":\"local\",\"name\":\"Local server\",\"enabled\":true,\"sizeLimit\":1000000}','object','development',''),
	(10,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"comments\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\"}}','object','',''),
	(11,'plugin_content_manager_configuration_content_types::admin.administrator','{\"uid\":\"administrator\",\"source\":\"admin\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"resetPasswordToken\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"blocked\",\"size\":4}]],\"editRelations\":[]}}','object','',''),
	(12,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square-o\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),
	(13,'plugin_content_manager_configuration_content_types::users-permissions.permission','{\"uid\":\"permission\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]],\"editRelations\":[\"role\"]}}','object','',''),
	(14,'plugin_content_manager_configuration_content_types::users-permissions.role','{\"uid\":\"role\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]],\"editRelations\":[\"permissions\",\"users\"]}}','object','',''),
	(15,'plugin_content_manager_configuration_content_types::upload.file','{\"uid\":\"file\",\"source\":\"upload\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"sha256\":{\"edit\":{\"label\":\"Sha256\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sha256\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"hash\",\"sha256\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"hash\",\"size\":6}],[{\"name\":\"sha256\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":6}],[{\"name\":\"url\",\"size\":6},{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]],\"editRelations\":[\"related\"]}}','object','',''),
	(16,'plugin_content_manager_configuration_content_types::users-permissions.user','{\"uid\":\"user\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"Skills\":{\"edit\":{\"label\":\"Skills\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Skills\",\"searchable\":false,\"sortable\":false}},\"Job\":{\"edit\":{\"label\":\"Job\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Job\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"avatar\":{\"edit\":{\"label\":\"Avatar\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Avatar\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"provider\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"provider\",\"size\":6},{\"name\":\"password\",\"size\":6}],[{\"name\":\"resetPasswordToken\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"Skills\",\"size\":12}],[{\"name\":\"Job\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"avatar\",\"size\":6}]],\"editRelations\":[\"role\"]}}','object','',''),
	(17,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":true,\"email_confirmation_redirection\":\"http://localhost:1337/admin\",\"email_reset_password\":\"http://localhost:1337/admin\",\"default_role\":\"authenticated\"}','object','',''),
	(18,'db_model_skills','{\"name\":{\"type\":\"string\"},\"rate\":{\"model\":\"rate\",\"via\":\"skills\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),
	(19,'plugin_content_manager_configuration_content_types::skill','{\"uid\":\"skill\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"rate\":{\"edit\":{\"label\":\"Rate\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"label\"},\"list\":{\"label\":\"Rate\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"created_at\",\"updated_at\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]],\"editRelations\":[\"rate\"]}}','object','',''),
	(20,'db_model_skills_users__users_skills','{\"user_id\":{\"type\":\"integer\"},\"skill_id\":{\"type\":\"integer\"}}','object',NULL,NULL),
	(21,'db_model_rates','{\"label\":{\"type\":\"string\"},\"level\":{\"type\":\"integer\"},\"skills\":{\"collection\":\"skill\",\"via\":\"rate\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),
	(22,'plugin_content_manager_configuration_content_types::rate','{\"uid\":\"rate\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"Label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Label\",\"searchable\":true,\"sortable\":true}},\"level\":{\"edit\":{\"label\":\"Level\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Level\",\"searchable\":true,\"sortable\":true}},\"skills\":{\"edit\":{\"label\":\"Skills\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Skills\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"label\",\"level\",\"created_at\"],\"edit\":[[{\"name\":\"label\",\"size\":6},{\"name\":\"level\",\"size\":4}]],\"editRelations\":[\"skills\"]}}','object','',''),
	(23,'db_model_rates_users__users_rates','{\"rate_id\":{\"type\":\"integer\"},\"user_id\":{\"type\":\"integer\"}}','object',NULL,NULL),
	(24,'db_model_groups_rated_skills','{\"skill\":{\"model\":\"skill\"},\"rate\":{\"model\":\"rate\"}}','object',NULL,NULL),
	(25,'plugin_content_manager_configuration_groups::skills','{\"uid\":\"skills\",\"isGroup\":true,\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"skill\":{\"edit\":{\"label\":\"Skill\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Skill\",\"searchable\":false,\"sortable\":false}},\"rate\":{\"edit\":{\"label\":\"Rate\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"label\"},\"list\":{\"label\":\"Rate\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"skill\",\"size\":6},{\"name\":\"rate\",\"size\":6}]],\"editRelations\":[]}}','object','',''),
	(26,'db_model_classrooms','{\"class\":{\"type\":\"string\"},\"users\":{\"collection\":\"user\",\"plugin\":\"users-permissions\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),
	(27,'db_model_classrooms__users','{\"classroom_id\":{\"type\":\"integer\"},\"user_id\":{\"type\":\"integer\"}}','object',NULL,NULL),
	(28,'plugin_content_manager_configuration_content_types::classroom','{\"uid\":\"classroom\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"class\",\"defaultSortBy\":\"class\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"class\":{\"edit\":{\"label\":\"Class\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Class\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"class\",\"created_at\",\"updated_at\"],\"edit\":[[{\"name\":\"class\",\"size\":6}]],\"editRelations\":[\"users\"]}}','object','','');

/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table groups_rated_skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups_rated_skills`;

CREATE TABLE `groups_rated_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `groups_rated_skills` WRITE;
/*!40000 ALTER TABLE `groups_rated_skills` DISABLE KEYS */;

INSERT INTO `groups_rated_skills` (`id`, `skill`, `rate`)
VALUES
	(3,1,1),
	(4,2,2),
	(5,3,3),
	(6,4,4),
	(7,5,5);

/*!40000 ALTER TABLE `groups_rated_skills` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rates`;

CREATE TABLE `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RATES` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;

INSERT INTO `rates` (`id`, `label`, `level`, `created_at`, `updated_at`)
VALUES
	(1,'A',60,'2019-11-13 13:23:43','2019-11-13 13:36:08'),
	(2,'B',50,'2019-11-13 13:35:33','2019-11-13 13:36:11'),
	(3,'C',40,'2019-11-13 13:35:42','2019-11-13 13:36:15'),
	(4,'D',30,'2019-11-13 13:35:47','2019-11-13 13:36:20'),
	(5,'E',20,'2019-11-13 13:36:28','2019-11-13 13:36:28'),
	(6,'F',10,'2019-11-13 13:36:34','2019-11-13 13:36:34');

/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table rates_users__users_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rates_users__users_rates`;

CREATE TABLE `rates_users__users_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_SKILLS` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;

INSERT INTO `skills` (`id`, `name`, `created_at`, `updated_at`, `rate`)
VALUES
	(1,'Programmation côté client','2019-11-13 13:23:56','2019-11-13 13:36:56',NULL),
	(2,'Programmation côté serveur','2019-11-13 13:37:05','2019-11-13 13:37:09',NULL),
	(3,'Design UI','2019-11-13 13:37:30','2019-11-13 13:37:30',NULL),
	(4,'UX','2019-11-13 13:37:40','2019-11-13 13:37:40',NULL),
	(5,'Gestion de projet','2019-11-13 13:37:50','2019-11-13 13:37:50',NULL);

/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table skills_users__users_skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills_users__users_skills`;

CREATE TABLE `skills_users__users_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table strapi_administrator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_administrator`;

CREATE TABLE `strapi_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_username_unique` (`username`),
  FULLTEXT KEY `SEARCH_STRAPI_ADMINISTRATOR` (`username`,`resetPasswordToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;

INSERT INTO `strapi_administrator` (`id`, `username`, `email`, `password`, `resetPasswordToken`, `blocked`)
VALUES
	(1,'admin','lorick.travailleur@hetic.net','$2a$10$1AsSTrQBcpBN3DHqAwrjX.0zBg8u.rGzvPJm47I17NlEohEG4BBpK',NULL,NULL);

/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table upload_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `sha256` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`sha256`,`ext`,`mime`,`size`,`url`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table upload_file_morph
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file_morph`;

CREATE TABLE `upload_file_morph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE_MORPH` (`related_type`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Affichage de la table users-permissions_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_permission`;

CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`,`policy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`)
VALUES
	(1,'content-type-builder','contenttypebuilder','getmodels',0,'',1),
	(2,'content-type-builder','contenttypebuilder','getmodel',0,'',1),
	(3,'content-type-builder','contenttypebuilder','getconnections',0,'',1),
	(4,'content-type-builder','contenttypebuilder','createmodel',0,'',1),
	(5,'content-type-builder','contenttypebuilder','updatemodel',0,'',1),
	(6,'content-type-builder','contenttypebuilder','deletemodel',0,'',1),
	(7,'content-type-builder','groups','updategroup',0,'',1),
	(8,'content-type-builder','groups','getgroup',0,'',1),
	(9,'content-type-builder','groups','creategroup',0,'',1),
	(10,'content-type-builder','groups','getgroups',0,'',1),
	(11,'content-type-builder','groups','deletegroup',0,'',1),
	(12,'content-manager','contentmanager','find',0,'',1),
	(13,'content-manager','contentmanager','findone',0,'',1),
	(14,'content-manager','contentmanager','count',0,'',1),
	(15,'content-manager','contentmanager','create',0,'',1),
	(16,'content-manager','contentmanager','update',0,'',1),
	(17,'content-manager','contentmanager','delete',0,'',1),
	(18,'content-manager','contentmanager','deletemany',0,'',1),
	(19,'content-manager','contenttypes','listcontenttypes',0,'',1),
	(20,'content-manager','contenttypes','findcontenttype',0,'',1),
	(21,'content-manager','contenttypes','updatecontenttype',0,'',1),
	(22,'content-manager','generalsettings','getgeneralsettings',0,'',1),
	(23,'content-manager','generalsettings','updategeneralsettings',0,'',1),
	(24,'content-manager','groups','listgroups',0,'',1),
	(25,'content-manager','groups','findgroup',0,'',1),
	(26,'content-manager','groups','updategroup',0,'',1),
	(27,'users-permissions','auth','callback',0,'',1),
	(28,'users-permissions','auth','changepassword',0,'',1),
	(29,'users-permissions','auth','connect',1,'',1),
	(30,'users-permissions','auth','forgotpassword',0,'',1),
	(31,'users-permissions','auth','register',0,'',1),
	(32,'users-permissions','auth','emailconfirmation',0,'',1),
	(33,'users-permissions','user','find',0,'',1),
	(34,'users-permissions','user','me',1,'',1),
	(35,'users-permissions','user','findone',0,'',1),
	(36,'users-permissions','user','create',0,'',1),
	(37,'users-permissions','user','update',0,'',1),
	(38,'users-permissions','user','destroy',0,'',1),
	(39,'users-permissions','user','destroyall',0,'',1),
	(40,'users-permissions','userspermissions','createrole',0,'',1),
	(41,'users-permissions','userspermissions','deleteprovider',0,'',1),
	(42,'users-permissions','userspermissions','deleterole',0,'',1),
	(43,'users-permissions','userspermissions','getpermissions',0,'',1),
	(44,'users-permissions','userspermissions','getpolicies',0,'',1),
	(45,'users-permissions','userspermissions','getrole',0,'',1),
	(46,'users-permissions','userspermissions','getroles',0,'',1),
	(47,'users-permissions','userspermissions','getroutes',0,'',1),
	(48,'users-permissions','userspermissions','index',0,'',1),
	(49,'users-permissions','userspermissions','init',1,'',1),
	(50,'users-permissions','userspermissions','searchusers',0,'',1),
	(51,'users-permissions','userspermissions','updaterole',0,'',1),
	(52,'users-permissions','userspermissions','getemailtemplate',0,'',1),
	(53,'users-permissions','userspermissions','updateemailtemplate',0,'',1),
	(54,'users-permissions','userspermissions','getadvancedsettings',0,'',1),
	(55,'users-permissions','userspermissions','updateadvancedsettings',0,'',1),
	(56,'users-permissions','userspermissions','getproviders',0,'',1),
	(57,'users-permissions','userspermissions','updateproviders',0,'',1),
	(58,'email','email','send',0,'',1),
	(59,'email','email','getenvironments',0,'',1),
	(60,'email','email','getsettings',0,'',1),
	(61,'email','email','updatesettings',0,'',1),
	(62,'upload','upload','upload',0,'',1),
	(63,'upload','upload','getenvironments',0,'',1),
	(64,'upload','upload','getsettings',0,'',1),
	(65,'upload','upload','updatesettings',0,'',1),
	(66,'upload','upload','find',0,'',1),
	(67,'upload','upload','findone',0,'',1),
	(68,'upload','upload','count',0,'',1),
	(69,'upload','upload','destroy',0,'',1),
	(70,'upload','upload','search',0,'',1),
	(71,'content-type-builder','contenttypebuilder','getmodels',0,'',2),
	(72,'content-type-builder','contenttypebuilder','getmodel',0,'',2),
	(73,'content-type-builder','contenttypebuilder','getconnections',0,'',2),
	(74,'content-type-builder','contenttypebuilder','createmodel',0,'',2),
	(75,'content-type-builder','contenttypebuilder','updatemodel',0,'',2),
	(76,'content-type-builder','contenttypebuilder','deletemodel',0,'',2),
	(77,'content-type-builder','groups','getgroups',0,'',2),
	(78,'content-type-builder','groups','getgroup',0,'',2),
	(79,'content-type-builder','groups','creategroup',0,'',2),
	(80,'content-type-builder','groups','updategroup',0,'',2),
	(81,'content-type-builder','groups','deletegroup',0,'',2),
	(82,'content-manager','contentmanager','find',0,'',2),
	(83,'content-manager','contentmanager','findone',0,'',2),
	(84,'content-manager','contentmanager','count',0,'',2),
	(85,'content-manager','contentmanager','create',0,'',2),
	(86,'content-manager','contentmanager','update',0,'',2),
	(87,'content-manager','contentmanager','delete',0,'',2),
	(88,'content-manager','contentmanager','deletemany',0,'',2),
	(89,'content-manager','contenttypes','listcontenttypes',0,'',2),
	(90,'content-manager','contenttypes','findcontenttype',0,'',2),
	(91,'content-manager','contenttypes','updatecontenttype',0,'',2),
	(92,'content-manager','generalsettings','getgeneralsettings',0,'',2),
	(93,'content-manager','generalsettings','updategeneralsettings',0,'',2),
	(94,'content-manager','groups','listgroups',0,'',2),
	(95,'content-manager','groups','findgroup',0,'',2),
	(96,'content-manager','groups','updategroup',0,'',2),
	(97,'users-permissions','auth','callback',1,'',2),
	(98,'users-permissions','auth','changepassword',1,'',2),
	(99,'users-permissions','auth','connect',1,'',2),
	(100,'users-permissions','auth','forgotpassword',1,'',2),
	(101,'users-permissions','auth','register',1,'',2),
	(102,'users-permissions','auth','emailconfirmation',1,'',2),
	(103,'users-permissions','user','find',0,'',2),
	(104,'users-permissions','user','me',1,'',2),
	(105,'users-permissions','user','findone',0,'',2),
	(106,'users-permissions','user','create',0,'',2),
	(107,'users-permissions','user','update',0,'',2),
	(108,'users-permissions','user','destroy',0,'',2),
	(109,'users-permissions','user','destroyall',0,'',2),
	(110,'users-permissions','userspermissions','createrole',0,'',2),
	(111,'users-permissions','userspermissions','deleteprovider',0,'',2),
	(112,'users-permissions','userspermissions','deleterole',0,'',2),
	(113,'users-permissions','userspermissions','getpermissions',1,'',2),
	(114,'users-permissions','userspermissions','getpolicies',0,'',2),
	(115,'users-permissions','userspermissions','getrole',0,'',2),
	(116,'users-permissions','userspermissions','getroutes',0,'',2),
	(117,'users-permissions','userspermissions','getroles',1,'',2),
	(118,'users-permissions','userspermissions','index',0,'',2),
	(119,'users-permissions','userspermissions','init',1,'',2),
	(120,'users-permissions','userspermissions','searchusers',0,'',2),
	(121,'users-permissions','userspermissions','updaterole',0,'',2),
	(122,'users-permissions','userspermissions','getemailtemplate',0,'',2),
	(123,'users-permissions','userspermissions','updateemailtemplate',0,'',2),
	(124,'users-permissions','userspermissions','getadvancedsettings',0,'',2),
	(125,'users-permissions','userspermissions','updateadvancedsettings',0,'',2),
	(126,'users-permissions','userspermissions','getproviders',0,'',2),
	(127,'users-permissions','userspermissions','updateproviders',0,'',2),
	(128,'email','email','send',0,'',2),
	(129,'email','email','getenvironments',0,'',2),
	(130,'email','email','getsettings',0,'',2),
	(131,'email','email','updatesettings',0,'',2),
	(132,'upload','upload','upload',0,'',2),
	(133,'upload','upload','getenvironments',0,'',2),
	(134,'upload','upload','getsettings',0,'',2),
	(135,'upload','upload','updatesettings',0,'',2),
	(136,'upload','upload','find',0,'',2),
	(137,'upload','upload','findone',0,'',2),
	(138,'upload','upload','count',0,'',2),
	(139,'upload','upload','destroy',0,'',2),
	(140,'upload','upload','search',0,'',2),
	(141,'application','skill','find',0,'',1),
	(142,'application','skill','findone',0,'',1),
	(143,'application','skill','count',0,'',1),
	(144,'application','skill','create',0,'',1),
	(145,'application','skill','update',0,'',1),
	(146,'application','skill','delete',0,'',1),
	(147,'application','skill','find',1,'',2),
	(148,'application','skill','findone',0,'',2),
	(149,'application','skill','count',0,'',2),
	(150,'application','skill','create',0,'',2),
	(151,'application','skill','update',0,'',2),
	(152,'application','skill','delete',0,'',2),
	(153,'application','rate','find',0,'',1),
	(154,'application','rate','findone',0,'',1),
	(155,'application','rate','count',0,'',1),
	(156,'application','rate','create',0,'',1),
	(157,'application','rate','update',0,'',1),
	(158,'application','rate','delete',0,'',1),
	(159,'application','rate','find',1,'',2),
	(160,'application','rate','findone',0,'',2),
	(161,'application','rate','count',0,'',2),
	(162,'application','rate','create',0,'',2),
	(163,'application','rate','update',0,'',2),
	(164,'application','rate','delete',0,'',2),
	(165,'application','rate','find',1,'',3),
	(166,'application','rate','count',0,'',3),
	(167,'application','rate','update',1,'',3),
	(168,'application','rate','findone',1,'',3),
	(169,'application','rate','create',0,'',3),
	(170,'application','skill','findone',1,'',3),
	(171,'application','rate','delete',0,'',3),
	(172,'application','skill','find',1,'',3),
	(173,'application','skill','create',1,'',3),
	(174,'application','skill','count',1,'',3),
	(175,'application','skill','update',1,'',3),
	(176,'application','skill','delete',1,'',3),
	(177,'content-manager','contentmanager','find',0,'',3),
	(178,'content-manager','contentmanager','findone',0,'',3),
	(179,'content-manager','contentmanager','count',0,'',3),
	(180,'content-manager','contentmanager','create',0,'',3),
	(181,'content-manager','contentmanager','update',0,'',3),
	(182,'content-manager','contentmanager','delete',0,'',3),
	(183,'content-manager','contentmanager','deletemany',0,'',3),
	(184,'content-manager','contenttypes','listcontenttypes',0,'',3),
	(185,'content-manager','contenttypes','findcontenttype',0,'',3),
	(186,'content-manager','contenttypes','updatecontenttype',0,'',3),
	(187,'content-manager','generalsettings','getgeneralsettings',0,'',3),
	(188,'content-manager','generalsettings','updategeneralsettings',0,'',3),
	(189,'content-manager','groups','listgroups',0,'',3),
	(190,'content-manager','groups','findgroup',0,'',3),
	(191,'content-manager','groups','updategroup',0,'',3),
	(192,'content-type-builder','contenttypebuilder','getmodels',0,'',3),
	(193,'content-type-builder','contenttypebuilder','getmodel',0,'',3),
	(194,'content-type-builder','contenttypebuilder','getconnections',0,'',3),
	(195,'content-type-builder','contenttypebuilder','createmodel',0,'',3),
	(196,'content-type-builder','contenttypebuilder','updatemodel',0,'',3),
	(197,'content-type-builder','contenttypebuilder','deletemodel',0,'',3),
	(198,'content-type-builder','groups','getgroups',0,'',3),
	(199,'content-type-builder','groups','getgroup',0,'',3),
	(200,'content-type-builder','groups','creategroup',0,'',3),
	(201,'content-type-builder','groups','updategroup',0,'',3),
	(202,'content-type-builder','groups','deletegroup',0,'',3),
	(203,'email','email','send',0,'',3),
	(204,'email','email','getenvironments',0,'',3),
	(205,'email','email','getsettings',0,'',3),
	(206,'email','email','updatesettings',0,'',3),
	(207,'upload','upload','upload',0,'',3),
	(208,'upload','upload','search',0,'',3),
	(209,'upload','upload','updatesettings',0,'',3),
	(210,'upload','upload','findone',0,'',3),
	(211,'upload','upload','count',0,'',3),
	(212,'upload','upload','getenvironments',0,'',3),
	(213,'upload','upload','getsettings',0,'',3),
	(214,'upload','upload','find',0,'',3),
	(215,'upload','upload','destroy',0,'',3),
	(216,'users-permissions','auth','callback',0,'',3),
	(217,'users-permissions','auth','changepassword',0,'',3),
	(218,'users-permissions','auth','connect',0,'',3),
	(219,'users-permissions','auth','forgotpassword',0,'',3),
	(220,'users-permissions','auth','register',0,'',3),
	(221,'users-permissions','auth','emailconfirmation',0,'',3),
	(222,'users-permissions','user','find',0,'',3),
	(223,'users-permissions','user','me',0,'',3),
	(224,'users-permissions','user','findone',0,'',3),
	(225,'users-permissions','user','create',0,'',3),
	(226,'users-permissions','user','update',0,'',3),
	(227,'users-permissions','user','destroy',0,'',3),
	(228,'users-permissions','user','destroyall',0,'',3),
	(229,'users-permissions','userspermissions','getemailtemplate',0,'',3),
	(230,'users-permissions','userspermissions','searchusers',0,'',3),
	(231,'users-permissions','userspermissions','getroutes',0,'',3),
	(232,'users-permissions','userspermissions','deleterole',0,'',3),
	(233,'users-permissions','userspermissions','getpolicies',0,'',3),
	(234,'users-permissions','userspermissions','getroles',0,'',3),
	(235,'users-permissions','userspermissions','getrole',0,'',3),
	(236,'users-permissions','userspermissions','getproviders',0,'',3),
	(237,'users-permissions','userspermissions','updateemailtemplate',0,'',3),
	(238,'users-permissions','userspermissions','updateadvancedsettings',0,'',3),
	(239,'users-permissions','userspermissions','getpermissions',0,'',3),
	(240,'users-permissions','userspermissions','init',0,'',3),
	(241,'users-permissions','userspermissions','index',0,'',3),
	(242,'users-permissions','userspermissions','createrole',0,'',3),
	(243,'users-permissions','userspermissions','updateproviders',0,'',3),
	(244,'users-permissions','userspermissions','getadvancedsettings',0,'',3),
	(245,'users-permissions','userspermissions','deleteprovider',0,'',3),
	(246,'users-permissions','userspermissions','updaterole',0,'',3),
	(247,'application','classroom','find',0,'',1),
	(248,'application','classroom','findone',0,'',1),
	(249,'application','classroom','count',0,'',1),
	(250,'application','classroom','create',0,'',1),
	(251,'application','classroom','update',0,'',1),
	(252,'application','classroom','delete',0,'',1),
	(253,'application','classroom','find',1,'',2),
	(254,'application','classroom','findone',0,'',2),
	(255,'application','classroom','count',0,'',2),
	(256,'application','classroom','create',0,'',2),
	(257,'application','classroom','update',0,'',2),
	(258,'application','classroom','delete',0,'',2),
	(259,'application','classroom','find',1,'',3),
	(260,'application','classroom','findone',1,'',3),
	(261,'application','classroom','count',0,'',3),
	(262,'application','classroom','create',0,'',3),
	(263,'application','classroom','update',0,'',3),
	(264,'application','classroom','delete',0,'',3),
	(265,'application','classroom','find',0,'',4),
	(266,'application','classroom','count',0,'',4),
	(267,'application','classroom','findone',1,'',4),
	(268,'application','classroom','create',0,'',4),
	(269,'application','classroom','update',0,'',4),
	(270,'application','classroom','delete',0,'',4),
	(271,'application','rate','find',0,'',4),
	(272,'application','rate','findone',0,'',4),
	(273,'application','rate','create',0,'',4),
	(274,'application','rate','count',0,'',4),
	(275,'application','rate','update',1,'',4),
	(276,'application','rate','delete',0,'',4),
	(277,'application','skill','find',1,'',4),
	(278,'application','skill','findone',0,'',4),
	(279,'application','skill','count',0,'',4),
	(280,'application','skill','create',0,'',4),
	(281,'application','skill','update',0,'',4),
	(282,'application','skill','delete',0,'',4),
	(283,'content-manager','contentmanager','find',0,'',4),
	(284,'content-manager','contentmanager','findone',0,'',4),
	(285,'content-manager','contentmanager','count',0,'',4),
	(286,'content-manager','contentmanager','create',0,'',4),
	(287,'content-manager','contentmanager','update',0,'',4),
	(288,'content-manager','contentmanager','delete',0,'',4),
	(289,'content-manager','contentmanager','deletemany',0,'',4),
	(290,'content-manager','contenttypes','listcontenttypes',0,'',4),
	(291,'content-manager','contenttypes','findcontenttype',0,'',4),
	(292,'content-manager','contenttypes','updatecontenttype',0,'',4),
	(293,'content-manager','generalsettings','getgeneralsettings',0,'',4),
	(294,'content-manager','generalsettings','updategeneralsettings',0,'',4),
	(295,'content-manager','groups','listgroups',0,'',4),
	(296,'content-manager','groups','findgroup',0,'',4),
	(297,'content-manager','groups','updategroup',0,'',4),
	(298,'content-type-builder','contenttypebuilder','getmodels',0,'',4),
	(299,'content-type-builder','contenttypebuilder','getmodel',0,'',4),
	(300,'content-type-builder','contenttypebuilder','getconnections',0,'',4),
	(301,'content-type-builder','contenttypebuilder','createmodel',0,'',4),
	(302,'content-type-builder','contenttypebuilder','updatemodel',0,'',4),
	(303,'content-type-builder','contenttypebuilder','deletemodel',0,'',4),
	(304,'content-type-builder','groups','getgroups',0,'',4),
	(305,'content-type-builder','groups','getgroup',0,'',4),
	(306,'content-type-builder','groups','creategroup',0,'',4),
	(307,'content-type-builder','groups','updategroup',0,'',4),
	(308,'content-type-builder','groups','deletegroup',0,'',4),
	(309,'email','email','send',0,'',4),
	(310,'email','email','getenvironments',0,'',4),
	(311,'email','email','getsettings',0,'',4),
	(312,'email','email','updatesettings',0,'',4),
	(313,'upload','upload','upload',0,'',4),
	(314,'upload','upload','search',0,'',4),
	(315,'upload','upload','updatesettings',0,'',4),
	(316,'upload','upload','findone',0,'',4),
	(317,'upload','upload','count',0,'',4),
	(318,'upload','upload','getenvironments',0,'',4),
	(319,'upload','upload','getsettings',0,'',4),
	(320,'upload','upload','find',0,'',4),
	(321,'upload','upload','destroy',0,'',4),
	(322,'users-permissions','auth','callback',0,'',4),
	(323,'users-permissions','auth','changepassword',0,'',4),
	(324,'users-permissions','auth','connect',0,'',4),
	(325,'users-permissions','auth','forgotpassword',0,'',4),
	(326,'users-permissions','auth','register',0,'',4),
	(327,'users-permissions','auth','emailconfirmation',0,'',4),
	(328,'users-permissions','user','find',0,'',4),
	(329,'users-permissions','user','me',0,'',4),
	(330,'users-permissions','user','findone',0,'',4),
	(331,'users-permissions','user','create',0,'',4),
	(332,'users-permissions','user','update',0,'',4),
	(333,'users-permissions','user','destroy',0,'',4),
	(334,'users-permissions','user','destroyall',0,'',4),
	(335,'users-permissions','userspermissions','getemailtemplate',0,'',4),
	(336,'users-permissions','userspermissions','searchusers',0,'',4),
	(337,'users-permissions','userspermissions','getroutes',0,'',4),
	(338,'users-permissions','userspermissions','deleterole',0,'',4),
	(339,'users-permissions','userspermissions','getpolicies',0,'',4),
	(340,'users-permissions','userspermissions','getroles',0,'',4),
	(341,'users-permissions','userspermissions','getrole',0,'',4),
	(342,'users-permissions','userspermissions','getproviders',0,'',4),
	(343,'users-permissions','userspermissions','updateemailtemplate',0,'',4),
	(344,'users-permissions','userspermissions','updateadvancedsettings',0,'',4),
	(345,'users-permissions','userspermissions','getpermissions',0,'',4),
	(346,'users-permissions','userspermissions','init',0,'',4),
	(347,'users-permissions','userspermissions','index',0,'',4),
	(348,'users-permissions','userspermissions','createrole',0,'',4),
	(349,'users-permissions','userspermissions','updateproviders',0,'',4),
	(350,'users-permissions','userspermissions','getadvancedsettings',0,'',4),
	(351,'users-permissions','userspermissions','deleteprovider',0,'',4),
	(352,'users-permissions','userspermissions','updaterole',0,'',4);

/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table users-permissions_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_role`;

CREATE TABLE `users-permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_ROLE` (`name`,`description`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`)
VALUES
	(1,'Authenticated','Default role given to authenticated user.','authenticated'),
	(2,'Public','Default role given to unauthenticated user.','public'),
	(3,'Teacher','','teacher'),
	(4,'Student','','student');

/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table users-permissions_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_user`;

CREATE TABLE `users-permissions_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Job` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_USER` (`username`,`provider`,`resetPasswordToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmed`, `blocked`, `role`, `created_at`, `updated_at`, `Job`, `description`)
VALUES
	(2,'Lorick Travailleur','lorick.travailleur@hetic.net','local','$2a$10$dn/zKvndNq3AIzgpVtoPquTAUZ.CCHIjGVjiwLlhjtgCBt1ooz1m.',NULL,NULL,NULL,1,'2019-11-13 14:23:42','2019-11-13 14:23:42','Développeur Front-end','beau gosse du dev');

/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table users-permissions_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_user_groups`;

CREATE TABLE `users-permissions_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `group_type` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `users-permissions_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_permissions_user_groups_users-permissions_user_id_foreign` (`users-permissions_user_id`),
  CONSTRAINT `users_permissions_user_groups_users-permissions_user_id_foreign` FOREIGN KEY (`users-permissions_user_id`) REFERENCES `users-permissions_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_user_groups` WRITE;
/*!40000 ALTER TABLE `users-permissions_user_groups` DISABLE KEYS */;

INSERT INTO `users-permissions_user_groups` (`id`, `field`, `order`, `group_type`, `group_id`, `users-permissions_user_id`)
VALUES
	(3,'Skills',1,'groups_rated_skills',3,2),
	(4,'Skills',2,'groups_rated_skills',4,2),
	(5,'Skills',3,'groups_rated_skills',5,2),
	(6,'Skills',4,'groups_rated_skills',6,2),
	(7,'Skills',5,'groups_rated_skills',7,2);

/*!40000 ALTER TABLE `users-permissions_user_groups` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
