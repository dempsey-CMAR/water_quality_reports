# Filter data to keep observations of acceptable quality

## dissolved oxygen (percent saturation and mg/L)
### keep flags of 1 and 3 for all tests EXCEPT rolling sd
### for rolling sd, only keep flags of 1

## for salinity
### only keep flags of 1 for now. This may be changed for future releases
### flags 1 and 3 are kept for several stations (within the body of the report)

## all other variables
### keep flags of 1 and 3

report_filter_flags <- function(
    dat,

    keep_salinity_psu = c(1, NA),
    keep_sensor_depth_measured_m = c(1, 3, NA),
    keep_temperature_degree_c = c(1, 3, NA)
) {

  dat <- dat %>%
    filter(
      (variable == "dissolved_oxygen_percent_saturation" &
         grossrange_flag_value %in% c(1, 3, NA) &
         climatology_flag_value %in% c(1, 3, NA) &
         spike_flag_value %in% c(1, 3, NA) &
         rolling_sd_flag_value %in% c(1, NA)
      ) |

        (variable == "dissolved_oxygen_uncorrected_mg_per_l" &
           grossrange_flag_value %in% c(1, 3, NA) &
           climatology_flag_value %in% c(1, 3, NA) &
           spike_flag_value %in% c(1, 3, NA) &
           rolling_sd_flag_value %in% c(1, NA)
        ) |

        (variable == "sensor_depth_measured_m" &
           qc_flag_value %in% keep_sensor_depth_measured_m) |

        (variable == "salinity_psu" & qc_flag_value %in% keep_salinity_psu) |

        (variable == "temperature_degree_c" &
           qc_flag_value %in% keep_temperature_degree_c)
    )

  # because human_in_loop flags not pivoted
  if("human_in_loop_flag_dissolved_oxygen_percent_saturation" %in% colnames(dat)) {

    dat <- dat %>%
      filter(
        human_in_loop_flag_dissolved_oxygen_percent_saturation %in% c(1, NA))
  }

  dat
}


