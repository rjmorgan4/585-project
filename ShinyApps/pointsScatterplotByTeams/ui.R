#Scatterplot of Points By Team

## UI


library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)


##Read in a data set that is saved to the same folder

schedules <- read.csv("power5Schedules.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("Scores of Power 5 games"),
  
  sidebarPanel(
    
    #can put selected input things here
    
    
    sliderInput("Seasons","Selected Seasons",1885,2016,value = c(1900,2016)),
    
    sliderInput("cutoff","Points-Cut off", 0, 80, value=35), 
    
    radioButtons("wlLine","Win Loss Line",choices = c("Yes","No"), selected = "No"),
    
    
    checkboxGroupInput("teams","Selected Teams",choices=unique(schedules$Team), selected=c("nebraska","iowa-state","iowa"))
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
