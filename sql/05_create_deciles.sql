-- GLP-1 prescriber targeting: step 05 (DuckDB SQL, run from analysis.ipynb)
CREATE OR REPLACE TABLE deciles AS
WITH ranked AS (
    SELECT *,
           SUM(total_claims) OVER (ORDER BY total_claims DESC, npi
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_claims,
           SUM(total_claims) OVER () AS all_claims
    FROM prescribers
)
SELECT *,
       10 - LEAST(CAST(FLOOR(10.0 * (cum_claims - total_claims) / all_claims) AS INTEGER), 9) AS decile
FROM ranked;
