###Totals school History

## UI


library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)


##Read in a data set that is saved to the same folder

totalSchoolHistory <- read.csv("totalSchoolHistory.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("School History Display"),
  
  sidebarPanel(
    
    #can put selected input things here

    
    sliderInput("Seasons","Selected Seasons",1885,2016,value = c(1900,2016)),
    
    radioButtons("yvariable","Value Displayed",choices=colnames(totalSchoolHistory)[3:7], selected="totalWins"),
    
    checkboxGroupInput("selectedTeams","Teams", choices= unique(totalSchoolHistory$Team), selected = c("nebraska","iowa-state"))
    
    
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
