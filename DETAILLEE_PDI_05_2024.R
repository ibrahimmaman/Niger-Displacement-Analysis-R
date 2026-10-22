library(tidyr)
Warning message:
  package ‘tidyr’ was built under R version 4.6.1 
> 
  > # List all worksheets in the Excel workbook
  > excel_sheets("bd_mouvements-populations_ope_06052024.xlsx")
[1] "SITUATION GLOBALE_PDI"           "SITUATION DETAILLEE_PDI_05_2024"
[3] "TCD_ALL"                         "SITUATION GLOBALE_REFUGIES"     
[5] "SITUATION DETAILLEE_REFUGIES"   
> 
  > 
  > 
  > library(readxl)
> library(dplyr)
> library(janitor)
#

> 
  > # Import the detailed IDP dataset
  > pdi_data <- read_excel(
    +     "bd_mouvements-populations_ope_06052024.xlsx",
    +     sheet = "SITUATION DETAILLEE_PDI_05_2024"
    + )
New names:
  • `` -> `...2`
• `` -> `...3`
• `` -> `...4`
• `` -> `...5`
• `` -> `...6`
> 
  > # Clean column names
  > pdi_data <- clean_names(pdi_data)
> 
  > # Display the first 6 rows
  > head(pdi_data)
# A tibble: 6 × 6
situation_des_mouvements_de_populations_enre…¹ x2    x3    x4    x5    x6   
<chr>                                          <chr> <chr> <chr> <chr> <chr>
  1 NA                                             NA    NA    NA    NA    NA   
2 Date de mise à jour: 06/05/2024                NA    NA    NA    NA    NA   
3 NA                                             NA    NA    NA    NA    NA   
4 NA                                             NA    NA    NA    NA    NA   
5 NA                                             NA    NA    NA    NA    NA   
6 NA                                             NA    NA    NA    NA    NA   
# ℹ abbreviated name:
#   ¹​situation_des_mouvements_de_populations_enregistres_en_mai_2024
> 
  > View(pdi_data)
> 
  > 
  > # Number of rows and columns
  > dim(pdi_data)
[1] 64  6
> 
  > # Column names
  > names(pdi_data)
[1] "situation_des_mouvements_de_populations_enregistres_en_mai_2024"
[2] "x2"                                                             
[3] "x3"                                                             
[4] "x4"                                                             
[5] "x5"                                                             
[6] "x6"                                                             
> 
  > # Data types and structure
  > str(pdi_data)
tibble [64 × 6] (S3: tbl_df/tbl/data.frame)
$ situation_des_mouvements_de_populations_enregistres_en_mai_2024: chr [1:64] NA "Date de mise à jour: 06/05/2024" NA NA ...
$ x2                                                             : chr [1:64] NA NA NA NA ...
$ x3                                                             : chr [1:64] NA NA NA NA ...
$ x4                                                             : chr [1:64] NA NA NA NA ...
$ x5                                                             : chr [1:64] NA NA NA NA ...
$ x6                                                             : chr [1:64] NA NA NA NA ...
> 
  > # Summary statistics
  > summary(pdi_data)
situation_des_mouvements_de_populations_enregistres_en_mai_2024
Length   :64                                                   
N.unique : 8                                                   
N.blank  : 0                                                   
Min.nchar: 5                                                   
Max.nchar:31                                                   
NAs      : 6                                                   
x2             x3             x4             x5             x6    
Length   :64   Length   :64   Length   :64   Length   :64   Length   :64  
N.unique :34   N.unique :57   N.unique : 4   N.unique :57   N.unique :57  
N.blank  : 0   N.blank  : 0   N.blank  : 0   N.blank  : 0   N.blank  : 0  
Min.nchar: 3   Min.nchar: 4   Min.nchar: 6   Min.nchar: 1   Min.nchar: 2  
Max.nchar:14   Max.nchar:15   Max.nchar:14   Max.nchar:23   Max.nchar: 9  
NAs      : 7   NAs      : 7   NAs      :60   NAs      : 6   NAs      : 7  
> 
  > 
  > # Count missing values in each column
  > missing_values <- colSums(is.na(pdi_data))
> 
  > missing_values
situation_des_mouvements_de_populations_enregistres_en_mai_2024 
6 
x2 
7 
x3 
7 
x4 
60 
x5 
6 
x6 
7 
> 
  > 
  > # Count missing values in each column
  > missing_report <- data.frame(
    +     variable = names(pdi_data),
    +     missing_count = colSums(is.na(pdi_data)),
    +     missing_percent = round(
      +         colMeans(is.na(pdi_data)) * 100, 2
      +     )
    + )
