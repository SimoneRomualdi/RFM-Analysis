-- Step 2: Calcolo Recency, Frequency e Monetary + RFM Ranks
-- Combinazione CTEs con Views

CREATE OR REPLACE VIEW analisi-rfm.vendite.rfm_metriche 
AS 
WITH data_odierna AS (
  SELECT DATE('24-03-2026') AS data_analisi -- Data odierna al momento del progetto
),
rfm AS (
  SELECT
    CustomerID,
    MAX(OrderDate) AS ultimo_acquisto,
    DATE_DIFF((SELECT data_analisi FROM data_odierna), MAX(OrderDate), DAY) AS recency,
    COUNT(*)AS frequency,
    SUM(OrderValue) AS monetary
  FROM analisi-rfm.vendite.vendite_2025
  GROUP BY CustomerID
) 

SELECT
  rfm.*,
  ROW_NUMBER() OVER(ORDER BY recency ASC) AS rank_r,
  ROW_NUMBER() OVER(ORDER BY frequency DESC) AS rank_f,
  ROW_NUMBER() OVER(ORDER BY monetary DESC) AS rank_m
FROM rfm;