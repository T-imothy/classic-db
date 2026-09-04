-- ManTech Arch3: remove only records proven invalid by the dev soak logs.
-- Idempotent and deliberately scoped; no broad content rewrites.

DELETE FROM `spell_group_spell`
WHERE (`Id`, `SpellId`) IN ((2,27089),(1,27094),(7,27143),(3,28170),(12,30910));

DELETE FROM `creature_spell_list`
WHERE `Id` = 1606302 AND `SpellId` IN (57376,57377);

DELETE FROM `creature` WHERE `guid` = 23120 AND `id` = 0;

-- Ranked proc definitions belong on rank one; the core resolves the chain.
DELETE FROM `spell_proc_event` WHERE `entry` IN (
  325,905,945,8134,10431,10432,
  12574,12575,12576,12577,
  12812,12813,12814,12815,
  13961,13962,13963,13964,
  14070,14071,
  16277,16278,16279,16280,
  19308,19309,19310,19311,19312,
  20915,20918,20919,20920,
  29075,29076,
  29444,29445,29446,29447
);

-- These Classic rows reference broadcast text IDs from later clients. Keep the
-- localized fallback text and remove only the invalid 1.12.1 reference.
UPDATE `script_texts`
SET `broadcast_text_id` = 0
WHERE (`entry`, `broadcast_text_id`) IN (
  (-1000196,19263),(-1000197,19244),(-1000340,22068),
  (-1000341,22069),(-1000342,22070),(-1000771,21649)
);

-- Mikhail has no direct or template-backed inventory in this data set.
UPDATE `creature_template` AS `ct`
LEFT JOIN `npc_vendor` AS `nv` ON `nv`.`entry` = `ct`.`Entry`
LEFT JOIN `npc_vendor_template` AS `nvt` ON `nvt`.`entry` = `ct`.`VendorTemplateId`
SET `ct`.`NpcFlags` = `ct`.`NpcFlags` & ~4
WHERE `ct`.`Entry` = 4963
  AND `nv`.`entry` IS NULL
  AND `nvt`.`entry` IS NULL;

CREATE TABLE IF NOT EXISTS `mantech_migration` (
  `id` varchar(64) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mantech_migration` (`id`,`details`)
VALUES ('arch3-world-classic-v1','Targeted data cleanup and runtime-noise corrections')
ON DUPLICATE KEY UPDATE `applied_at`=CURRENT_TIMESTAMP, `details`=VALUES(`details`);