> 
  > missing_report <- missing_report[
    +     order(-missing_report$missing_count), ]
> 
  > print(missing_report)
variable
x4                                                                                                                           x4
x2                                                                                                                           x2
x3                                                                                                                           x3
x6                                                                                                                           x6
situation_des_mouvements_de_populations_enregistres_en_mai_2024 situation_des_mouvements_de_populations_enregistres_en_mai_2024
x5                                                                                                                           x5
missing_count
x4                                                                         60
x2                                                                          7
x3                                                                          7
x6                                                                          7
situation_des_mouvements_de_populations_enregistres_en_mai_2024             6
x5                                                                          6
missing_percent
x4                                                                        93.75
x2                                                                        10.94
x3                                                                        10.94
x6                                                                        10.94
situation_des_mouvements_de_populations_enregistres_en_mai_2024            9.38
x5                                                                         9.38
> 
  > 
  > # Count exact duplicate rows
  > duplicate_count <- sum(duplicated(pdi_data))
> 
  > cat("Exact duplicate rows:", duplicate_count, "\n")
Exact duplicate rows: 4 
> 
  > # Display duplicate rows, if any
  > duplicate_rows <- pdi_data[
    +     duplicated(pdi_data) |
      +         duplicated(pdi_data, fromLast = TRUE), ]
> 
  > print(duplicate_rows)
# A tibble: 5 × 6
situation_des_mouvements_de_populations_enre…¹ x2    x3    x4    x5    x6   
<chr>                                          <chr> <chr> <chr> <chr> <chr>
  1 NA                                             NA    NA    NA    NA    NA   
2 NA                                             NA    NA    NA    NA    NA   
3 NA                                             NA    NA    NA    NA    NA   
4 NA                                             NA    NA    NA    NA    NA   
5 NA                                             NA    NA    NA    NA    NA   
# ℹ abbreviated name:
#   ¹​situation_des_mouvements_de_populations_enregistres_en_mai_2024
> 
  > #is
  > 
  > # Inspect data types
  > str(pdi_data)
tibble [64 × 6] (S3: tbl_df/tbl/data.frame)
$ situation_des_mouvements_de_populations_enregistres_en_mai_2024: chr [1:64] NA "Date de mise à jour: 06/05/2024" NA NA ...
$ x2                                                             : chr [1:64] NA NA NA NA ...
$ x3                                                             : chr [1:64] NA NA NA NA ...
$ x4                                                             : chr [1:64] NA NA NA NA ...
$ x5                                                             : chr [1:64] NA NA NA NA ...
$ x6                                                             : chr [1:64] NA NA NA NA ...
> 
  > # Remove leading and trailing spaces from text columns
  > pdi_data <- pdi_data %>%
  +     mutate(
    +         across(
      +             where(is.character),
      +             ~ trimws(.x)
      +         )
    +     )
> 
  > # Check the structure again
  > str(pdi_data)
tibble [64 × 6] (S3: tbl_df/tbl/data.frame)
$ situation_des_mouvements_de_populations_enregistres_en_mai_2024: chr [1:64] NA "Date de mise à jour: 06/05/2024" NA NA ...
$ x2                                                             : chr [1:64] NA NA NA NA ...
$ x3                                                             : chr [1:64] NA NA NA NA ...
$ x4                                                             : chr [1:64] NA NA NA NA ...
$ x5                                                             : chr [1:64] NA NA NA NA ...
$ x6                                                             : chr [1:64] NA NA NA NA ...
> 
  > 
  > names(pdi_data)
[1] "situation_des_mouvements_de_populations_enregistres_en_mai_2024"
[2] "x2"                                                             
[3] "x3"                                                             
[4] "x4"                                                             
[5] "x5"                                                             
[6] "x6"                                                             
> 
  > 
  > library(writexl)
Warning message:
  package ‘writexl’ was built under R version 4.6.1 
> 
  > write_xlsx(
    +     pdi_data,
    +     "Niger_Displacement_Data_Preliminary_Cleaned.xlsx"
    + )
> 
  > 
  > # Display all variable names
  > names(pdi_data)
[1] "situation_des_mouvements_de_populations_enregistres_en_mai_2024"
[2] "x2"                                                             
[3] "x3"                                                             
[4] "x4"                                                             
[5] "x5"                                                             
[6] "x6"                                                             
> 
  > # Display the first 10 records
  > print(head(pdi_data, 10))
# A tibble: 10 × 6
situation_des_mouvements_de_populations_enr…¹ x2    x3    x4    x5    x6   
<chr>                                         <chr> <chr> <chr> <chr> <chr>
  1 NA                                            NA    NA    NA    NA    NA   
