-- GLP-1 prescriber targeting: step 06 (DuckDB SQL, run from analysis.ipynb)
SELECT decile,
       COUNT(*) AS prescribers,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_prescribers,
       ROUND(100.0 * SUM(total_claims) / SUM(SUM(total_claims)) OVER (), 1) AS pct_of_claims
FROM deciles
GROUP BY decile
ORDER BY decile DESC;
