--
-- Table structure for table `acc_reg_num`
--

CREATE TABLE IF NOT EXISTS `acc_reg_num` (
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`account_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_acc_reg_num_account_id` ON `acc_reg_num` (`account_id`);

--
-- Table structure for table `acc_reg_str`
--

CREATE TABLE IF NOT EXISTS `acc_reg_str` (
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` TEXT NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_acc_reg_str_account_id` ON `acc_reg_str` (`account_id`);

--
-- Table structure for table `achievement`
--

CREATE TABLE IF NOT EXISTS `achievement` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `id` INTEGER NOT NULL,
  `count1` INTEGER NOT NULL DEFAULT 0,
  `count2` INTEGER NOT NULL DEFAULT 0,
  `count3` INTEGER NOT NULL DEFAULT 0,
  `count4` INTEGER NOT NULL DEFAULT 0,
  `count5` INTEGER NOT NULL DEFAULT 0,
  `count6` INTEGER NOT NULL DEFAULT 0,
  `count7` INTEGER NOT NULL DEFAULT 0,
  `count8` INTEGER NOT NULL DEFAULT 0,
  `count9` INTEGER NOT NULL DEFAULT 0,
  `count10` INTEGER NOT NULL DEFAULT 0,
  `completed` TEXT,
  `rewarded` TEXT,
  PRIMARY KEY (`char_id`,`id`)
);

CREATE INDEX IF NOT EXISTS `idx_achievement_char_id` ON `achievement` (`char_id`);

--
-- Table structure for table `auction`
--

CREATE TABLE IF NOT EXISTS `auction` (
  `auction_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `seller_id` INTEGER NOT NULL DEFAULT 0,
  `seller_name` TEXT NOT NULL DEFAULT '',
  `buyer_id` INTEGER NOT NULL DEFAULT 0,
  `buyer_name` TEXT NOT NULL DEFAULT '',
  `price` INTEGER NOT NULL DEFAULT 0,
  `buynow` INTEGER NOT NULL DEFAULT 0,
  `hours` INTEGER NOT NULL DEFAULT 0,
  `timestamp` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `item_name` TEXT NOT NULL DEFAULT '',
  `type` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

--
-- Table `barter` for barter shop persistency
--

CREATE TABLE IF NOT EXISTS `barter` (
  `name` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL,
  PRIMARY KEY  (`name`,`index`)
);

--
-- Table structure for `db_roulette`
--

CREATE TABLE IF NOT EXISTS `db_roulette` (
  `index` INTEGER NOT NULL DEFAULT 0,
  `level` INTEGER NOT NULL,
  `item_id` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL DEFAULT 1,
  `flag` INTEGER NOT NULL DEFAULT 1,
  PRIMARY KEY (`index`)
);

--
-- Table structure for table `bonus_script`
--

CREATE TABLE IF NOT EXISTS `bonus_script` (
  `char_id` INTEGER NOT NULL,
  `script` TEXT NOT NULL,
  `tick` INTEGER NOT NULL DEFAULT 0,
  `flag` INTEGER NOT NULL DEFAULT 0,
  `type` INTEGER NOT NULL DEFAULT 0,
  `icon` INTEGER NOT NULL DEFAULT -1
);

CREATE INDEX IF NOT EXISTS `idx_bonus_script_char_id` ON `bonus_script` (`char_id`);

--
-- Table structure for table `buyingstore_items`
--

CREATE TABLE IF NOT EXISTS `buyingstore_items` (
  `buyingstore_id` INTEGER NOT NULL,
  `index` INTEGER NOT NULL,
  `item_id` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL,
  `price` INTEGER NOT NULL,
  PRIMARY KEY (`buyingstore_id`, `index`)
);

--
-- Table structure for table `buyingstores`
--

CREATE TABLE IF NOT EXISTS `buyingstores` (
  `id` INTEGER NOT NULL,
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `sex` TEXT NOT NULL DEFAULT 'M' CHECK (`sex` IN ('F','M')),
  `map` TEXT NOT NULL,
  `x` INTEGER NOT NULL,
  `y` INTEGER NOT NULL,
  `title` TEXT NOT NULL,
  `limit` INTEGER NOT NULL,
  `body_direction` TEXT NOT NULL DEFAULT '4',
  `head_direction` TEXT NOT NULL DEFAULT '0',
  `sit` TEXT NOT NULL DEFAULT '1',
  `autotrade` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for table `cart_inventory`
--

CREATE TABLE IF NOT EXISTS `cart_inventory` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 0,
  `equip` INTEGER NOT NULL DEFAULT 0,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `expire_time` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_cart_inventory_char_id` ON `cart_inventory` (`char_id`);

--
-- Table structure for table `char`
--

CREATE TABLE IF NOT EXISTS `char` (
  `char_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_num` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `class` INTEGER NOT NULL DEFAULT 0,
  `base_level` INTEGER NOT NULL DEFAULT 1,
  `job_level` INTEGER NOT NULL DEFAULT 1,
  `base_exp` INTEGER NOT NULL DEFAULT 0,
  `job_exp` INTEGER NOT NULL DEFAULT 0,
  `zeny` INTEGER NOT NULL DEFAULT 0,
  `str` INTEGER NOT NULL DEFAULT 0,
  `agi` INTEGER NOT NULL DEFAULT 0,
  `vit` INTEGER NOT NULL DEFAULT 0,
  `int` INTEGER NOT NULL DEFAULT 0,
  `dex` INTEGER NOT NULL DEFAULT 0,
  `luk` INTEGER NOT NULL DEFAULT 0,
  `pow` INTEGER NOT NULL DEFAULT 0,
  `sta` INTEGER NOT NULL DEFAULT 0,
  `wis` INTEGER NOT NULL DEFAULT 0,
  `spl` INTEGER NOT NULL DEFAULT 0,
  `con` INTEGER NOT NULL DEFAULT 0,
  `crt` INTEGER NOT NULL DEFAULT 0,
  `max_hp` INTEGER NOT NULL DEFAULT 0,
  `hp` INTEGER NOT NULL DEFAULT 0,
  `max_sp` INTEGER NOT NULL DEFAULT 0,
  `sp` INTEGER NOT NULL DEFAULT 0,
  `max_ap` INTEGER NOT NULL DEFAULT 0,
  `ap` INTEGER NOT NULL DEFAULT 0,
  `status_point` INTEGER NOT NULL DEFAULT 0,
  `skill_point` INTEGER NOT NULL DEFAULT 0,
  `trait_point` INTEGER NOT NULL DEFAULT 0,
  `option` INTEGER NOT NULL DEFAULT 0,
  `karma` INTEGER NOT NULL DEFAULT 0,
  `manner` INTEGER NOT NULL DEFAULT 0,
  `party_id` INTEGER NOT NULL DEFAULT 0,
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `pet_id` INTEGER NOT NULL DEFAULT 0,
  `homun_id` INTEGER NOT NULL DEFAULT 0,
  `elemental_id` INTEGER NOT NULL DEFAULT 0,
  `hair` INTEGER NOT NULL DEFAULT 0,
  `hair_color` INTEGER NOT NULL DEFAULT 0,
  `clothes_color` INTEGER NOT NULL DEFAULT 0,
  `body` INTEGER NOT NULL DEFAULT 0,
  `weapon` INTEGER NOT NULL DEFAULT 0,
  `shield` INTEGER NOT NULL DEFAULT 0,
  `head_top` INTEGER NOT NULL DEFAULT 0,
  `head_mid` INTEGER NOT NULL DEFAULT 0,
  `head_bottom` INTEGER NOT NULL DEFAULT 0,
  `robe` INTEGER NOT NULL DEFAULT 0,
  `last_map` TEXT NOT NULL DEFAULT '',
  `last_x` INTEGER NOT NULL DEFAULT 53,
  `last_y` INTEGER NOT NULL DEFAULT 111,
  `last_instanceid` INTEGER NOT NULL DEFAULT 0,
  `save_map` TEXT NOT NULL DEFAULT '',
  `save_x` INTEGER NOT NULL DEFAULT 53,
  `save_y` INTEGER NOT NULL DEFAULT 111,
  `partner_id` INTEGER NOT NULL DEFAULT 0,
  `online` INTEGER NOT NULL DEFAULT 0,
  `father` INTEGER NOT NULL DEFAULT 0,
  `mother` INTEGER NOT NULL DEFAULT 0,
  `child` INTEGER NOT NULL DEFAULT 0,
  `fame` INTEGER NOT NULL DEFAULT 0,
  `rename` INTEGER NOT NULL DEFAULT 0,
  `delete_date` INTEGER NOT NULL DEFAULT 0,
  `moves` INTEGER NOT NULL DEFAULT 0,
  `unban_time` INTEGER NOT NULL DEFAULT 0,
  `font` INTEGER NOT NULL DEFAULT 0,
  `uniqueitem_counter` INTEGER NOT NULL DEFAULT 0,
  `sex` TEXT NOT NULL CHECK (`sex` IN ('M','F')),
  `hotkey_rowshift` INTEGER NOT NULL DEFAULT 0,
  `hotkey_rowshift2` INTEGER NOT NULL DEFAULT 0,
  `clan_id` INTEGER NOT NULL DEFAULT 0,
  `last_login` TEXT DEFAULT NULL,
  `title_id` INTEGER NOT NULL DEFAULT 0,
  `show_equip` INTEGER NOT NULL DEFAULT 0,
  `inventory_slots` INTEGER NOT NULL DEFAULT 100,
  `body_direction` INTEGER NOT NULL DEFAULT 0,
  `disable_call` INTEGER NOT NULL DEFAULT 0,
  `disable_partyinvite` INTEGER NOT NULL DEFAULT 0
);

CREATE UNIQUE INDEX IF NOT EXISTS `idx_char_name` ON `char` (`name`);
CREATE INDEX IF NOT EXISTS `idx_char_account_id` ON `char` (`account_id`);
CREATE INDEX IF NOT EXISTS `idx_char_party_id` ON `char` (`party_id`);
CREATE INDEX IF NOT EXISTS `idx_char_guild_id` ON `char` (`guild_id`);
CREATE INDEX IF NOT EXISTS `idx_char_online` ON `char` (`online`); 

--
-- Table structure for table `char_reg_num`
--

CREATE TABLE IF NOT EXISTS `char_reg_num` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_char_reg_num_char_id` ON `char_reg_num` (`char_id`);

--
-- Table structure for table `char_reg_str`
--

CREATE TABLE IF NOT EXISTS `char_reg_str` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` TEXT NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_char_reg_str_char_id` ON `char_reg_str` (`char_id`);

--
-- Table structure for table `charlog`
--

CREATE TABLE IF NOT EXISTS `charlog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `char_msg` TEXT NOT NULL DEFAULT 'char select',
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_num` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `str` INTEGER NOT NULL DEFAULT 0,
  `agi` INTEGER NOT NULL DEFAULT 0,
  `vit` INTEGER NOT NULL DEFAULT 0,
  `int` INTEGER NOT NULL DEFAULT 0,
  `dex` INTEGER NOT NULL DEFAULT 0,
  `luk` INTEGER NOT NULL DEFAULT 0,
  `hair` INTEGER NOT NULL DEFAULT 0,
  `hair_color` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_charlog_account_id` ON `charlog` (`account_id`); 

--
-- Table structure for table `clan`
--

CREATE TABLE IF NOT EXISTS `clan` (
  `clan_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL DEFAULT '',
  `master` TEXT NOT NULL DEFAULT '',
  `mapname` TEXT NOT NULL DEFAULT '',
  `max_member` INTEGER NOT NULL DEFAULT 0
);

-- ----------------------------
-- Records of clan
-- ----------------------------

INSERT INTO `clan` VALUES ('1', 'Swordman Clan', 'Raffam Oranpere', 'prontera', '500');
INSERT INTO `clan` VALUES ('2', 'Arcwand Clan', 'Devon Aire', 'geffen', '500');
INSERT INTO `clan` VALUES ('3', 'Golden Mace Clan', 'Berman Aire', 'prontera', '500');
INSERT INTO `clan` VALUES ('4', 'Crossbow Clan', 'Shaam Rumi', 'payon', '500');

--
-- Table structure for `clan_alliance`
--

CREATE TABLE IF NOT EXISTS `clan_alliance` (
  `clan_id` INTEGER NOT NULL DEFAULT 0,
  `opposition` INTEGER NOT NULL DEFAULT 0,
  `alliance_id` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  PRIMARY KEY (`clan_id`,`alliance_id`)
);

CREATE INDEX IF NOT EXISTS `idx_clan_alliance_alliance_id` ON `clan_alliance` (`alliance_id`);

-- ----------------------------
-- Records of clan_alliance
-- ----------------------------

INSERT INTO `clan_alliance` VALUES ('1', '0', '3', 'Golden Mace Clan');
INSERT INTO `clan_alliance` VALUES ('2', '0', '3', 'Golden Mace Clan');
INSERT INTO `clan_alliance` VALUES ('2', '1', '4', 'Crossbow Clan');
INSERT INTO `clan_alliance` VALUES ('3', '0', '1', 'Swordman Clan');
INSERT INTO `clan_alliance` VALUES ('3', '0', '2', 'Arcwand Clan');
INSERT INTO `clan_alliance` VALUES ('3', '0', '4', 'Crossbow Clan');
INSERT INTO `clan_alliance` VALUES ('4', '0', '3', 'Golden Mace Clan');
INSERT INTO `clan_alliance` VALUES ('4', '1', '2', 'Arcwand Clan');

--
-- Table structure for table `elemental`
--

CREATE TABLE IF NOT EXISTS `elemental` (
  `ele_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL,
  `class` INTEGER NOT NULL DEFAULT 0,
  `mode` INTEGER NOT NULL DEFAULT 1,
  `hp` INTEGER NOT NULL DEFAULT 0,
  `sp` INTEGER NOT NULL DEFAULT 0,
  `max_hp` INTEGER NOT NULL DEFAULT 0,
  `max_sp` INTEGER NOT NULL DEFAULT 0,
  `atk1` INTEGER NOT NULL DEFAULT 0,
  `atk2` INTEGER NOT NULL DEFAULT 0,
  `matk` INTEGER NOT NULL DEFAULT 0,
  `aspd` INTEGER NOT NULL DEFAULT 0,
  `def` INTEGER NOT NULL DEFAULT 0,
  `mdef` INTEGER NOT NULL DEFAULT 0,
  `flee` INTEGER NOT NULL DEFAULT 0,
  `hit` INTEGER NOT NULL DEFAULT 0,
  `life_time` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `friend_id` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `friend_id`)
);

--
-- Table structure for table `global_acc_reg_num`
--

CREATE TABLE IF NOT EXISTS `global_acc_reg_num` (
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`account_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_global_acc_reg_num_account_id` ON `global_acc_reg_num` (`account_id`);

--
-- Table structure for table `global_acc_reg_str`
--

CREATE TABLE IF NOT EXISTS `global_acc_reg_str` (
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `key` TEXT NOT NULL DEFAULT '',
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` TEXT NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`key`,`index`)
);

CREATE INDEX IF NOT EXISTS `idx_global_acc_reg_str_account_id` ON `global_acc_reg_str` (`account_id`);

--
-- Table structure for table `guild`
--

CREATE TABLE IF NOT EXISTS `guild` (
  `guild_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL DEFAULT '',
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `master` TEXT NOT NULL DEFAULT '',
  `guild_lv` INTEGER NOT NULL DEFAULT 0,
  `connect_member` INTEGER NOT NULL DEFAULT 0,
  `max_member` INTEGER NOT NULL DEFAULT 0,
  `average_lv` INTEGER NOT NULL DEFAULT 1,
  `exp` INTEGER NOT NULL DEFAULT 0,
  `next_exp` INTEGER NOT NULL DEFAULT 0,
  `skill_point` INTEGER NOT NULL DEFAULT 0,
  `mes1` TEXT NOT NULL DEFAULT '',
  `mes2` TEXT NOT NULL DEFAULT '',
  `emblem_len` INTEGER NOT NULL DEFAULT 0,
  `emblem_id` INTEGER NOT NULL DEFAULT 0,
  `emblem_data` BLOB,
  `last_master_change` TEXT
);

CREATE UNIQUE INDEX IF NOT EXISTS `idx_guild_guild_id` ON `guild` (`guild_id`);
CREATE INDEX IF NOT EXISTS `idx_guild_char_id` ON `guild` (`char_id`);

--
-- Table structure for table `guild_alliance`
--

CREATE TABLE IF NOT EXISTS `guild_alliance` (
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `opposition` INTEGER NOT NULL DEFAULT 0,
  `alliance_id` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  PRIMARY KEY (`guild_id`,`alliance_id`)
);

CREATE INDEX IF NOT EXISTS `idx_guild_alliance_alliance_id` ON `guild_alliance` (`alliance_id`);

--
-- Table structure for table `guild_castle`
--

CREATE TABLE IF NOT EXISTS `guild_castle` (
  `castle_id` INTEGER NOT NULL DEFAULT 0,
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `economy` INTEGER NOT NULL DEFAULT 0,
  `defense` INTEGER NOT NULL DEFAULT 0,
  `triggerE` INTEGER NOT NULL DEFAULT 0,
  `triggerD` INTEGER NOT NULL DEFAULT 0,
  `nextTime` INTEGER NOT NULL DEFAULT 0,
  `payTime` INTEGER NOT NULL DEFAULT 0,
  `createTime` INTEGER NOT NULL DEFAULT 0,
  `visibleC` INTEGER NOT NULL DEFAULT 0,
  `visibleG0` INTEGER NOT NULL DEFAULT 0,
  `visibleG1` INTEGER NOT NULL DEFAULT 0,
  `visibleG2` INTEGER NOT NULL DEFAULT 0,
  `visibleG3` INTEGER NOT NULL DEFAULT 0,
  `visibleG4` INTEGER NOT NULL DEFAULT 0,
  `visibleG5` INTEGER NOT NULL DEFAULT 0,
  `visibleG6` INTEGER NOT NULL DEFAULT 0,
  `visibleG7` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`castle_id`)
);

CREATE INDEX IF NOT EXISTS `idx_guild_castle_guild_id` ON `guild_castle` (`guild_id`);

--
-- Table structure for table `guild_expulsion`
--

CREATE TABLE IF NOT EXISTS `guild_expulsion` (
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `mes` TEXT NOT NULL DEFAULT '',
  `char_id` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`guild_id`,`name`)
);

