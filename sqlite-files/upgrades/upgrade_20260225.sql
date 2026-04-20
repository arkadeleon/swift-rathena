DELETE FROM `mail_attachments`
WHERE `id` NOT IN (
    SELECT `id` FROM `mail`
);

ALTER TABLE `mail_attachments` RENAME TO `mail_attachments2`;

CREATE TABLE IF NOT EXISTS `mail_attachments` (
  `id` INTEGER NOT NULL,
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
  `enchantgrade` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `index`),
  FOREIGN KEY (`id`)
      REFERENCES `mail`(`id`)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

INSERT INTO `mail_attachments`
SELECT
    `id`,
    `index`,
    `nameid`,
    `amount`,
    `refine`,
    `attribute`,
    `identify`,
    `card0`,
    `card1`,
    `card2`,
    `card3`,
    `option_id0`,
    `option_val0`,
    `option_parm0`,
    `option_id1`,
    `option_val1`,
    `option_parm1`,
    `option_id2`,
    `option_val2`,
    `option_parm2`,
    `option_id3`,
    `option_val3`,
    `option_parm3`,
    `option_id4`,
    `option_val4`,
    `option_parm4`,
    `unique_id`,
    `bound`,
    `enchantgrade`
FROM `mail_attachments2`;

DROP TABLE `mail_attachments2`;
