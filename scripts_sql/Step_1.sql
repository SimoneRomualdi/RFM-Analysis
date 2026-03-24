-- Step 1: Unire tutte le tabelle insieme

CREATE OR REPLACE TABLE analisi-rfm.vendite.vendite_2025 AS

SELECT * FROM `vendite.vendite_2025_01`
UNION ALL
SELECT * FROM `vendite.vendite_2025_02`
UNION ALL 
SELECT * FROM `vendite.vendite_2025_03`
UNION ALL
SELECT * FROM `vendite.vendite_2025_04`
UNION ALL
SELECT * FROM `vendite.vendite_2025_05`
UNION ALL
SELECT * FROM `vendite.vendite_2025_06`
UNION ALL
SELECT * FROM `vendite.vendite_2025_07`
UNION ALL
SELECT * FROM `vendite.vendite_2025_08`
UNION ALL
SELECT * FROM `vendite.vendite_2025_09`
UNION ALL
SELECT * FROM `vendite.vendite_2025_10`
UNION ALL
SELECT * FROM `vendite.vendite_2025_11`
UNION ALL
SELECT * FROM `vendite.vendite_2025_12`;

