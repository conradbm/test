# data api: https://data.cityofchicago.org/resource/6zsd-86xi.json

library("rjson")
json_file <- "https://data.cityofchicago.org/resource/6zsd-86xi.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))
lat1 <- json_data[[1]]$latitude
lon1 <- json_data[[1]]$longitude

df <- data.frame(matrix(unlist(json_data), nrow=1000, byrow=T),stringsAsFactors=FALSE)

head(df)
