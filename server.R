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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    map <- get_map(location = "chicago", zoom = 11)
    ggmap(map) 
    #+ geom_point(data=crime_data[crime_data$Primary.Type=="HOMICIDE",], aes(x=Longitude, y=Latitude))
    
  })
  
})