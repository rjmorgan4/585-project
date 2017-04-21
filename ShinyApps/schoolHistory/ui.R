###School History Display

## UI


library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)


##Read in a data set that is saved to the same folder

schoolHistory <- read.csv("All_Schools_History.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("School History Display"),
  
  sidebarPanel(
    
    #can put selected input things here
    
    
    selectInput("conf","Conference",choices = sort(unique(schoolHistory$Conf)), selected = "Big Ten"),
    
    sliderInput("Seasons","Selected Seasons",1885,2016,value = c(1900,2016)),
    
    radioButtons("yvariable","Value Displayed",choices=colnames(schoolHistory)[4:12], selected="W")
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
