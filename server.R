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

setwd("C:/Users/Jenn/Desktop/CSCI490/GroupProject/ShinyApp/ShinyApp/test/")
source("C:/Users/Jenn/Desktop/CSCI490/GroupProject/ShinyApp/ShinyApp/test/functions.R")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins1 <- seq(minLat, maxLat, length.out = input$latbins + 1)
    bins2 <- seq(minLon, maxLon, length.out = input$latbins + 1)
    
    cat(input$latbins, " ", input$lonbins  ,"\n")
    cat(input$latbins2, " ", input$lonbins2, "\n")
    
    inputLat <- as.numeric(input$latbins)
    inputLon <- as.numeric(input$lonbins)
    
    validHits <- df_lat_lon_type[which(df_lat_lon_type$latitude >= input$latbins &
                                        df_lat_lon_type$latitude <= input$latbins2),]
    validHits <- validHits[which(validHits$longitude >= input$lonbins &
                                         validHits$longitude <= input$lonbins2),]
    
    cat("First Valid Hit: ", validHits$primary_type[1], "\n")
    
    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    map <- get_map(location = "chicago", zoom = 11)
    ggmap(map) + geom_point(data=validHits, aes(x=longitude, y=latitude))
    
  })
  
})
