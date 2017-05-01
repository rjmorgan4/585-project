#Scatterplot of points By Team

## Server


library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)


##Read in a data set that is saved to the same folder

schedules <- read.csv("power5Schedules.csv")

shinyServer(function(input, output) {
  
  #Put reactive something here for manipulating the data
  
  filteredData <- reactive({
    schedules %>%
      filter(Result != "")%>%
      filter(Team %in% input$teams) %>% filter(Season %in% input$Seasons[1]:input$Seasons[2])
  })
  
  
  
  
  plot<- reactive({
    graph <- filteredData() %>% ggplot(aes(x=Opponent_Points,y = Points, color=Result, shape=Location)) +
      geom_point()+
      facet_wrap(~Team)+geom_hline(yintercept = input$cutoff,color="red", lty=2, size=.2) +geom_vline(xintercept = input$cutoff, color = "red",lty=2, size=.2)+
      ggtitle(paste("Points Scatterplot during the years ",input$Seasons[1]," through", input$Seasons[2]))+
      theme(plot.title=element_text(size=12))+
      xlab("Points Given up")+
      ylab("Points Scored")+
      
      if(input$wlLine=="Yes"){geom_abline(slope=1,intercept = 0, size=.2)}
  })
  
  output$graph = renderPlotly(
    ggplotly(plot())
    
  )
  
  
  
})