########################################
# Author: Jason McDonald
# 1/17/22
# DS6306 Week 12 FLS
# RShinyBeerApp.R
########################################

library("shiny")

source("ui.R")
source("server.R")
shinyApp(ui = ui, server = server)