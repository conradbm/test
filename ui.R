#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("C:/Users/Jenn/Desktop/CSCI490/GroupProject/ShinyApp/ShinyApp/test/functions.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chicago crime data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("latbins",
                   "Latitude:",
                   min = minLat,
                   max = maxLat,
                   value = meanLat),
       sliderInput("lonbins",
                   "Longitude:",
                   min = minLon,
                   max = maxLon,
                   value = meanLon)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