2 Date de mise à jour: 06/05/2024               NA    NA    NA    NA    NA   
3 NA                                            NA    NA    NA    NA    NA   
4 NA                                            NA    NA    NA    NA    NA   
5 NA                                            NA    NA    NA    NA    NA   
6 NA                                            NA    NA    NA    NA    NA   
7 NA                                            NA    NA    NA    DONN… NA   
8 REGION                                        DEPA… COMM… SITE… Mena… Pers…
9 Diffa                                         Bosso Bosso NA    328   2300 
10 Diffa                                         Bosso Toum… NA    1265  5060 
# ℹ abbreviated name:
#   ¹​situation_des_mouvements_de_populations_enregistres_en_mai_2024
> 
  > # Inspect the data types
  > str(pdi_data)
tibble [64 × 6] (S3: tbl_df/tbl/data.frame)
$ situation_des_mouvements_de_populations_enregistres_en_mai_2024: chr [1:64] NA "Date de mise à jour: 06/05/2024" NA NA ...
$ x2                                                             : chr [1:64] NA NA NA NA ...
$ x3                                                             : chr [1:64] NA NA NA NA ...
$ x4                                                             : chr [1:64] NA NA NA NA ...
$ x5                                                             : chr [1:64] NA NA NA NA ...
$ x6                                                             : chr [1:64] NA NA NA NA ...
> 
  > 
  > # List columns that contain numeric data
  > numeric_columns <- names(pdi_data)[
    +     sapply(pdi_data, is.numeric)
    + ]
> 
  > print(numeric_columns)
character(0)
> 
  > 
  > names(pdi_data)
[1] "situation_des_mouvements_de_populations_enregistres_en_mai_2024"
[2] "x2"                                                             
[3] "x3"                                                             
[4] "x4"                                                             
[5] "x5"                                                             
[6] "x6"                                                             
> 
  > 
  > library(dplyr)
> library(ggplot2)
> 
  > # Replace these example names with the real column names
  > regional_summary <- pdi_data %>%
  +     group_by(region) %>%
  +     summarise(
    +         displaced_people = sum(number_of_people, na.rm = TRUE),
    +         displaced_households = sum(number_of_households, na.rm = TRUE),
    +         .groups = "drop"
    +     ) %>%
  +     mutate(
    +         people_share_percent = round(
      +             displaced_people / sum(displaced_people) * 100, 2
      +         ),
    +         household_share_percent = round(
      +             displaced_households / sum(displaced_households) * 100, 2
      +         )
    +     ) %>%
  +     arrange(desc(displaced_people))
Error in `group_by()`:
  ! Must group by variables found in `.data`.
✖ Column `region` is not found.
Run `rlang::last_trace()` to see where the error occurred.

> 
  > # Display the exact column names
  > names(pdi_data)
[1] "situation_des_mouvements_de_populations_enregistres_en_mai_2024"
[2] "x2"                                                             
[3] "x3"                                                             
[4] "x4"                                                             
[5] "x5"                                                             
[6] "x6"                                                             
> 
  > # Display the first 5 rows
  > head(pdi_data, 5)
# A tibble: 5 × 6
situation_des_mouvements_de_populations_enre…¹ x2    x3    x4    x5    x6   
<chr>                                          <chr> <chr> <chr> <chr> <chr>
  1 NA                                             NA    NA    NA    NA    NA   
2 Date de mise à jour: 06/05/2024                NA    NA    NA    NA    NA   
3 NA                                             NA    NA    NA    NA    NA   
4 NA                                             NA    NA    NA    NA    NA   
5 NA                                             NA    NA    NA    NA    NA   
# ℹ abbreviated name:
#   ¹​situation_des_mouvements_de_populations_enregistres_en_mai_2024
> 
  > 
  > library(readxl)
> library(dplyr)
> library(janitor)
> library(ggplot2)
> 
  > # Re-import the worksheet using the correct header row
  > pdi_data <- read_excel(
    +     "bd_mouvements-populations_ope_06052024.xlsx",
    +     sheet = "SITUATION DETAILLEE_PDI_05_2024",
    +     skip = 8
    + ) %>%
  +     clean_names()
> 
  > # Check the actual column names
  > names(pdi_data)
[1] "region"       "departement"  "commune"      "site_village" "menages"     
[6] "personnes"   
> 
  > # Inspect the imported records
  > head(pdi_data)
# A tibble: 6 × 6
region departement commune     site_village menages personnes
<chr>  <chr>       <chr>       <chr>          <dbl>     <dbl>
  1 Diffa  Bosso       Bosso       NA               328      2300
