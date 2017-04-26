###School History Display By Team

## Server


library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)


##Read in a data set that is saved to the same folder

schoolHistory <- read.csv("All_Schools_History.csv")

shinyServer(function(input, output) {
  
  #Put reactive something here for manipulating the data
  
  filteredData <- reactive({
    schoolHistory %>%
      filter(Team %in% input$teams) %>% filter(Year %in% input$Seasons[1]:input$Seasons[2])
  })
  
  
  
  plot<- reactive({
    graph <- filteredData() %>% ggplot(aes(x=Year,y = filteredData()[[input$yvariable]], color=Team)) +
      geom_line()+
      ggtitle(paste(input$conf," Teams' ",input$yvariable," for the years ",input$Seasons[1]," through", input$Seasons[2]))+
      xlab("Season")+
      ylab(input$yvariable)
  })
  
  output$graph = renderPlotly(
    ggplotly(plot())
    
  )
  
  
  
})