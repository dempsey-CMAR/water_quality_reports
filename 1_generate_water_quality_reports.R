# This script generates county reports for all counties specified in << county >>

# SECTION 1: Read in document history and report files

# SECTION 2: Specify county(ies) for which to generate reports

# SECTION 2: Generate report(s)

library(dplyr)
library(here)
library(readxl)

# SECTION 1: SET UP ---------------------------------------------

county <- "Annapolis"

hist <- read_excel(
  "R:/tracking_sheets/water_quality_report_tracker.xlsx", sheet = "Tracking"
) %>%
  filter(County == county)

# SECTION 2: GENERATE REPORTS --------------------------------------------------------

report <- here("1_water_quality_report.qmd")

quarto::quarto_render(
  input = report,
  output_file = paste0(county, "_Water_Quality_Report.pdf"),
  execute_params = list(
    county = county,
    doc_version = hist$Version,
    doc_date = as.character(hist$Date),
    doc_notes = hist$Amendments
  )
)


-# rmarkdown template ------------------------------------------------------

sapply(county, function(x) {

  rmarkdown::render(
    input = report,
    output_file = paste0(x, "_Water_Quality_Report.docx"),
    params = list(county = x, doc.hist = filter(doc_history, County == x)))

})



