
--
-- Table structure for table `guild_emblems`
--

CREATE TABLE IF NOT EXISTS `guild_emblems` (
  `world_name` TEXT NOT NULL,
  `guild_id` INTEGER NOT NULL,
  `file_type` TEXT NOT NULL,
  `file_data` BLOB,
  `version` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`world_name`, `guild_id`)
);

--
-- Table structure for table `user_configs`
--

CREATE TABLE IF NOT EXISTS `user_configs` (
  `world_name` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL,
  `data` TEXT NOT NULL,
  PRIMARY KEY (`world_name`, `account_id`)
);


--
-- Table structure for table `char_configs`
--

CREATE TABLE IF NOT EXISTS `char_configs` (
  `world_name` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `data` TEXT NOT NULL,
  PRIMARY KEY (`world_name`, `account_id`, `char_id`)
);

--
-- Table structure for table `merchant_configs`
--

CREATE TABLE IF NOT EXISTS `merchant_configs` (
  `world_name` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `store_type` INTEGER NOT NULL DEFAULT 0,
  `data` TEXT NOT NULL,
  PRIMARY KEY (`world_name`, `account_id`, `char_id`, `store_type`)
);
