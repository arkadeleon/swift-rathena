ALTER TABLE `skillcooldown_homunculus` RENAME TO `skillcooldown_homunculus2`;
CREATE TABLE IF NOT EXISTS `skillcooldown_homunculus` (
  `homun_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`homun_id`, `skill`)
);
INSERT INTO `skillcooldown_homunculus` SELECT * FROM `skillcooldown_homunculus2`;
DROP TABLE `skillcooldown_homunculus2`;

ALTER TABLE `skillcooldown_mercenary` RENAME TO `skillcooldown_mercenary2`;
CREATE TABLE IF NOT EXISTS `skillcooldown_mercenary` (
  `mer_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`mer_id`, `skill`)
);
INSERT INTO `skillcooldown_mercenary` SELECT * FROM `skillcooldown_mercenary2`;
DROP TABLE `skillcooldown_mercenary2`;
