-- Step 3: Assegnazione Valutazione (1=peggiore, 10=migliore)

CREATE OR REPLACE VIEW analisi-rfm.vendite.rfm_punteggio
AS
SELECT 
  *,
  NTILE(10) OVER (ORDER BY rank_r DESC) AS punteggio_r,
  NTILE(10) OVER (ORDER BY rank_f DESC) AS punteggio_f,
  NTILE(10) OVER (ORDER BY rank_m DESC) AS punteggio_m,
FROM analisi-rfm.vendite.rfm_metriche;