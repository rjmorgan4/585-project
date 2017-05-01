###Totals school History

## UI


library(shiny)
library(ggplot2)
library(plotly)


##Read in a data set that is saved to the same folder

totalSchoolHistory <- read.csv("totalSchoolHistory.csv")


#Shiny stuff:

shinyUI(fluidPage(
  
  titlePanel("School History Display"),
  
  sidebarPanel(
    
    #can put selected input things here

    
    sliderInput("Seasons","Selected Seasons",1865,2016,value = c(1865,2016)),
    
    radioButtons("yvariable","Value Displayed",choices=colnames(totalSchoolHistory)[3:7], selected="totalWins"),
    
    checkboxGroupInput("selectedTeams","Teams", choices= c("nebraska","iowa","michigan","michigan-state","ohio-state","rutgers","maryland",
                                                           "minnesota","indiana","northwestern","penn-state","purdue", "illinois",
                                                           "wisconsin","iowa-state", "kansas","kansas-state","oklahoma","oklahoma-state",
                                                           "west-virginia","texas","texas-tech","baylor","texas-christian"), 
                       selected = c("nebraska","iowa-state"))
    
    
    
  ),
  
  
  
  mainPanel(
    
    #put your output stuff here
    
    plotlyOutput("graph")
    
  )
  
))
