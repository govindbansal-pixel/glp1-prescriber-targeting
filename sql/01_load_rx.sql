-- GLP-1 prescriber targeting: step 01 (DuckDB SQL, run from analysis.ipynb)
CREATE OR REPLACE TABLE rx AS
SELECT * FROM read_csv_auto('data/partd_prescriber_drug.csv', sample_size=-1);