--
-- Table structure for table `guild_member`
--

CREATE TABLE IF NOT EXISTS `guild_member` (
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `exp` INTEGER NOT NULL DEFAULT 0,
  `position` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`guild_id`,`char_id`)
);

CREATE INDEX IF NOT EXISTS `idx_guild_member_char_id` ON `guild_member` (`char_id`);

--
-- Table structure for table `guild_position`
--

CREATE TABLE IF NOT EXISTS `guild_position` (
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `position` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `mode` INTEGER NOT NULL DEFAULT 0,
  `exp_mode` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`guild_id`,`position`)
);

--
-- Table structure for table `guild_skill`
--

CREATE TABLE IF NOT EXISTS `guild_skill` (
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `id` INTEGER NOT NULL DEFAULT 0,
  `lv` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`guild_id`,`id`)
);

--
-- Table structure for table `guild_storage`
--

CREATE TABLE IF NOT EXISTS `guild_storage` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 0,
  `equip` INTEGER NOT NULL DEFAULT 0,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `expire_time` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_guild_storage_guild_id` ON `guild_storage` (`guild_id`);

--
-- Table structure for table `guild_storage_log`
--

CREATE TABLE IF NOT EXISTS `guild_storage_log` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `guild_id` INTEGER NOT NULL DEFAULT 0,
  `time` TEXT NOT NULL,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 1,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `expire_time` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_guild_storage_log_guild_id` ON `guild_storage_log` (`guild_id`);

