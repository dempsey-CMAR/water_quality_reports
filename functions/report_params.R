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
keep_sus_do <- c(
  "0814x E",
  "0814x W",
  "Aberdeen",
  "Deep Basin",

  "Tickle Island 1" # for 60 m DO; note measured sensor depth considered Suspect
)


# custom SAL y limits ------------------------------------------------------
# stations that have Salinity below the default range of ss_plot_variables
keep_sus_sal <- c(
  "0814x E",
  "0814x W",
  "Monks Head"
)