2 Diffa  Bosso       Toumour     NA              1265      5060
3 Diffa  Diffa       Chetimari   NA              3100     18920
4 Diffa  Diffa       Diffa       NA             11639     63930
5 Diffa  Diffa       Gueskerou   NA              1433      6469
6 Diffa  Goudoumaria Goudoumaria NA                33       132
> 
  > 
  > library(dplyr)
> library(ggplot2)
> 
  > # Replace these example names with the real column names
  > regional_summary <- pdi_data %>%
  +     group_by(region) %>%
  +     summarise(
    +         displaced_people = sum(number_of_people, na.rm = TRUE),
    +         displaced_households = sum(number_of_households, na.rm = TRUE),
    +         .groups = "drop"
    +     ) %>%
  +     mutate(
    +         people_share_percent = round(
      +             displaced_people / sum(displaced_people) * 100, 2
      +         ),
    +         household_share_percent = round(
      +             displaced_households / sum(displaced_households) * 100, 2
      +         )
    +     ) %>%
  +     arrange(desc(displaced_people))
Error in `summarise()`:
  ℹ In argument: `displaced_people = sum(number_of_people, na.rm =
                                           TRUE)`.
ℹ In group 1: `region = "Diffa"`.
Caused by error:
  ! object 'number_of_people' not found
Run `rlang::last_trace()` to see where the error occurred.

> 
  > ggplot(
    +     regional_summary,
    +     aes(
      +         x = reorder(region, displaced_people),
      +         y = displaced_people
      +     )
    + ) +
  +     geom_col(fill = "steelblue") +
  +     coord_flip() +
  +     labs(
    +         title = "Internally Displaced People by Region in Niger",
    +         subtitle = "Source workbook dated 6 May 2024",
    +         x = "Region",
    +         y = "Number of displaced people",
    +         caption = "Source: Niger displacement workbook; totals require validation."
    +     ) +
  +     theme_minimal()
Error: object 'regional_summary' not found

> 
  > library(readxl)
> library(dplyr)
> library(janitor)
> 
  > # Re-import the detailed worksheet
  > pdi_data <- read_excel(
    +     "bd_mouvements-populations_ope_06052024.xlsx",
    +     sheet = "SITUATION DETAILLEE_PDI_05_2024",
    +     skip = 8
    + ) %>%
  +     clean_names()
> 
  > # Verify the required columns exist
  > required_columns <- c("region", "personnes", "menages")
> 
  > if (!all(required_columns %in% names(pdi_data))) {
    +     stop("Required columns not found. Run names(pdi_data) and check the output.")
    + }
> 
  > # Remove blank geographic rows
  > pdi_data <- pdi_data %>%
  +     filter(!is.na(region), trimws(region) != "")
> 
  > # Create the regional summary
  > regional_summary <- pdi_data %>%
  +     group_by(region) %>%
  +     summarise(
    +         displaced_people = sum(personnes, na.rm = TRUE),
    +         displaced_households = sum(menages, na.rm = TRUE),
    +         .groups = "drop"
    +     ) %>%
  +     arrange(desc(displaced_people))
> 
  > # Display the results
  > print(regional_summary)
# A tibble: 6 × 3
region    displaced_people displaced_households
<chr>                <dbl>                <dbl>
  1 Tillabéri           199592                31009
2 Diffa               154963                30521
3 Tahoua               77203                11170
4 Maradi               16307                 1929
5 Dosso                 5747                  801
6 Niamey                4917                 1092
> 
  > 
  > library(ggplot2)
> 
  > ggplot(
    +     regional_summary,
    +     aes(
      +         x = reorder(region, displaced_people),
      +         y = displaced_people
      +     )
    + ) +
  +     geom_col() +
  +     coord_flip() +
  +     labs(
    +         title = "Internally Displaced People by Region — Niger",
    +         subtitle = "Reporting date: 6 May 2024",
    +         x = "Region",
    +         y = "Number of displaced people",
    +         caption = "Source: Displacement workbook, May 2024"
    +     ) +
  +     theme_minimal()
> 
  > 
  > library(dplyr)
> library(ggplot2)
> library(tidyr)
> 
  > # 1. Calculate national totals from the detailed records
  > national_summary <- pdi_data %>%
  +     summarise(
    +         total_displaced_people = sum(personnes, na.rm = TRUE),
    +         total_displaced_households = sum(menages, na.rm = TRUE),
    +         number_of_records = n(),
    +         number_of_regions = n_distinct(region)
    +     )
> 
  > print(national_summary)
