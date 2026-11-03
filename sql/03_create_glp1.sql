-- GLP-1 prescriber targeting: step 03 (DuckDB SQL, run from analysis.ipynb)
CREATE OR REPLACE TABLE glp1 AS
SELECT Prscrbr_NPI AS npi,
       concat_ws(', ', Prscrbr_Last_Org_Name, Prscrbr_First_Name) AS prescriber,
       Prscrbr_State_Abrvtn AS state,
       Prscrbr_Type AS specialty,
       Gnrc_Name AS molecule,
       Tot_Clms AS claims,
       Tot_Drug_Cst AS drug_cost
FROM rx
WHERE regexp_matches(lower(Gnrc_Name), 'semaglutide|tirzepatide|dulaglutide|liraglutide|exenatide');
