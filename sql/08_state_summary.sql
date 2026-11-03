-- GLP-1 prescriber targeting: step 08 (DuckDB SQL, run from analysis.ipynb)
SELECT state,
       COUNT(*) AS prescribers,
       SUM(total_claims) AS claims,
       ROUND(AVG(total_claims), 1) AS claims_per_prescriber,
       SUM(CASE WHEN decile >= 8 THEN 1 ELSE 0 END) AS top_decile_prescribers
FROM deciles
GROUP BY state
ORDER BY claims DESC;
