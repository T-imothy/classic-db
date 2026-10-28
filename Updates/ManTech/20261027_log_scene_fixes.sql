START TRANSACTION;
-- Correct the extra zero in the repeat minimum (same Inner Fire event in TBC
-- uses 15000..30000). Keep every other timing, cast and phase field unchanged.
UPDATE creature_ai_scripts SET event_param3=15000 WHERE id=94003 AND creature_id=940 AND event_type=0 AND event_param3=150000 AND event_param4=30000 AND action1_type=11 AND action1_param1=588;
UPDATE creature_template SET AIName='EventAI' WHERE Entry=13136 AND AIName='' AND ScriptName=''
AND EXISTS(SELECT 1 FROM creature_ai_scripts s WHERE s.creature_id=13136 AND s.id=1313601 AND s.event_type=11);
COMMIT;
