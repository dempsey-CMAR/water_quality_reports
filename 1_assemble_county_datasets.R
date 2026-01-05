# November 10, 2025

# For Open Data Portal Data
## VR2AR observations from a unit paired with a hobo temp were removed
### (temperature and depth)
## Only the max flag column is published for qc info

library(data.table)
library(dplyr)
library(purrr)
library(qaqcmar)
library(sensorstrings)

county <- "pictou"

path <- file.path("R:/data_branches/water_quality/processed_data/qc_data")

dat_all <- qc_assemble_county_data(folder = county) %>%
  mutate(
    lease = if_else(lease == "NA" | lease == "na", NA_character_, lease),
    lease = case_when(
      lease == "772" ~ "0772",
      lease == "193" ~ "0193",
      lease == "667" ~ "0667",
      lease == "716" ~ "0716",
      lease == "692" ~ "0692",

      #lunenburg
      lease == "995" ~ "0995",

      # guys
      lease == "1" ~ "0001",
      lease == "28" ~ "0028",
      lease == "75" ~ "0075",
      lease == "191" ~ "0191",
      lease == "613" ~ "0613",
      lease == "622" ~ "0622",
      lease == "623" ~ "0623",
      lease == "839" ~ "0839",
      lease == "904" ~ "0904",

      # shelburne
      lease == "967" ~ "0967",

      TRUE ~ lease
    )
  )

unique(dat_all$waterbody)
unique(dat_all$station)
unique(dat_all$lease)

# check for duplicate rows ------------------------------------------------

dat_dups <- dat_all %>%
  data.table() %>%
  duplicated()
if(any(dat_dups == TRUE)) warning("duplicated rows detected in dat")

# open data portal (summary flags) -------------------------------------------

# to remove the qc_test_variable columns (leaving only the max flag col)
rm_cols <- thresholds %>%
  distinct(qc_test, variable) %>%
  mutate(rm_cols = paste(qc_test, "flag", variable, sep = "_"))
rm_cols <- sort(c(
  rm_cols$rm_cols,
  "ph_ph", "human_in_loop_flag_ph_ph", "qc_flag_ph_ph",
  "human_in_loop_flag_dissolved_oxygen_percent_saturation",
  "human_in_loop_flag_dissolved_oxygen_uncorrected_mg_per_l",
  "human_in_loop_flag_salinity_psu",
  "human_in_loop_flag_sensor_depth_measured_m",
  "human_in_loop_flag_temperature_degree_c")
)

# length(keep_cols) and length(rm_cols) do no add to length(colnames(dat))
# because rm_cols creates a column named depth_crosscheck_flag_sensor_depth_at_low_tide_m
# which does no exist in dat
keep_cols <- colnames(dat_all)[which(!(colnames(dat_all) %in% rm_cols))]

# remove vr2 data with HIL 4
vr2_qc <- dat_all %>%
  filter(
    sensor_type == "vr2ar" &
      human_in_loop_flag_temperature_degree_c == 4 &
      hil_comment ==
      "vr2ar unit paired with hobo sensor for more accurate temperature data"
  )

# need to use anti_join here and NOT filter above or else rows with NAs will be
# filtered
dat <- dat_all %>%
  anti_join(vr2_qc, by = keep_cols)

if(nrow(dat_all) - nrow(vr2_qc) != nrow(dat)) {
  warning("problem filtering vr2ar data. Check number of rows")
}

# remove the qc_test_variable columns (leaving only the max flag col)
dat %>%
  select(-county, -any_of(rm_cols)) %>%
  qc_assign_flag_labels() %>%
  ss_export_county_files(county = county, export_rds = FALSE)

# cmar county data (all flags) --------------------------------------------

# remove columns that are all NA
dat %>%
  select_if(~ !all(is.na(.))) %>%
  ss_export_county_files(county = county, export_csv = FALSE)

# pivot longer to check number of rows
n_rows <- dat %>%
  select(-contains("flag")) %>%
  ss_pivot_longer()
nrow(n_rows)


# # export locally
# dat %>%
#   select_if(~ !all(is.na(.))) %>%
#   ss_export_county_files(
#     county = county,
#     output_path = here(),
#     export_csv = FALSE
#   )