--
-- Table structure for table `homunculus`
--

CREATE TABLE IF NOT EXISTS `homunculus` (
  `homun_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL,
  `class` INTEGER NOT NULL DEFAULT 0,
  `prev_class` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `level` INTEGER NOT NULL DEFAULT 0,
  `exp` INTEGER NOT NULL DEFAULT 0,
  `intimacy` INTEGER NOT NULL DEFAULT 0,
  `hunger` INTEGER NOT NULL DEFAULT 0,
  `str` INTEGER NOT NULL DEFAULT 0,
  `agi` INTEGER NOT NULL DEFAULT 0,
  `vit` INTEGER NOT NULL DEFAULT 0,
  `int` INTEGER NOT NULL DEFAULT 0,
  `dex` INTEGER NOT NULL DEFAULT 0,
  `luk` INTEGER NOT NULL DEFAULT 0,
  `hp` INTEGER NOT NULL DEFAULT 0,
  `max_hp` INTEGER NOT NULL DEFAULT 0,
  `sp` INTEGER NOT NULL DEFAULT 0,
  `max_sp` INTEGER NOT NULL DEFAULT 0,
  `skill_point` INTEGER NOT NULL DEFAULT 0,
  `alive` INTEGER NOT NULL DEFAULT 1,
  `rename_flag` INTEGER NOT NULL DEFAULT 0,
  `vaporize` INTEGER NOT NULL DEFAULT 0,
  `autofeed` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `hotkey`
--

CREATE TABLE IF NOT EXISTS `hotkey` (
  `char_id` INTEGER NOT NULL,
  `hotkey` INTEGER NOT NULL,
  `type` INTEGER NOT NULL DEFAULT 0,
  `itemskill_id` INTEGER NOT NULL DEFAULT 0,
  `skill_lvl` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`hotkey`)
);

-- 
-- Table structure for table `interlog`
--

CREATE TABLE IF NOT EXISTS `interlog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `log` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_interlog_time` ON `interlog` (`time`);

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 0,
  `equip` INTEGER NOT NULL DEFAULT 0,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `expire_time` INTEGER NOT NULL DEFAULT 0,
  `favorite` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `equip_switch` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_inventory_char_id` ON `inventory` (`char_id`);

--
-- Table structure for table `ipbanlist`
--

CREATE TABLE IF NOT EXISTS `ipbanlist` (
  `list` TEXT NOT NULL DEFAULT '',
  `btime` TEXT NOT NULL,
  `rtime` TEXT NOT NULL,
  `reason` TEXT NOT NULL DEFAULT '',
  PRIMARY KEY (`list`, `btime`)
);

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `account_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userid` TEXT NOT NULL DEFAULT '',
  `user_pass` TEXT NOT NULL DEFAULT '',
  `sex` TEXT NOT NULL DEFAULT 'M' CHECK (`sex` IN ('M','F','S')),
  `email` TEXT NOT NULL DEFAULT '',
  `group_id` INTEGER NOT NULL DEFAULT 0,
  `state` INTEGER NOT NULL DEFAULT 0,
  `unban_time` INTEGER NOT NULL DEFAULT 0,
  `expiration_time` INTEGER NOT NULL DEFAULT 0,
  `logincount` INTEGER NOT NULL DEFAULT 0,
  `lastlogin` TEXT,
  `last_ip` TEXT NOT NULL DEFAULT '',
  `birthdate` TEXT,
  `character_slots` INTEGER NOT NULL DEFAULT 0,
  `pincode` TEXT NOT NULL DEFAULT '',
  `pincode_change` INTEGER NOT NULL DEFAULT 0,
  `vip_time` INTEGER NOT NULL DEFAULT 0,
  `old_group` INTEGER NOT NULL DEFAULT 0,
  `web_auth_token` TEXT,
  `web_auth_token_enabled` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_login_userid` ON `login` (`userid`);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_login_web_auth_token` ON `login` (`web_auth_token`); 

-- added standard accounts for servers, VERY INSECURE!!!
-- inserted into the table called login which is above

INSERT INTO `login` (`account_id`, `userid`, `user_pass`, `sex`, `email`) VALUES ('1', 's1', 'p1', 'S','athena@athena.com');

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `send_name` TEXT NOT NULL DEFAULT '',
  `send_id` INTEGER NOT NULL DEFAULT 0,
  `dest_name` TEXT NOT NULL DEFAULT '',
  `dest_id` INTEGER NOT NULL DEFAULT 0,
  `title` TEXT NOT NULL DEFAULT '',
  `message` TEXT NOT NULL DEFAULT '',
  `time` INTEGER NOT NULL DEFAULT 0,
  `status` INTEGER NOT NULL DEFAULT 0,
  `zeny` INTEGER NOT NULL DEFAULT 0,
  `type` INTEGER NOT NULL DEFAULT 0
);

