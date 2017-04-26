###School History Display By Team

## UI


library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)


##Read in a data set that is saved to the same folder

schoolHistory <- read.csv("All_Schools_History.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("School History Display"),
  
  sidebarPanel(
    
    #can put selected input things here
    
    
    
    sliderInput("Seasons","Selected Seasons",1865,2016,value = c(1865,2016)),
    
    radioButtons("yvariable","Value Displayed",choices=colnames(schoolHistory)[4:12], selected="W"),
    
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
