-- STEP 5: Tabella con Segmenti RFM per BI

CREATE OR REPLACE TABLE analisi-rfm.vendite.rfm_segmenti_finali
AS
SELECT
  CustomerID,
  recency,
  frequency,
  monetary,
  punteggio_r,
  punteggio_f,
  punteggio_m,
  rfm_totale_p,
  CASE
    WHEN rfm_totale_p >= 28 THEN 'Campioni' -- 28 - 30
    WHEN rfm_totale_p >= 24 THEN 'VIPs Fedeli' 
    WHEN rfm_totale_p >= 20 THEN 'Fedeli Potenziali'
    WHEN rfm_totale_p >= 16 THEN 'Promettenti'
    WHEN rfm_totale_p >= 12 THEN 'Ingaggiati'
    WHEN rfm_totale_p >= 8 THEN 'Attenzione Necessaria'
    WHEN rfm_totale_p >= 4 THEN 'A Rischio'
    ELSE 'Persi/Inattivi'
  END AS rfm_segmenti  
FROM analisi-rfm.vendite.rfm_punteggio_totale
ORDER BY rfm_totale_p DESC;