# A tibble: 1 × 4
total_displaced_people total_displaced_households number_of_records
<dbl>                      <dbl>             <int>
  1                 458729                      76522                56
# ℹ 1 more variable: number_of_regions <int>
> 
  > # 2. Calculate the percentage of recorded displaced people by region
  > regional_indicators <- regional_summary %>%
  +     mutate(
    +         percentage_of_total = round(
      +             displaced_people / sum(displaced_people) * 100, 2
      +         ),
    +         people_per_household = round(
      +             displaced_people / displaced_households, 2
      +         )
    +     ) %>%
  +     arrange(desc(displaced_people))
> 
  > print(regional_indicators)
# A tibble: 6 × 5
region    displaced_people displaced_households percentage_of_total
<chr>                <dbl>                <dbl>               <dbl>
  1 Tillabéri           199592                31009               43.5 
2 Diffa               154963                30521               33.8 
3 Tahoua               77203                11170               16.8 
4 Maradi               16307                 1929                3.55
5 Dosso                 5747                  801                1.25
6 Niamey                4917                 1092                1.07
# ℹ 1 more variable: people_per_household <dbl>
> 
  > # 3. Identify the region with the largest recorded caseload
  > top_region <- regional_indicators %>%
  +     slice_max(order_by = displaced_people, n = 1, with_ties = TRUE)
> 
  > print(top_region)
# A tibble: 1 × 5
region    displaced_people displaced_households percentage_of_total
<chr>                <dbl>                <dbl>               <dbl>
  1 Tillabéri           199592                31009                43.5
# ℹ 1 more variable: people_per_household <dbl>
> 
  > 
  > library(readxl)
> library(janitor)
> library(dplyr)
> 
  > # Import the official PDI summary sheet
  > pdi_global <- read_excel(
    +     "bd_mouvements-populations_ope_06052024.xlsx",
    +     sheet = "SITUATION GLOBALE_PDI"
    + )
New names:
  • `` -> `...1`
• `` -> `...3`
• `` -> `...4`
• `` -> `...5`
• `` -> `...6`
• `` -> `...7`
• `` -> `...8`
• `` -> `...9`
> 
  > # Inspect the first 15 rows
  > print(head(pdi_global, 15))
# A tibble: 15 × 9
...1      `SOURCES DES DONNEES` ...3    ...4  ...5  ...6  ...7  ...8  ...9 
<chr>     <chr>                 <chr>   <chr> <chr> <chr> <chr> <chr> <chr>
  1 NA        DONNEES OFFICIELLES   NA      DONN… NA    NA    NA    NA    NA   
2 REGION    MAH/GC                DATE_M… DTM   DATE… MONI… DATE… RRM   DATE…
3 Diffa     120673                44720   1206… 44720 NA    NA    NA    NA   
4 Maradi    18990                 44720   20498 NA    NA    NA    NA    NA   
5 Niamey    40241                 NA      NA    NA    NA    NA    NA    NA   
6 Tahoua    52594                 44720   42373 NA    NA    NA    NA    NA   
7 Tillaberi 136519                44732   1222… 44720 NA    NA    NA    NA   
8 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
9 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
10 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
11 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
12 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
13 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
14 NA        NA                    NA      NA    NA    NA    NA    NA    NA   
15 NA        Diffa                 Maradi  Niam… Taho… Till… NA    NA    NA   
> 
  > # Display the column names
  > print(names(pdi_global))
[1] "...1"                "SOURCES DES DONNEES" "...3"               
[4] "...4"                "...5"                "...6"               
[7] "...7"                "...8"                "...9"               
> 
  > 
  > library(ggplot2)
> library(dplyr)
> 
  > regional_percentage_chart <- regional_summary %>%
  +     mutate(
    +         percentage = displaced_people /
      +             sum(displaced_people, na.rm = TRUE) * 100
    +     ) %>%
  +     ggplot(
    +         aes(
      +             x = reorder(region, percentage),
      +             y = percentage
      +         )
    +     ) +
  +     geom_col() +
  +     coord_flip() +
  +     labs(
    +         title = "Share of Recorded Internally Displaced People by Region",
    +         subtitle = "Niger — Reporting date: 6 May 2024",
    +         x = "Region",
    +         y = "Share of recorded displaced people (%)",
    +         caption = "Source: Displacement workbook, updated 6 May 2024"
    +     ) +
  +     theme_minimal()
> 
  > print(regional_percentage_chart)
> 
  > # Save the chart for your portfolio
  > ggsave(
    +     "niger_idps_regional_percentage.png",
    +     plot = regional_percentage_chart,
    +     width = 10,
    +     height = 7,
    +     dpi = 300
    + )
