-- Step 4: Punteggio Totale
CREATE OR REPLACE VIEW analisi-rfm.vendite.rfm_punteggio_totale
AS

SELECT
  CustomerID,
  recency,
  frequency,
  monetary,
  punteggio_r,
  punteggio_f,
  punteggio_m,
  (punteggio_r + punteggio_f + punteggio_m) AS rfm_totale_p
FROM analisi-rfm.vendite.rfm_punteggio
ORDER BY rfm_totale_p DESC;    