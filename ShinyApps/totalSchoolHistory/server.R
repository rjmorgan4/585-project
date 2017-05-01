###Total School History Display

## Server


library(shiny)
library(ggplot2)
library(plotly)


##Read in a data set that is saved to the same folder

totalSchoolHistory <- read.csv("totalSchoolHistory.csv")

shinyServer(function(input, output) {
  
  #Put reactive something here for manipulating the data
  
  filteredData <- reactive({
    totalSchoolHistory %>%
   filter(Year %in% input$Seasons[1]:input$Seasons[2]) %>% filter(Team %in% input$selectedTeams)
  })
  
  
  
  plot<- reactive({
    graph <- filteredData() %>% ggplot(aes(x=Year,y = filteredData()[[input$yvariable]], color=Team)) +
      geom_line()+
      ggtitle(paste(input$yvariable," for the years ",input$Seasons[1]," through", input$Seasons[2]))+
      xlab("Season")+
      ylab(input$yvariable)
  })
  
  output$graph = renderPlotly(
    ggplotly(plot())
    
  )
  
  
  
})