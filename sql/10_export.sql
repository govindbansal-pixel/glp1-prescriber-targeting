-- GLP-1 prescriber targeting: step 10, export the tables for Power BI (DuckDB SQL)
COPY (SELECT * EXCLUDE (cum_claims, all_claims) FROM deciles) TO 'data/glp1_prescribers.csv' (HEADER);
COPY glp1 TO 'data/glp1_prescriber_molecule.csv' (HEADER);
