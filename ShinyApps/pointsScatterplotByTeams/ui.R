#Scatterplot of Points By Team

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
    
    
    sliderInput("Seasons","Selected Seasons",1885,2016,value = c(1900,2016)),
    
    sliderInput("cutoff","Points-Cut off", 0, 80, value=35), 
    
    radioButtons("wlLine","Win Loss Line",choices = c("Yes","No"), selected = "No"),
    
    
    #Currently Restricted to teams Currently in the Big 10 or the Big 12.
    
    checkboxGroupInput("teams","Selected Teams",choices=c("nebraska","iowa","michigan","michigan-state","ohio-state",
                                                          "rutgers","maryland","minnesota","indiana","northwestern","penn-state",
                                                          "purdue","illinois","wisconsin","iowa-state","kansas","kansas-state","oklahoma",
                                                          "oklahoma-state","west-virginia","texas","texas-tech","baylor","texas-christian")
                       , selected=c("nebraska","iowa-state","iowa"))
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
