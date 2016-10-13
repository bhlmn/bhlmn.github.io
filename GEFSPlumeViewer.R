# This script looks at the functionality of the package rnoaa

# Install the package
# install.packages("rnoaa")
library(rnoaa)

# Look at the variables in the GEFS dataset
# print(gefs_variables())

# latitude and longitude for Melbourne, FL
lat <- 28.1167
lon <- -80.6333
var.1 <- "u-component_of_wind_height_above_ground_ens"
var.2 <- "u-component_of_wind_height_above_ground_ens"
var.3 <- "Total_precipitation_surface_6_Hour_Accumulation_ens"
var.tmp <- "Temperature_height_above_ground_ens"

forecast <- gefs(var.tmp, lat = lat, lon = lon)
colnames(forecast$data) <- c('tmp', 'lon', 'lat', 'height', 'ens', 'time')
