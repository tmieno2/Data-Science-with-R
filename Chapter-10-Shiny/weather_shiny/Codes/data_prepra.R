library(raster)
library(tidyverse)
library(sf)
library(tidycensus)
library(tigris)

setwd("/Users/tmieno2/Dropbox/TeachingUNL/DataScience/LectureNotes/Chapter-10-Shiny/weather_shiny")

tmax_Jan_09 <- stack("./Data/tmax_Jan_09.tif")

head(fips_codes)

states <- tigris::states() %>% 
	st_as_sf() %>% 
	setnames(names(.), tolower(names(.))) %>% 
	st_transform(projection(tmax_Jan_09))

saveRDS(states, "./Data/state_boundary.rds")

