# Data

Download the latest year of [Medicare Part D Prescribers – by Provider and Drug](https://data.cms.gov/provider-summary-by-type-of-service/medicare-part-d-prescribers/medicare-part-d-prescribers-by-provider-and-drug) as CSV and save it here as `partd_prescriber_drug.csv`.

The file is several GB, so `.gitignore` keeps it out of git. The notebook writes `glp1_prescribers.csv` and `glp1_prescriber_molecule.csv` here; those small files are committed because the Power BI dashboard reads them.
