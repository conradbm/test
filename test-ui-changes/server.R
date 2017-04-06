#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# https://data.cityofchicago.org/resource/6zsd-86xi.json

library(shiny)
library(ggmap)
#install.packages("GeomRasterAnn")

setwd("/Users/bmc/Desktop/CSCI-49000/week_12/hw/")
source("/Users/bmc/Desktop/CSCI-49000/week_12/hw/functions.R")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins1 <- seq(minLat, maxLat, length.out = input$latbins + 1)
    bins2 <- seq(minLon, maxLon, length.out = input$latbins + 1)
    
    cat(input$latbins, " ", input$lonbins  ,"\n")
    
    inputLat <- as.numeric(input$latbins)
    inputLon <- as.numeric(input$lonbins)
    
    validHits <- df_lat_lon_type[which(df_lat_lon_type$latitude >= inputLat &
                                        df_lat_lon_type$longitude >= inputLon),]
    
    cat("First Valid Hit: ", validHits$primary_type[1], "\n")
    
    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    map <- get_map(location = "chicago", zoom = 11)
    ggmap(map)  
    #+ geom_point(data=crime_data[df_lat_lon_type$primary_type=="HOMICIDE",], aes(x=longitude, y=latitude))
    
  })
  
})
