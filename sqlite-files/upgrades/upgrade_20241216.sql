CREATE TABLE IF NOT EXISTS `skillcooldown_homunculus` (
  `homun_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`homun_id`, `skill`)
);

CREATE TABLE IF NOT EXISTS `skillcooldown_mercenary` (
  `mer_id` INTEGER NOT NULL,
  `skill` INTEGER NOT NULL DEFAULT 0,
  `tick` INTEGER NOT NULL,
  PRIMARY KEY (`mer_id`, `skill`)
);
