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
                   "Latitude Min:",
                   min = 41.70,
                   max = 42.65,
                   value = 30),
       sliderInput("lonbins",
                   "Longitude Min:",
                   min = -87.95,
                   max = -87.51,
                   value = 30),
       sliderInput("latbins2",
                   "Latitude Max:",
                   min = 41.70,
                   max = 42.65,
                   value = 30),
       sliderInput("lonbins2",
                   "Longitude Max:",
                   min = -87.95,
                   max = -87.51,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
