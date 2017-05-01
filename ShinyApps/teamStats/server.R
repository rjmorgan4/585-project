###Team Stats

## Server


library(shiny)
library(ggplot2)
library(plotly)


##Read in a data set that is saved to the same folder

teamStats <- read.csv("All_Schools_Team_Stats_Post2000.csv")

shinyServer(function(input, output) {
  
  #Put reactive something here for manipulating the data
  
  filteredData <- reactive({
    teamStats %>%
      filter(Conference == input$conf) %>%filter(Type == input$Type) %>% filter(Season %in% input$Seasons[1] :input$Seasons[2])
  })
  
  
  
  plot<- reactive({
    graph <- filteredData() %>% ggplot(aes(x=filteredData()[[input$xvariable]],y = filteredData()[[input$yvariable]], color=Team, type=Season)) +
      geom_point()+
      ggtitle(paste(input$conf," Teams' ",input$yvariable," vs ",input$xvariable," for ",input$Seasons[1]," through", input$Seasons[2]))+
      xlab(input$xvariable)+
      ylab(input$yvariable)
  })
  
  output$graph = renderPlotly(
    ggplotly(plot())
    
  )
  
  
  
})