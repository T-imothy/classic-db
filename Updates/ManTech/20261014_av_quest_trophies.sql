-- Classic AV PvP quest repairs; use with the corpse race-condition core fix.
-- Do not rewrite unrelated condition IDs 293-300.
INSERT INTO creature_involvedrelation (id,quest) VALUES (13448,7401),(13447,7402)
ON DUPLICATE KEY UPDATE quest=VALUES(quest);

INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65001,14,1,0,0,0,2,'ManTech AV corpse race: Human Bone Chip')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65001 WHERE entry=1 AND item=18144 AND condition_id IN (293,65001);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65002,14,2,0,0,0,2,'ManTech AV corpse race: Orc Tooth')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65002 WHERE entry=1 AND item=18207 AND condition_id IN (294,65002);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65003,14,4,0,0,0,2,'ManTech AV corpse race: Dwarf Spine')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65003 WHERE entry=1 AND item=18206 AND condition_id IN (295,65003);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65004,14,8,0,0,0,2,'ManTech AV corpse race: Severed Night Elf Head')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65004 WHERE entry=1 AND item=18142 AND condition_id IN (296,65004);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65005,14,16,0,0,0,2,'ManTech AV corpse race: Forsaken Heart')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65005 WHERE entry=1 AND item=18147 AND condition_id IN (297,65005);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65006,14,32,0,0,0,2,'ManTech AV corpse race: Tauren Hoof')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65006 WHERE entry=1 AND item=18145 AND condition_id IN (298,65006);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65007,14,64,0,0,0,2,'ManTech AV corpse race: Tuft of Gnome Hair')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65007 WHERE entry=1 AND item=18143 AND condition_id IN (299,65007);
INSERT INTO conditions (condition_entry,type,value1,value2,value3,value4,flags,comments) VALUES (65008,14,128,0,0,0,2,'ManTech AV corpse race: Darkspear Troll Mojo')
ON DUPLICATE KEY UPDATE type=VALUES(type),value1=VALUES(value1),value2=VALUES(value2),value3=VALUES(value3),value4=VALUES(value4),flags=VALUES(flags),comments=VALUES(comments);
UPDATE reference_loot_template SET condition_id=65008 WHERE entry=1 AND item=18146 AND condition_id IN (300,65008);

-- These quest items are for the opposite faction from the corpse being looted.
UPDATE reference_loot_template SET condition_id=3022 WHERE entry=1 AND item=17306 AND condition_id IN (4,3022);
UPDATE reference_loot_template SET condition_id=3021 WHERE entry=1 AND item=17423 AND condition_id IN (3,3021);

-- Preserve existing EventAI charge/rend actions; the script subclasses EventAI.
UPDATE creature_template SET ScriptName='npc_av_stable_beast' WHERE Entry IN (10981,10990) AND ScriptName IN ('','npc_av_stable_beast');
UPDATE creature_template SET ScriptName='npc_av_stable_master' WHERE Entry IN (13616,13617) AND ScriptName IN ('','npc_av_stable_master');

-- Existing invisible markers at the six native commander discovery locations.
UPDATE creature_template SET ScriptName='npc_av_sky_lord_marker' WHERE Entry BETWEEN 14026 AND 14031 AND ScriptName IN ('','npc_av_sky_lord_marker');
