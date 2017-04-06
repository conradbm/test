# data api: https://data.cityofchicago.org/resource/6zsd-86xi.json


# Import functions and libraries
library("rjson")
setwd("/Users/bmc/Desktop/CSCI-49000/week_12/hw/")
source("/Users/bmc/Desktop/CSCI-49000/week_12/hw/functions.R")

# Read the 'live' json data as a list object
json_file <- "https://data.cityofchicago.org/resource/6zsd-86xi.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))

# Apply a function to grab c("latitude", "longitude"," and "crime_type") from each list item and store it into a data frame
df_lat_lon_type <- fillDataFrameWithList(json_data)

df_lat_lon_type <- removeNonNumericRows(df_lat_lon_type)

minLat <- min(df_lat_lon_type[,"latitude"])
maxLat <- max(df_lat_lon_type[,"latitude"])
minLon <- min(df_lat_lon_type[,"longitude"])
maxLon <- max(df_lat_lon_type[,"longitude"])

minLat
maxLat
minLon
maxLon
