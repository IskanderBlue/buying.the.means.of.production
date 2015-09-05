# setwd("D:/Programming/buying.the.means.of.production/btmop.shiny")
# User interface for shiny app
library(shiny)
shinyUI(fluidPage(
     titlePanel("Capitalist socialism!"),
     # This is the general layout.
     sidebarLayout(
          # This is everything on the left side...
          sidebarPanel(
               # State selection
               selectInput("state", "Choose a state:", choices = c("Canada", "USA")),
               # Savings slider
               sliderInput("pct", "Percent of labour compensation used to further the revolution:", 0, 100, 20),
               # Sources
               h3("Sources:"),
               htmlOutput("sources")
          ),
          # This is everything on the right side...
          mainPanel(
               h3("Years of savings until workers could..."),
               h4("...control all publically held firms:"),
               verbatimTextOutput("publicControl"), 
               h4("...own all publically held firms:"),
               verbatimTextOutput("publicOwnership"),
               h4("...control all firms:"),
               verbatimTextOutput("totalControl"), 
               h4("...own all firms:"),
               verbatimTextOutput("totalOwnership")
          )
     )
))