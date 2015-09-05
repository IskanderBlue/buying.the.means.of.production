# setwd("D:/Programming/buying.the.means.of.production/btmop.shiny")
# UI



library(shiny)

shinyUI(fluidPage(
          titlePanel("Capitalist socialism!"),
     sidebarLayout(
          sidebarPanel(
               selectInput("state", "Choose a state:", 
                           choices = c("Canada", "USA")),
               sliderInput("pct", "Percent of labour compensation used to further the revolution:", 0, 100, 20),
               h3("Sources:"),
               htmlOutput("sources")
          ),
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

