###Team Stats

## UI


library(shiny)
library(ggplot2)
library(plotly)


##Read in a data set that is saved to the same folder

teamStats <- read.csv("All_Schools_Team_Stats_Post2000.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("Season Avg. Statistics"),
  
  sidebarPanel(
    
    #can put selected input things here
    
    
    selectInput("conf","Conference",choices = sort(unique(teamStats$Conf)), selected = "Big Ten"),
    
    sliderInput("Seasons","Selected Seasons",2000,2016,value = c(2000,2016)),
    
    radioButtons("Type","Type of Statistic", choices = c("Offense","Defense","Difference"), selected = "Offense"),
    
    selectInput("yvariable","Value Displayed on Y Axis",choices=colnames(teamStats)[5:26], selected="Passing_Yards"),
    
    selectInput("xvariable","Value Displayed on X Axis", choices = colnames(teamStats)[5:26], selected="Passing_TD")
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
