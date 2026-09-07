-- Portable Repair Hammer: class supplies and ordinary vendor ammunition.
-- Expansion-specific item IDs verified against item definitions and vendor sources.
-- A dedicated creature is summoned only by the Portable Repair Hammer.
-- Existing stock, purchase restrictions and limited-stock timers are preserved.
-- Reapplying this migration is safe; it only adds missing vendor rows.

CREATE TEMPORARY TABLE `portable_repair_seed` LIKE `creature_template`;
INSERT INTO `portable_repair_seed` SELECT * FROM `creature_template` WHERE `Entry`=14337;
UPDATE `portable_repair_seed` SET `Entry`=65001, `Name`='Portable Supply Bot', `SubName`='Reagents, Ammunition & Repairs', `VendorTemplateId`=0;
INSERT INTO `creature_template` SELECT s.* FROM `portable_repair_seed` s WHERE NOT EXISTS (SELECT 1 FROM `creature_template` WHERE `Entry`=65001);
DROP TEMPORARY TABLE `portable_repair_seed`;

-- Copy original Hammer stock into its dedicated inventory; native rows stay unchanged.
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,v.`item`,v.`maxcount`,v.`incrtime`,v.`slot`,v.`condition_id`,v.`comments` FROM `npc_vendor` v WHERE v.`entry`=14337
AND NOT EXISTS (SELECT 1 FROM `npc_vendor` d WHERE d.`entry`=65001 AND d.`item`=v.`item`);

INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17031,0,0,11,0,'Rune of Teleportation'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17031)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17031);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17032,0,0,12,0,'Rune of Portals'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17032)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17032);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17020,0,0,13,0,'Arcane Powder'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17020)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17020);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17028,0,0,14,0,'Holy Candle'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17028)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17028);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17029,0,0,15,0,'Sacred Candle'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17029)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17029);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17030,0,0,16,0,'Ankh'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17030)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17030);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17033,0,0,17,0,'Symbol of Divinity'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17033)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17033);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,21177,0,0,18,0,'Symbol of Kings'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=21177)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=21177);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17034,0,0,19,0,'Maple Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17034)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17034);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17035,0,0,20,0,'Stranglethorn Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17035)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17035);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17036,0,0,21,0,'Ashwood Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17036)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17036);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17037,0,0,22,0,'Hornbeam Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17037)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17037);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17038,0,0,23,0,'Ironwood Seed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17038)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17038);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17021,0,0,24,0,'Wild Berries'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17021)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17021);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17026,0,0,25,0,'Wild Thornroot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17026)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17026);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,5565,0,0,26,0,'Infernal Stone'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5565)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5565);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,16583,0,0,27,0,'Demonic Figurine'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=16583)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=16583);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17056,0,0,28,0,'Light Feather'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17056)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17056);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17057,0,0,29,0,'Shiny Fish Scales'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17057)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17057);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,17058,0,0,30,0,'Fish Oil'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=17058)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=17058);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,5140,0,0,31,0,'Flash Powder'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5140)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5140);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2928,0,0,32,0,'Dust of Decay'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2928)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2928);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2930,0,0,33,0,'Essence of Pain'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2930)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2930);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,5173,0,0,34,0,'Deathweed'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=5173)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=5173);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,8923,0,0,35,0,'Essence of Agony'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8923)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8923);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,8924,0,0,36,0,'Dust of Deterioration'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8924)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8924);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3371,0,0,37,0,'Empty Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3371)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3371);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3372,0,0,38,0,'Leaded Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3372)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3372);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,8925,0,0,39,0,'Crystal Vial'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=8925)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=8925);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2512,0,0,40,0,'Rough Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2512)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2512);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2515,0,0,41,0,'Sharp Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2515)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2515);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3030,0,0,42,0,'Razor Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3030)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3030);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,11285,0,0,43,0,'Jagged Arrow'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=11285)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=11285);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2516,0,0,44,0,'Light Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2516)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2516);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2519,0,0,45,0,'Heavy Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2519)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2519);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3033,0,0,46,0,'Solid Shot'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3033)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3033);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,11284,0,0,47,0,'Accurate Slugs'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=11284)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=11284);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2947,0,0,48,0,'Small Throwing Knife'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2947)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2947);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3111,0,0,49,0,'Crude Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3111)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3111);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,2946,0,0,50,0,'Balanced Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=2946)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=2946);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3131,0,0,51,0,'Weighted Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3131)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3131);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3107,0,0,52,0,'Keen Throwing Knife'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3107)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3107);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3135,0,0,53,0,'Sharp Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3135)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3135);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3108,0,0,54,0,'Heavy Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3108)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3108);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,3137,0,0,55,0,'Deadly Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=3137)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=3137);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,15326,0,0,56,0,'Gleaming Throwing Axe'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=15326)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=15326);
INSERT INTO `npc_vendor` (`entry`,`item`,`maxcount`,`incrtime`,`slot`,`condition_id`,`comments`)
SELECT 65001,15327,0,0,57,0,'Wicked Throwing Dagger'
WHERE EXISTS (SELECT 1 FROM `item_template` WHERE `entry`=15327)
  AND NOT EXISTS (SELECT 1 FROM `npc_vendor` WHERE `entry`=65001 AND `item`=15327);
