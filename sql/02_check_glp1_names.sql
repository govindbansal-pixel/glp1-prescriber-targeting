-- GLP-1 prescriber targeting: step 02 (DuckDB SQL, run from analysis.ipynb)
SELECT Gnrc_Name, Brnd_Name, SUM(Tot_Clms) AS claims
FROM rx
WHERE regexp_matches(lower(Gnrc_Name), 'semaglutide|tirzepatide|dulaglutide|liraglutide|exenatide')
GROUP BY ALL
ORDER BY claims DESC;