-- ----------------------------
-- Table structure for `mail_attachments`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `mail_attachments` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `index` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `mapreg`
--

CREATE TABLE IF NOT EXISTS `mapreg` (
  `varname` TEXT NOT NULL,
  `index` INTEGER NOT NULL DEFAULT 0,
  `value` TEXT NOT NULL,
  PRIMARY KEY (`varname`,`index`)
);

--
-- Table `market` for market shop persistency
--

CREATE TABLE IF NOT EXISTS `market` (
  `name` TEXT NOT NULL DEFAULT '',
  `nameid` INTEGER NOT NULL,
  `price` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL,
  `flag` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`,`nameid`)
);

--
-- Table structure for table `memo`
--

CREATE TABLE IF NOT EXISTS `memo` (
  `memo_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `map` TEXT NOT NULL DEFAULT '',
  `x` INTEGER NOT NULL DEFAULT 0,
  `y` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_memo_char_id` ON `memo` (`char_id`);

--
-- Table structure for table `mercenary`
--

CREATE TABLE IF NOT EXISTS `mercenary` (
  `mer_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `char_id` INTEGER NOT NULL,
  `class` INTEGER NOT NULL DEFAULT 0,
  `hp` INTEGER NOT NULL DEFAULT 0,
  `sp` INTEGER NOT NULL DEFAULT 0,
  `kill_counter` INTEGER NOT NULL,
  `life_time` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `mercenary_owner`
--

CREATE TABLE IF NOT EXISTS `mercenary_owner` (
  `char_id` INTEGER NOT NULL,
  `merc_id` INTEGER NOT NULL DEFAULT 0,
  `arch_calls` INTEGER NOT NULL DEFAULT 0,
  `arch_faith` INTEGER NOT NULL DEFAULT 0,
  `spear_calls` INTEGER NOT NULL DEFAULT 0,
  `spear_faith` INTEGER NOT NULL DEFAULT 0,
  `sword_calls` INTEGER NOT NULL DEFAULT 0,
  `sword_faith` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`)
);

-- ----------------------------
-- Table structure for `sales`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `sales` (
  `nameid` INTEGER NOT NULL,
  `start` TEXT NOT NULL,
  `end` TEXT NOT NULL,
  `amount` INTEGER NOT NULL,
  PRIMARY KEY (`nameid`)
);

--
-- Table structure for table `sc_data`
--

CREATE TABLE IF NOT EXISTS `sc_data` (
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `type` INTEGER NOT NULL,
  `tick` INTEGER NOT NULL,
  `val1` INTEGER NOT NULL DEFAULT 0,
  `val2` INTEGER NOT NULL DEFAULT 0,
  `val3` INTEGER NOT NULL DEFAULT 0,
  `val4` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `type`)
);

--
-- Table structure for table `skillcooldown`
--

CREATE TABLE IF NOT EXISTS `skillcooldown` (
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`char_id`, `skill`)
);

--
-- Table structure for table `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `party_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL DEFAULT '',
  `exp` INTEGER NOT NULL DEFAULT 0,
  `item` INTEGER NOT NULL DEFAULT 0,
  `leader_id` INTEGER NOT NULL DEFAULT 0,
  `leader_char` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `party_bookings`
--

CREATE TABLE IF NOT EXISTS `party_bookings` (
  `world_name` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `char_name` TEXT NOT NULL,
  `purpose` INTEGER NOT NULL DEFAULT 0,
  `assist` INTEGER NOT NULL DEFAULT 0,
  `damagedealer` INTEGER NOT NULL DEFAULT 0,
  `healer` INTEGER NOT NULL DEFAULT 0,
  `tanker` INTEGER NOT NULL DEFAULT 0,
  `minimum_level` INTEGER NOT NULL,
  `maximum_level` INTEGER NOT NULL,
  `comment` TEXT NOT NULL DEFAULT '',
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`world_name`, `account_id`, `char_id`)
);

--
-- Table structure for table `pet`
--

CREATE TABLE IF NOT EXISTS `pet` (
  `pet_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `class` INTEGER NOT NULL DEFAULT 0,
  `name` TEXT NOT NULL DEFAULT '',
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `level` INTEGER NOT NULL DEFAULT 0,
  `egg_id` INTEGER NOT NULL DEFAULT 0,
  `equip` INTEGER NOT NULL DEFAULT 0,
  `intimate` INTEGER NOT NULL DEFAULT 0,
  `hungry` INTEGER NOT NULL DEFAULT 0,
  `rename_flag` INTEGER NOT NULL DEFAULT 0,
  `incubate` INTEGER NOT NULL DEFAULT 0,
  `autofeed` INTEGER NOT NULL DEFAULT 0
);

--
-- Table structure for table `quest`
--

CREATE TABLE IF NOT EXISTS `quest` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `quest_id` INTEGER NOT NULL,
  `state` TEXT NOT NULL DEFAULT '0' CHECK (`state` IN ('0','1','2')),
  `time` INTEGER NOT NULL DEFAULT 0,
  `count1` INTEGER NOT NULL DEFAULT 0,
  `count2` INTEGER NOT NULL DEFAULT 0,
  `count3` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`quest_id`)
);

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `id` INTEGER NOT NULL DEFAULT 0,
  `lv` INTEGER NOT NULL DEFAULT 0,
  `flag` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`id`)
);

