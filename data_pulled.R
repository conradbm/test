# data api: https://data.cityofchicago.org/resource/6zsd-86xi.json

library("rjson")
setwd("/Users/bmc/Desktop/CSCI-49000/week_12/hw/")
source("/Users/bmc/Desktop/CSCI-49000/week_12/hw/functions.R")
json_file <- "https://data.cityofchicago.org/resource/6zsd-86xi.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))

newdf <- fillDataFrameWithList(json_data)
head(newdf)
