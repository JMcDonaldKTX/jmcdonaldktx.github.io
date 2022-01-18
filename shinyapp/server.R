########################################
# Author: Jason McDonald
# 1/17/22
# DS6306 Week 12 FLS
# server.R
########################################

library("ggplot2")



server <- function(input, output) {
  # assign values to `output` here
  v <- reactiveValues(data = NULL)
  
  Beers <- reactive({
    if (input$dataset == "beerDS")
      read.csv("Beers.csv", header = TRUE , ",")
    else
      stop("Unexpected dataset")
  })
 
  
  observeEvent(input$plotHistABV, {
    v$data <- ggplot(Beers(), aes(x=ABV)) + geom_histogram()
  })
  
  observeEvent(input$plotHistIBU, {
    v$data <- ggplot(Beers(), aes(x=IBU)) + geom_histogram()
  })
  observeEvent(input$plotBPABV, {
    v$data <- ggplot(Beers(), aes(x=ABV)) + geom_bar(stat="bin")
  })
  observeEvent(input$plotBPABV, {
    v$data <- ggplot(Beers(), aes(x=IBU)) + geom_bar(stat="bin")
  })
  observeEvent(input$plotScatter, {
    v$data <- ggplot(Beers(), aes(x=ABV, y=IBU)) + geom_point()
  })
  observeEvent(input$plotScatterWReg, {
    v$data <- ggplot(Beers(), aes(x=ABV, y=IBU)) + geom_point() + geom_smooth(method=lm, se=TRUE)
  })
  
  output$plot <- renderPlot({
    if (is.null(v$data)) return()
    v$data
  })
  
}