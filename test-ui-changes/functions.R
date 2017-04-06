# data api: https://data.cityofchicago.org/resource/6zsd-86xi.json

# Store functions in this file
library("rjson")
setwd("/Users/bmc/Desktop/CSCI-49000/week_12/hw/")


# Functions
fillDataFrameWithList <- function(someList){
  
  df <- data.frame(latitude=c(0), longitude=c(0), primary_type=c(""))
  df$latitude <- as.numeric(df$latitude)
  df$longitude <- as.numeric(df$longitude)
  df$primary_type <- as.character(df$primary_type)
  
  cat("Populating data frame.")
  for(i in 1:length(someList)){
 
    row <- c(someList[[i]]$latitude, someList[[i]]$longitude, someList[[i]]$primary_type)
    df <- rbind(df, row)
    
    cat(df[i,"latitude"]," ", df[i,"longitde"]," ", df[i,"primary_type"])
  }
  cat("Data frame successfully populated.")
  return(df)
}


removeNonNumericRows <- function(df){
    df_2 <- df_lat_lon_type[!is.na(as.numeric(as.character(df_lat_lon_type$latitude))),]
    df_3 <- df_lat_lon_type[!is.na(as.numeric(as.character(df_lat_lon_type$longitude))),]
    df_lat_lon_type <- df_3
    return(df_lat_lon_type)
}




# Read the 'live' json data as a list object
# This dataframe will repopulate everytime you refresh the app
json_file <- "https://data.cityofchicago.org/resource/6zsd-86xi.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))

#
#
#               df_lat_lon_type structure
#
#                          Columns
#    ___________________________________________________
#                latitude  | longitude  | primary_type
#    ROW1                  |            |
#    ROW2                  |            |
#    ...                   |            |
#    ___________________________________________________
# Example, df_lat_lon_type[1,"latitude"] // returns the first rows latitude
#          df_lat_lon_type[1:3,c("latitude,"longitude")] // returns latitude and longitude for the first 3 rows
#
#
#


df_lat_lon_type <- fillDataFrameWithList(json_data)
df_lat_lon_type <- removeNonNumericRows(df_lat_lon_type)
df_lat_lon_type[,c("latitude")] <- as.numeric(df_lat_lon_type[,c("latitude")])
df_lat_lon_type[,c("longitude")] <- as.numeric(df_lat_lon_type[,c("longitude")])

minLat <- min(df_lat_lon_type[,"latitude"])
maxLat <- max(df_lat_lon_type[,"latitude"])
meanLat <- mean(df_lat_lon_type[,"latitude"])
minLon <- min(df_lat_lon_type[,"longitude"])
maxLon <- max(df_lat_lon_type[,"longitude"])
meanLon <- mean(df_lat_lon_type[,"longitude"])


cat("Min Latitude: ", minLat, "\n")
cat("Max Latitude: ", maxLat, "\n")
cat("Mean Latitude: ", meanLat, "\n")
cat("Min Longitude: ", minLon, "\n")
cat("Max Longitude: ", maxLon, "\n")
cat("Mean Longitude: ", meanLon, "\n")

