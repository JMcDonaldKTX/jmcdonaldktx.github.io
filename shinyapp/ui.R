########################################
# Author: Jason McDonald
# 1/17/22
# DS6306 Week 12 FLS
# ui.R
########################################

intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Performing EDA on the Beer DataSet"),
  
  br(), br(),
  
  p("TThis project will allow you to read in and display the beer data set, then perform a series of plots based on the data."),
  
)

# Page 2 - Vizualization -------------------------------------------

sidebar_content <- sidebarPanel(
  radioButtons("dataset", "Choose a dataset",
               c("Beer" = "beerDS")
               #c("Beer" = "beerDS", "Breweries" = "brewreriesDS", "Clean and Merge" = "CleanDS")
  ),
  actionButton("plotHistABV", "View ABV Histogram"),
  actionButton("plotHistIBU", "View IBU Histogram"),
  actionButton("plotBPABV", "View ABV Boxplot"),
  actionButton("plotBPIBU", "View IBU BoxPlot"),
  actionButton("plotScatter", "View ABV vs IBU Scatterplot"),
  actionButton("plotScatterWReg", "Add Regression Line")
)

main_content <- mainPanel(
  plotOutput("plot")
)





# User Interface -----------------------------------------------------
ui <- navbarPage(
  "ABV and IBU Analysis of Beer Data",
  intro_panel,
  sidebar_content,
  main_content
)