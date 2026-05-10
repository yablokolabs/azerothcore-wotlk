-- Fix quest 11280 "Draconis Gastritis": make the summoned bunny immediately signal
-- the closest Proto-Drake. The existing Proto-Drake follow event is OOC-only, so a
-- hostile drake can enter combat with the player before that event runs.

UPDATE `smart_scripts` SET `link` = 5 WHERE `entryorguid` = 24170 AND `source_type` = 0 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 24170 AND `source_type` = 0 AND `id` = 5) OR (`entryorguid` = 23689 AND `source_type` = 0 AND `id` IN (13, 14, 15));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24170, 0, 5, 0, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 23689, 75, 0, 0, 0, 0, 0, 0, 'Draconis Gastritis Bunny - On Just Summoned - Set Data 1 1 On Closest Proto-Drake'),
(23689, 0, 13, 14, 38, 0, 100, 512, 1, 1, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Proto-Drake - On Data Set 1 1 - Set React State Passive'),
(23689, 0, 14, 15, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Proto-Drake - On Data Set 1 1 - Stop Combat'),
(23689, 0, 15, 5, 61, 0, 100, 512, 0, 0, 0, 0, 0, 0, 29, 0, 0, 24170, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Proto-Drake - On Data Set 1 1 - Follow Draconis Gastritis Bunny');
