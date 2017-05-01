#Scatterplot of Points

## UI


library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)


##Read in a data set that is saved to the same folder

schedules <- read.csv("power5Schedules.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("Scores of Power 5 games"),
  
  sidebarPanel(
    
    #can put selected input things here
    
    
    sliderInput("Seasons","Selected Seasons",1865,2016,value = c(1865,2016)),
    
    selectInput("conf","Conference",choices=unique(schedules$Conference)),
    
    
    sliderInput("cutoff","Points-Cut off", 0, 80, value=35), 
    
    radioButtons("wlLine","Win Loss Line",choices = c("Yes","No"), selected = "No")
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