> 
  > 
  > library(dplyr)
> library(ggplot2)
> library(readr)
Error in library(readr) : there is no package called ‘readr’
2.
stop(packageNotFoundError(package, lib.loc, sys.call()))
1.
library(readr)

> 
  > library(dplyr)
> library(ggplot2)
> library(readr)
Error in library(readr) : there is no package called ‘readr’

> library(readr)
Error in library(readr) : there is no package called ‘readr’

> library(dplyr)
> library(ggplot2)
> 
  > 
  > library(dplyr)
> library(ggplot2)
> 
  > # Rank regions by recorded displaced population
  > regional_analysis <- regional_summary %>%
  +     mutate(
    +         share_percent = round(
      +             displaced_people / sum(displaced_people, na.rm = TRUE) * 100,
      +             2
      +         ),
    +         people_per_household = if_else(
      +             displaced_households > 0,
      +             round(displaced_people / displaced_households, 2),
      +             NA_real_
      +         )
    +     ) %>%
  +     arrange(desc(displaced_people)) %>%
  +     mutate(rank = row_number()) %>%
  +     select(
    +         rank,
    +         region,
    +         displaced_people,
    +         displaced_households,
    +         share_percent,
    +         people_per_household
    +     )
> 
  > print(regional_analysis)
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
> 
  > # Create the chart
  > regional_chart <- ggplot(
    +     regional_analysis,
    +     aes(
      +         x = reorder(region, displaced_people),
      +         y = displaced_people
      +     )
    + ) +
  +     geom_col() +
  +     geom_text(
    +         aes(label = format(displaced_people, big.mark = ",")),
    +         hjust = -0.15,
    +         size = 3.5
    +     ) +
  +     coord_flip() +
  +     scale_y_continuous(expand = expansion(mult = c(0, 0.18))) +
  +     labs(
    +         title = "Internally Displaced People by Region",
    +         subtitle = "Niger | Data updated 6 May 2024",
    +         x = NULL,
    +         y = "Recorded displaced people",
    +         caption = "Source: Displacement movements workbook, May 2024"
    +     ) +
  +     theme_minimal(base_size = 12)
> 
  > print(regional_chart)
> 
  > # Save the chart
  > ggsave(
    +     "niger_idps_regional_ranking.png",
    +     plot = regional_chart,
    +     width = 10,
    +     height = 7,
    +     dpi = 300
    + )
> 
  > # Export the results as CSV using base R
  > write.csv(
    +     regional_analysis,
    +     "niger_idps_regional_analysis.csv",
    +     row.names = FALSE,
    +     fileEncoding = "UTF-8"
    + )
> 
  > cat("Analysis table and chart saved successfully.\n")
Analysis table and chart saved successfully.
> 
  > 
  > library(dplyr)
> 
  > # 1. Check the dataset size
  > cat("Number of rows:", nrow(pdi_data), "\n")
Number of rows: 56 
> cat("Number of columns:", ncol(pdi_data), "\n")
Number of columns: 6 
> 
  > # 2. Count missing values in each column
  > missing_values <- data.frame(
    +     column = names(pdi_data),
    +     missing_count = sapply(pdi_data, function(x) sum(is.na(x)))
    + )
> 
  > print(missing_values)
column missing_count
region             region             0
departement   departement             0
commune           commune             0
site_village site_village            53
menages           menages             0
personnes       personnes             0
> 
  > # 3. Check exact duplicate rows
  > duplicate_count <- sum(duplicated(pdi_data))
> cat("Exact duplicate rows:", duplicate_count, "\n")
Exact duplicate rows: 0 
> 
  > # 4. Check missing or blank geographic information
  > cat(
    +     "Missing or blank regions:",
    +     sum(is.na(pdi_data$region) | trimws(pdi_data$region) == ""),
    +     "\n"
    + )
Missing or blank regions: 0 
> 
  > # 5. Check invalid household or population counts
  > cat(
    +     "Negative household counts:",
    +     sum(pdi_data$menages < 0, na.rm = TRUE),
    +     "\n"
    + )
Negative household counts: 0 
> 
  > cat(
    +     "Negative population counts:",
    +     sum(pdi_data$personnes < 0, na.rm = TRUE),
    +     "\n"
    + )
Negative population counts: 0 
> 
  > cat(
    +     "Zero or missing household counts:",
    +     sum(is.na(pdi_data$menages) | pdi_data$menages == 0),
    +     "\n"
    + )
Zero or missing household counts: 0 
> 
  > cat(
    +     "Zero or missing population counts:",
    +     sum(is.na(pdi_data$personnes) | pdi_data$personnes == 0),
    +     "\n"
    + )
