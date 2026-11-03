-- GLP-1 prescriber targeting: step 04 (DuckDB SQL, run from analysis.ipynb)
CREATE OR REPLACE TABLE prescribers AS
SELECT npi, prescriber, state, specialty,
       SUM(claims) AS total_claims,
       SUM(drug_cost) AS total_cost,
       COUNT(DISTINCT molecule) AS molecules_used
FROM glp1
GROUP BY ALL;
