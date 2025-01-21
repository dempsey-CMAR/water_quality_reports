# April 3, 2024

# this script exports a csv file with information needed to upload the
# Water Quality reports to the cmar website map

library(dplyr)
library(here)
library(readr)

# water quality county links ----------------------------------------------

path <- file.path("R:/program_documents/website_documents/map_datasets")

links <- read_csv(
  paste0(path, "/dataset_links/2024-12-06_water_quality_dataset_links.csv"),
  show_col_types = FALSE
)


# import station locations --------------------

st_locations <- read_csv(
  here("data","2024-12-06_station_locations.csv"), show_col_types = FALSE
)

st_locations <- st_locations %>%
  left_join(links, by = "county")

# explore -----------------------------------------------------------------

# old_st_locations <- read_csv(
#   here("data","2024-03-14_station_locations.csv"), show_col_types = FALSE
# )
#
# check <- st_locations %>%
#  full_join(old_st_locations, by = c("county", "station"))
#
# new_station_locations <- st_locations %>%
#   anti_join(old_st_locations, by = c("county", "station"))
#
# renamed <- old_st_locations %>%
#   anti_join(st_locations, by = c("county", "station"))


# Format & Export ------------------------------------------------------------------

st_locations %>%
  mutate(`Program Branch` = "Water Quality") %>%
  select(
    `Program Branch`,
    County = county,
    Station = station,
    Latitude = latitude,
    Longitude = longitude,
    `View summary report` = cmar_report,
    `Download data from NS Open Data Portal` = open_data,
    `Download data from CIOOS` = cioos
  ) %>%
  write_csv(
    file = paste0(
      path, "/", Sys.Date(), "_water_quality_map_dataset.csv"
    )
  )





