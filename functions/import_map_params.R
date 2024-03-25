

import_map_params <- function(county, crs = 4326){

  if(county == "Annapolis"){
    dummy_points <- data.frame(Long = c(-66, -65.4), Lat = c(44.5, 44.8)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Antigonish"){
    dummy_points <- data.frame(Long = c(-62.235, -61.4362), Lat = c(45.383, 45.888)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Cape Breton"){
    dummy_points <- data.frame(Long = c(-60.6,  -59.8), Lat = c(45.95, 46.35)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Colchester"){
    dummy_points <- data.frame(Long = c(-63.45, -63), Lat = c(45.7, 45.9)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Digby"){
    dummy_points <- data.frame(Long = c(-66.5, -65.332), Lat = c(44.002, 44.692)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Guysborough"){
    dummy_points <- data.frame(Long = c(-62.7, -60), Lat = c(44.9, 45.65)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Halifax"){
    dummy_points <- data.frame(Long = c(-64.24, -61.9), Lat = c(44.4, 45.2)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Inverness"){
    dummy_points <- data.frame(Long = c(-61.60, -60.56), Lat = c(45.55, 46.2)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Lunenburg"){
    dummy_points <- data.frame(Long = c(-65, -63.5), Lat = c(44.13, 44.7)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Pictou"){
    dummy_points <- data.frame(Long = c(-63.15, -62.09), Lat = c(45.28, 45.83)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Queens"){
    dummy_points <- data.frame(Long = c(-65.40, -64.52), Lat = c(43.79, 44.3)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Richmond"){
    dummy_points <- data.frame(Long = c(-61.37, -60.4), Lat = c(45.4, 45.85)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Shelburne"){
    dummy_points <- data.frame(Long = c(-66, -64.7), Lat = c(43.38, 44.23)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Victoria"){
    dummy_points <- data.frame(Long = c(-61.75, -59.25), Lat = c(45.7, 47)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Yarmouth"){
    dummy_points <- data.frame(Long = c(-66, -65.39), Lat = c(43.38, 44)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  dummy_points

}



