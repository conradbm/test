# Store functions in this file

fillDataFrameWithList <- function(someList){
  
  df <- data.frame(latitude=c(0), longitude=c(0), primary_type=c(""))
  df$latitude <- as.numeric(df$latitude)
  df$longitude <- as.numeric(df$longitude)
  df$primary_type <- as.character(df$primary_type)
  
  cat("Populating data frame.")
  for(i in 1:length(someList)){
    #df[i,1] <- 
    #df[i,2] <-
    #df[i,3] <- 
    cat(someList[[i]]$latitude, " ", someList[[i]]$longitude," ", someList[[i]]$primary_type , "\n")
    row <- c(someList[[i]]$latitude, someList[[i]]$longitude, someList[[i]]$primary_type)
    df <- rbind(df, row)
  }
  cat("Data frame successfully populated.")
  return(df)
}