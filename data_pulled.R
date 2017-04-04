# data api: https://data.cityofchicago.org/resource/6zsd-86xi.json

library("rjson")
json_file <- "https://data.cityofchicago.org/resource/6zsd-86xi.json"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))

fillDataFrameWithList <- function(someList){

  df <- data.frame(latitude=c(0), longitude=c(0), primary_type=c(""))
  df$latitude <- as.numeric(df$latitude)
  df$longitude <- as.numeric(df$longitude)
  df$primary_type <- as.character(df$primary_type)
  
  for(i in 1:length(someList)){
      #df[i,1] <- 
      #df[i,2] <-
      #df[i,3] <- 
     cat(someList[[i]]$latitude, " ", someList[[i]]$longitude," ", someList[[i]]$primary_type , "\n")
      row <- c(someList[[i]]$latitude, someList[[i]]$longitude, someList[[i]]$primary_type)
      df <- rbind(df, row)
  }
  
  return(df)
}

newdf <- fillDataFrameWithList(json_data)
head(newdf)
