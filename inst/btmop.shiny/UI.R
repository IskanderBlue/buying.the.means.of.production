# setwd("D:/Programming/buying.the.means.of.production/btmop.shiny")
# UI



library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
     
     # Application title
     titlePanel("Capitalist socialism!"),
     
     # Sidebar with controls to provide a caption, select a dataset,
     # and specify the number of observations to view. Note that
     # changes made to the caption in the textInput control are
     # updated in the output area immediately as you type
     sidebarLayout(
          sidebarPanel(
               selectInput("state", "Choose a state:", 
                           choices = c("Canada", "USA")),
               sliderInput("pct", "Percent of labour compensation used to further the revolution:", 0, 100, 20),
               h3("Sources:"),
               htmlOutput("sources")
          ),
          
          # Show the caption, a summary of the dataset and an HTML 
          # table with the requested number of observations
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