Zero or missing population counts: 0 
> 
  > 
  > # Build a data quality summary
  > dqa_summary <- data.frame(
    +     check = c(
      +         "Total records",
      +         "Exact duplicate rows",
      +         "Missing region",
      +         "Missing household count",
      +         "Missing population count",
      +         "Negative household count",
      +         "Negative population count"
      +     ),
    +     result = c(
      +         nrow(pdi_data),
      +         sum(duplicated(pdi_data)),
      +         sum(is.na(pdi_data$region) |
                      +                 trimws(pdi_data$region) == ""),
      +         sum(is.na(pdi_data$menages)),
      +         sum(is.na(pdi_data$personnes)),
      +         sum(pdi_data$menages < 0, na.rm = TRUE),
      +         sum(pdi_data$personnes < 0, na.rm = TRUE)
      +     )
    + )
> 
  > print(dqa_summary)
check result
1             Total records     56
2      Exact duplicate rows      0
3            Missing region      0
4   Missing household count      0
5  Missing population count      0
6  Negative household count      0
7 Negative population count      0
> 
  > # Export the quality summary
  > write.csv(
    +     dqa_summary,
    +     "niger_idps_data_quality_summary.csv",
    +     row.names = FALSE,
    +     fileEncoding = "UTF-8"
    + )
> 
  > 
  > # Build a data quality summary
  > dqa_summary <- data.frame(
    +     check = c(
      +         "Total records",
      +         "Exact duplicate rows",
      +         "Missing region",
      +         "Missing household count",
      +         "Missing population count",
      +         "Negative household count",
      +         "Negative population count"
      +     ),
    +     result = c(
      +         nrow(pdi_data),
      +         sum(duplicated(pdi_data)),
      +         sum(is.na(pdi_data$region) |
                      +                 trimws(pdi_data$region) == ""),
      +         sum(is.na(pdi_data$menages)),
      +         sum(is.na(pdi_data$personnes)),
      +         sum(pdi_data$menages < 0, na.rm = TRUE),
      +         sum(pdi_data$personnes < 0, na.rm = TRUE)
      +     )
    + )
> 
  > print(dqa_summary)
check result
1             Total records     56
2      Exact duplicate rows      0
3            Missing region      0
4   Missing household count      0
5  Missing population count      0
6  Negative household count      0
7 Negative population count      0
> 
  > # Export the quality summary
  > write.csv(
    +     dqa_summary,
    +     "niger_idps_data_quality_summary.csv",
    +     row.names = FALSE,
    +     fileEncoding = "UTF-8"
    + )
> 
  > 
  > library(dplyr)
> 
  > # Create a concise analysis summary
  > report_summary <- regional_analysis %>%
  +     arrange(desc(displaced_people))
> 
  > # Identify the region with the largest recorded caseload
  > top_region <- report_summary %>%
  +     slice_max(displaced_people, n = 1, with_ties = TRUE)
> 
  > # Calculate totals from the regional summary
  > total_people <- sum(
    +     report_summary$displaced_people,
    +     na.rm = TRUE
    + )
> 
  > total_households <- sum(
    +     report_summary$displaced_households,
    +     na.rm = TRUE
    + )
> 
  > cat("NIGER DISPLACEMENT ANALYSIS\n")
NIGER DISPLACEMENT ANALYSIS
> cat("Reporting date: 6 May 2024\n\n")
Reporting date: 6 May 2024

> cat("Regions represented:", nrow(report_summary), "\n")
Regions represented: 6 
> cat("People recorded:", format(total_people, big.mark = ","), "\n")
People recorded: 458,729 
> cat("Households recorded:", format(total_households, big.mark = ","), "\n\n")
Households recorded: 76,522 

> 
  > cat("Region(s) with the largest recorded caseload:\n")
Region(s) with the largest recorded caseload:
  > print(top_region)
# A tibble: 1 × 6
rank region    displaced_people displaced_households share_percent
<int> <chr>                <dbl>                <dbl>         <dbl>
  1     1 Tillabéri           199592                31009          43.5
