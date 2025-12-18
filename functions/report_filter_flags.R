#' Filter data to keep observations of acceptable quality
#'
#' @param dat Data frame with summary quality control flags in long format
#'   (e.g., output of `qc_pivot_longer()`).
#'
#' @param keep_sensor_depth_measured_m  Vector of acceptable flags for variable
#'   sensor_depth_measured_m. Default is c(1, 3, NA).
#'
#' @param keep_salinity_psu Vector of acceptable flags for variable
#'   salinity_psu. Default is c(1, NA).
#'
#' @param keep_temperature_degree_c Vector of acceptable flags for variable
#'   temperature_degree_c. Default is c(1, 3, NA).
#'
#' @importFrom dplyr %>% filter
#'
#' @export

report_filter_flags <- function(
    dat,

    keep_salinity_psu = c(1, NA),
    keep_sensor_depth_measured_m = c(1, 3, NA),
    keep_temperature_degree_c = c(1, 3, NA),
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