--
-- Table structure for table `skill_homunculus`
--

CREATE TABLE IF NOT EXISTS `skill_homunculus` (
  `homun_id` INTEGER NOT NULL,
  `id` INTEGER NOT NULL,
  `lv` INTEGER NOT NULL,
  PRIMARY KEY (`homun_id`,`id`)
);

--
-- Table structure for table `skillcooldown_homunculus`
--

CREATE TABLE IF NOT EXISTS `skillcooldown_homunculus` (
  `homun_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`homun_id`,`skill`)
);

--
-- Table structure for table `skillcooldown_mercenary`
--

CREATE TABLE IF NOT EXISTS `skillcooldown_mercenary` (
  `mer_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`mer_id`,`skill`)
);

--
-- Table structure for table `storage`
--

CREATE TABLE IF NOT EXISTS `storage` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 0,
  `equip` INTEGER NOT NULL DEFAULT 0,
  `identify` INTEGER NOT NULL DEFAULT 0,
  `refine` INTEGER NOT NULL DEFAULT 0,
  `attribute` INTEGER NOT NULL DEFAULT 0,
  `card0` INTEGER NOT NULL DEFAULT 0,
  `card1` INTEGER NOT NULL DEFAULT 0,
  `card2` INTEGER NOT NULL DEFAULT 0,
  `card3` INTEGER NOT NULL DEFAULT 0,
  `option_id0` INTEGER NOT NULL DEFAULT 0,
  `option_val0` INTEGER NOT NULL DEFAULT 0,
  `option_parm0` INTEGER NOT NULL DEFAULT 0,
  `option_id1` INTEGER NOT NULL DEFAULT 0,
  `option_val1` INTEGER NOT NULL DEFAULT 0,
  `option_parm1` INTEGER NOT NULL DEFAULT 0,
  `option_id2` INTEGER NOT NULL DEFAULT 0,
  `option_val2` INTEGER NOT NULL DEFAULT 0,
  `option_parm2` INTEGER NOT NULL DEFAULT 0,
  `option_id3` INTEGER NOT NULL DEFAULT 0,
  `option_val3` INTEGER NOT NULL DEFAULT 0,
  `option_parm3` INTEGER NOT NULL DEFAULT 0,
  `option_id4` INTEGER NOT NULL DEFAULT 0,
  `option_val4` INTEGER NOT NULL DEFAULT 0,
  `option_parm4` INTEGER NOT NULL DEFAULT 0,
  `expire_time` INTEGER NOT NULL DEFAULT 0,
  `bound` INTEGER NOT NULL DEFAULT 0,
  `unique_id` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX `account_id` ON `storage` (`account_id`);

--
-- Table structure for table `vending_items`
--

CREATE TABLE IF NOT EXISTS `vending_items` (
  `vending_id` INTEGER NOT NULL,
  `index` INTEGER NOT NULL,
  `cartinventory_id` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL,
  `price` INTEGER NOT NULL,
  PRIMARY KEY (`vending_id`, `index`)
);

--
-- Table structure for table `vendings`
--

CREATE TABLE IF NOT EXISTS `vendings` (
  `id` INTEGER NOT NULL,
  `account_id` INTEGER NOT NULL,
  `char_id` INTEGER NOT NULL,
  `sex` TEXT NOT NULL DEFAULT 'M' CHECK (`sex` IN ('F','M')),
  `map` TEXT NOT NULL,
  `x` INTEGER NOT NULL,
  `y` INTEGER NOT NULL,
  `title` TEXT NOT NULL,
  `body_direction` TEXT NOT NULL DEFAULT '4',
  `head_direction` TEXT NOT NULL DEFAULT '0',
  `sit` TEXT NOT NULL DEFAULT '1',
  `autotrade` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);
