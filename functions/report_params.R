# March 25, 2024

# Parameters to source for Water Quality reports
# Moved to here to reduce length of report script

# all water quality variables ---------------------------------------------
# variables that could be included in the report

vars <- c(
  "dissolved_oxygen_percent_saturation",
  "dissolved_oxygen_uncorrected_mg_per_l",
  "salinity_psu",
  "sensor_depth_measured_m",
  "temperature_degree_c"
)

# custom DO y limits ------------------------------------------------------
# stations that have DO below the default range of ss_plot_variables
custom_do_ylims <- c(
  "0814x E",
  "0814x W",
  "Aberdeen",
  "Deep Basin",
  "Tickle Island 1"
)

# custom SAL y limits ------------------------------------------------------
# stations that have Salinity below the default range of ss_plot_variables
custom_sal_ylims <- c(
  "0814x E",
  "0814x W",
  "Monks Head",
  "Pictou Landing"
)

# add that kept suspect DO in caption
keep_sus_sal <- c("Monks Head", "Pictou Landing")

