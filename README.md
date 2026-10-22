# Niger Displacement Data Analysis — R

## Project Overview

This project analyzes recorded internally displaced people (IDPs) in Niger using R. It explores regional displacement patterns, summarizes household and population counts, and applies basic data quality checks to support humanitarian monitoring and response planning.

## Objectives

- Summarize recorded displaced people and households by region.
- Rank regions by recorded displacement caseload.
- Calculate each region's share of the recorded total.
- Check missing values, duplicate records, and invalid counts.
- Produce reproducible charts and analytical outputs.

## Data Source

Source: Displacement movements workbook, updated 6 May 2024.

The analysis uses the detailed internally displaced population worksheet. Results describe the records available in that worksheet and should be validated against the workbook's global summary before being presented as official totals.

## Tools

- R and RStudio
- readxl
- dplyr
- janitor
- ggplot2

## Project Outputs

- `niger_idps_regional_ranking.png` — regional displacement chart
- `niger_idps_regional_analysis.csv` — regional indicators
- `niger_idps_data_quality_summary.csv` — data quality checks
- `Niger_Displacement_Analysis_Report.md` — analytical report

## Methodology

The detailed worksheet was imported into R, grouped by region, and summarized. Regional shares and people-per-household ratios were calculated, and data quality checks were conducted to identify issues requiring further investigation.

## Limitations

The source data is dated 6 May 2024 and is not a current displacement estimate. Potential duplicate or overlapping records and discrepancies with the global summary must be checked before using the results for operational decisions.

## Author

Maman Aboubacar Ibrahim

Humanitarian Data Analysis | Monitoring, Evaluation, Accountability and Learning (MEAL)