# ℹ 1 more variable: people_per_household <dbl>
> 
  > 
  > # Create a report file
  > report_lines <- c(
    +     "# Niger Displacement Data Analysis",
    +     "",
    +     "**Reporting date:** 6 May 2024",
    +     "",
    +     "**Data source:** Displacement movements workbook supplied for this analysis.",
    +     "",
    +     "## 1. Objective",
    +     "",
    +     "This analysis examines recorded internally displaced people (IDPs) by region in Niger. It summarizes population and household counts, compares regional caseloads, and supports humanitarian monitoring and planning.",
    +     "",
    +     "## 2. Methodology",
    +     "",
    +     "The detailed internally displaced population worksheet was imported into R. Records were grouped by region, and the recorded numbers of people and households were summed. Regional percentages and people-per-household ratios were calculated from the aggregated data.",
    +     "",
    +     "## 3. Key results",
    +     "",
    +     paste0("- Regions represented: ", nrow(report_summary)),
    +     paste0("- People recorded in the detailed records: ", format(total_people, big.mark = ",")),
    +     paste0("- Households recorded in the detailed records: ", format(total_households, big.mark = ",")),
    +     "",
    +     "### Regional ranking",
    +     "",
    +     capture.output(print(report_summary)),
    +     "",
    +     "## 4. Data quality",
    +     "",
    +     "Data quality checks should cover missing values, duplicate records, invalid counts, and consistency with the workbook's global summary. Findings should be reported from the actual quality-check results; records should not be removed or corrected without verification.",
    +     "",
    +     "## 5. Limitations",
    +     "",
    +     "The figures reflect records in the detailed worksheet and its reporting date. They should not be described as current displacement estimates. Regional totals may require reconciliation with the global summary, and aggregation should be checked for overlapping or repeated records.",
    +     "",
    +     "## 6. Recommendations",
    +     "",
    +     "- Validate detailed totals against the official global summary.",
    +     "- Investigate missing values and potential duplicates.",
    +     "- Confirm that site-level records can be summed without double counting.",
    +     "- Use verified regional figures to inform response planning and resource allocation.",
    +     "- Clearly state the reporting date and data source in all charts and reports."
    + )
> 
  > writeLines(
    +     report_lines,
    +     "Niger_Displacement_Analysis_Report.md",
    +     useBytes = TRUE
    + )
> 
  > cat("Report created: Niger_Displacement_Analysis_Report.md\n")
Report created: Niger_Displacement_Analysis_Report.md
> 
  > 
  > readme_lines <- c(
    +     "# Niger Displacement Data Analysis — R",
    +     "",
    +     "## Project Overview",
    +     "",
    +     "This project analyzes recorded internally displaced people (IDPs) in Niger using R. It explores regional displacement patterns, summarizes household and population counts, and applies basic data quality checks to support humanitarian monitoring and response planning.",
    +     "",
    +     "## Objectives",
    +     "",
    +     "- Summarize recorded displaced people and households by region.",
    +     "- Rank regions by recorded displacement caseload.",
    +     "- Calculate each region's share of the recorded total.",
    +     "- Check missing values, duplicate records, and invalid counts.",
    +     "- Produce reproducible charts and analytical outputs.",
    +     "",
    +     "## Data Source",
    +     "",
    +     "Source: Displacement movements workbook, updated 6 May 2024.",
    +     "",
    +     "The analysis uses the detailed internally displaced population worksheet. Results describe the records available in that worksheet and should be validated against the workbook's global summary before being presented as official totals.",
    +     "",
    +     "## Tools",
    +     "",
    +     "- R and RStudio",
    +     "- readxl",
    +     "- dplyr",
    +     "- janitor",
    +     "- ggplot2",
    +     "",
    +     "## Project Outputs",
    +     "",
    +     "- `niger_idps_regional_ranking.png` — regional displacement chart",
    +     "- `niger_idps_regional_analysis.csv` — regional indicators",
    +     "- `niger_idps_data_quality_summary.csv` — data quality checks",
    +     "- `Niger_Displacement_Analysis_Report.md` — analytical report",
    +     "",
    +     "## Methodology",
    +     "",
    +     "The detailed worksheet was imported into R, grouped by region, and summarized. Regional shares and people-per-household ratios were calculated, and data quality checks were conducted to identify issues requiring further investigation.",
    +     "",
    +     "## Limitations",
    +     "",
    +     "The source data is dated 6 May 2024 and is not a current displacement estimate. Potential duplicate or overlapping records and discrepancies with the global summary must be checked before using the results for operational decisions.",
    +     "",
    +     "## Author",
    +     "",
    +     "Maman Aboubacar Ibrahim",
    +     "",
    +     "Humanitarian Data Analysis | Monitoring, Evaluation, Accountability and Learning (MEAL)"
    + )
> 
  > writeLines(readme_lines, "README.md", useBytes = TRUE)
> 
  > cat("README.md created successfully.\n")
README.md created successfully.
> library(tidyr)
library(dplyr)
library(ggplot2)
library(readxl)
library(janitor)

print("Packages loaded successfully")

  > 