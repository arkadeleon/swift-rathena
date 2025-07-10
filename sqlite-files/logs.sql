--
-- Table structure for table `atcommandlog`
--

CREATE TABLE IF NOT EXISTS `atcommandlog` (
  `atcommand_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `atcommand_date` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `char_name` TEXT NOT NULL DEFAULT '',
  `map` TEXT NOT NULL DEFAULT '',
  `command` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_atcommandlog_account_id` ON `atcommandlog` (`account_id`);
CREATE INDEX IF NOT EXISTS `idx_atcommandlog_char_id` ON `atcommandlog` (`char_id`);

--
-- Table structure for table `branchlog`
--

CREATE TABLE IF NOT EXISTS `branchlog` (
  `branch_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `branch_date` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `char_name` TEXT NOT NULL DEFAULT '',
  `map` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_branchlog_account_id` ON `branchlog` (`account_id`);
CREATE INDEX IF NOT EXISTS `idx_branchlog_char_id` ON `branchlog` (`char_id`);

--
-- Table structure for table `cashlog`
--

CREATE TABLE IF NOT EXISTS `cashlog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `type` TEXT NOT NULL DEFAULT 'S' CHECK (`type` IN ('T','V','P','M','S','N','D','C','A','E','I','B','$')),
  `cash_type` TEXT NOT NULL DEFAULT 'O' CHECK (`cash_type` IN ('O','K','C')),
  `amount` INTEGER NOT NULL DEFAULT 0,
  `map` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_cashlog_type` ON `cashlog` (`type`);

--
-- Table structure for table `chatlog`
--
# ChatLog types
# Gl(O)bal
# (W)hisper
# (P)arty
# (G)uild
# (M)ain chat
# (C)lan

CREATE TABLE IF NOT EXISTS `chatlog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `type` TEXT NOT NULL DEFAULT 'O' CHECK (`type` IN ('O','W','P','G','M','C')),
  `type_id` INTEGER NOT NULL DEFAULT 0,
  `src_charid` INTEGER NOT NULL DEFAULT 0,
  `src_accountid` INTEGER NOT NULL DEFAULT 0,
  `src_map` TEXT NOT NULL DEFAULT '',
  `src_map_x` INTEGER NOT NULL DEFAULT 0,
  `src_map_y` INTEGER NOT NULL DEFAULT 0,
  `dst_charname` TEXT NOT NULL DEFAULT '',
  `message` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_chatlog_src_accountid` ON `chatlog` (`src_accountid`);
CREATE INDEX IF NOT EXISTS `idx_chatlog_src_charid` ON `chatlog` (`src_charid`);

--
-- Table structure for table `feedinglog`
--

CREATE TABLE IF NOT EXISTS `feedinglog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `char_id` INTEGER NOT NULL,
  `target_id` INTEGER NOT NULL,
  `target_class` INTEGER NOT NULL,
  `type` TEXT NOT NULL CHECK (`type` IN ('P','H','O')), -- P: Pet, H: Homunculus, O: Other
  `intimacy` INTEGER NOT NULL,
  `item_id` INTEGER NOT NULL,
  `map` TEXT NOT NULL,
  `x` INTEGER NOT NULL,
  `y` INTEGER NOT NULL
);

--
-- Table structure for table `loginlog`
--

CREATE TABLE IF NOT EXISTS `loginlog` (
  `time` TEXT NOT NULL,
  `ip` TEXT NOT NULL DEFAULT '',
  `user` TEXT NOT NULL DEFAULT '',
  `rcode` INTEGER NOT NULL DEFAULT 0,
  `log` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_loginlog_ip` ON `loginlog` (`ip`);

--
-- Table structure for table `mvplog`
--

CREATE TABLE IF NOT EXISTS `mvplog` (
  `mvp_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `mvp_date` TEXT NOT NULL,
  `kill_char_id` INTEGER NOT NULL DEFAULT 0,
  `monster_id` INTEGER NOT NULL DEFAULT 0,
  `prize` INTEGER NOT NULL DEFAULT 0,
  `mvpexp` INTEGER NOT NULL DEFAULT 0,
  `map` TEXT NOT NULL DEFAULT ''
);

--
-- Table structure for table `npclog`
--

CREATE TABLE IF NOT EXISTS `npclog` (
  `npc_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `npc_date` TEXT NOT NULL,
  `account_id` INTEGER NOT NULL DEFAULT 0,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `char_name` TEXT NOT NULL DEFAULT '',
  `map` TEXT NOT NULL DEFAULT '',
  `mes` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_npclog_account_id` ON `npclog` (`account_id`);
CREATE INDEX IF NOT EXISTS `idx_npclog_char_id` ON `npclog` (`char_id`);

--
-- Table structure for table `picklog`
--
# PickLog types
# (M)onsters Drop
# (P)layers Drop/Take
# Mobs Drop (L)oot Drop/Take
# Players (T)rade Give/Take
# Players (V)ending Sell/Take
# (S)hop Sell/Take
# (N)PC Give/Take
# (C)onsumable Items
# (A)dministrators Create/Delete
# Sto(R)age
# (G)uild Storage
# (E)mail attachment
# (B)uying Store
# Pr(O)duced Items/Ingredients
# Auct(I)oned Items
# (X) Other
# (D) Stolen from mobs
# (U) MVP Prizes
# ($) Cash
# (F) Guild/Party Bound retrieval
# Lotter(Y)
# (Z) Merged Items
# (Q)uest
# Private Airs(H)ip
# Barter Shop (J)
# Laphine systems (W)
# Enchantgrade UI (0)
# Reform UI (1)
# Enchant UI (2)

CREATE TABLE IF NOT EXISTS `picklog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `type` TEXT NOT NULL DEFAULT 'P' CHECK (`type` IN ('M','P','L','T','V','S','N','C','A','R','G','E','B','O','I','X','D','U','$','F','Y','Z','Q','H','J','W','0','1','2','3')),
  `nameid` INTEGER NOT NULL DEFAULT 0,
  `amount` INTEGER NOT NULL DEFAULT 1,
  `refine` INTEGER NOT NULL DEFAULT 0,
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
  `map` TEXT NOT NULL DEFAULT '',
  `bound` INTEGER NOT NULL DEFAULT 0,
  `enchantgrade` INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS `idx_picklog_type` ON `picklog` (`type`);

--
-- Table structure for table `zenylog`
--
# ZenyLog types
# (T)rade
# (V)ending Sell/Buy
# (P)layers Drop/Take
# (M)onsters
# (S)hop Sell/Buy
# (N)PC Change amount
# (D) Stolen from mobs
# (C)onsumable Items
# (A)dministrators
# (E)Mail
# Auct(I)on
# (B)uying Store
# Ban(K) Transactions
# Barter Shop (J)
# (X) Other
# Enchantgrade UI (0)
# Enchant UI (2)

CREATE TABLE IF NOT EXISTS `zenylog` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `time` TEXT NOT NULL,
  `char_id` INTEGER NOT NULL DEFAULT 0,
  `src_id` INTEGER NOT NULL DEFAULT 0,
  `type` TEXT NOT NULL DEFAULT 'S' CHECK (`type` IN ('T','V','P','M','S','N','D','C','A','E','I','B','K','J','X','0','2')),
  `amount` INTEGER NOT NULL DEFAULT 0,
  `map` TEXT NOT NULL DEFAULT ''
);

CREATE INDEX IF NOT EXISTS `idx_zenylog_type` ON `zenylog` (`type`);
