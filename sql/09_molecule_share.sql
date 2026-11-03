-- GLP-1 prescriber targeting: step 09 (DuckDB SQL, run from analysis.ipynb)
WITH top_specialties AS (
    SELECT specialty FROM prescribers
    GROUP BY specialty
    ORDER BY SUM(total_claims) DESC
    LIMIT 5
)
SELECT specialty, molecule,
       SUM(claims) AS claims,
       ROUND(100.0 * SUM(claims) / SUM(SUM(claims)) OVER (PARTITION BY specialty), 1) AS pct_of_specialty
FROM glp1
WHERE specialty IN (SELECT specialty FROM top_specialties)
GROUP BY specialty, molecule
ORDER BY specialty, claims DESC;
