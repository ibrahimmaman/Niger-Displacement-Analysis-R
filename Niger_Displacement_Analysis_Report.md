# Niger Displacement Data Analysis

**Reporting date:** 6 May 2024

**Data source:** Displacement movements workbook supplied for this analysis.

## 1. Objective

This analysis examines recorded internally displaced people (IDPs) by region in Niger. It summarizes population and household counts, compares regional caseloads, and supports humanitarian monitoring and planning.

## 2. Methodology

The detailed internally displaced population worksheet was imported into R. Records were grouped by region, and the recorded numbers of people and households were summed. Regional percentages and people-per-household ratios were calculated from the aggregated data.

## 3. Key results

- Regions represented: 6
- People recorded in the detailed records: 458,729
- Households recorded in the detailed records: 76,522

### Regional ranking

# A tibble: 6 × 6
   rank region    displaced_people displaced_households share_percent
  <int> <chr>                <dbl>                <dbl>         <dbl>
1     1 Tillabéri           199592                31009         43.5 
2     2 Diffa               154963                30521         33.8 
3     3 Tahoua               77203                11170         16.8 
4     4 Maradi               16307                 1929          3.55
5     5 Dosso                 5747                  801          1.25
6     6 Niamey                4917                 1092          1.07
# ℹ 1 more variable: people_per_household <dbl>

## 4. Data quality

Data quality checks should cover missing values, duplicate records, invalid counts, and consistency with the workbook's global summary. Findings should be reported from the actual quality-check results; records should not be removed or corrected without verification.

## 5. Limitations

The figures reflect records in the detailed worksheet and its reporting date. They should not be described as current displacement estimates. Regional totals may require reconciliation with the global summary, and aggregation should be checked for overlapping or repeated records.

## 6. Recommendations

- Validate detailed totals against the official global summary.
- Investigate missing values and potential duplicates.
- Confirm that site-level records can be summed without double counting.
- Use verified regional figures to inform response planning and resource allocation.
- Clearly state the reporting date and data source in all charts and reports.
