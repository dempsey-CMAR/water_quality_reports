

import_map_params <- function(county, crs = 4326){

  if(county == "Annapolis"){
    dummy_points <- data.frame(Long = c(-66, -65.4), Lat = c(44.5, 44.8)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Antigonish"){
    dummy_points <- data.frame(Long = c(-62.1, -61.4), Lat = c(45.55, 45.9)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Cape Breton"){
    dummy_points <- data.frame(Long = c(-60.7,  -59.8), Lat = c(45.95, 46.4)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Colchester"){
    dummy_points <- data.frame(Long = c(-63.45, -63), Lat = c(45.7, 45.9)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Digby"){
    dummy_points <- data.frame(Long = c(-66.7, -65.4), Lat = c(44.1, 44.7)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Guysborough"){
    dummy_points <- data.frame(Long = c(-62.7, -60), Lat = c(44.8, 45.7)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  # these will need to be updated to show Careys Point
  if(county == "Halifax"){
    dummy_points <- data.frame(Long = c(-64.1, -62.2), Lat = c(44.1, 45.15)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Inverness"){
    dummy_points <- data.frame(Long = c(-61.60, -60.56), Lat = c(45.55, 46.2)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Lunenburg"){
    dummy_points <- data.frame(Long = c(-64.8, -63.5), Lat = c(44.13, 44.8)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Pictou"){
    dummy_points <- data.frame(Long = c(-62.92, -62.2), Lat = c(45.5, 45.9)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Queens"){
    dummy_points <- data.frame(Long = c(-65.40, -64), Lat = c(43.77, 44.3)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Richmond"){
    dummy_points <- data.frame(Long = c(-61.5, -60.4), Lat = c(45.35, 45.75)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Shelburne"){
    dummy_points <- data.frame(Long = c(-66, -64.7), Lat = c(42.8, 44)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Victoria"){
    dummy_points <- data.frame(Long = c(-62, -58), Lat = c(45.6, 47.1)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  if(county == "Yarmouth"){
    dummy_points <- data.frame(Long = c(-67, -65.4), Lat = c(43.6, 44)) %>%
      st_as_sf(coords = c("Long", "Lat"), crs = crs)
  }

  dummy_points

}



