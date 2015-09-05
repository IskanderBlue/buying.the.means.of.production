# setwd("D:/Programming/buying.the.means.of.production/btmop.shiny")
# Server / behind the scenes code.
library(shiny)
# My information sources.  It would be nice to find more recent data.  
sources <- c(
     Canada = HTML('<p>2012 Canadian GDP: <code>1831.2</code><br>
                   Wages, Salaries, & Supplementary Income: <code>926.2</code><br>
                   <a href = "http://www.international.gc.ca/economist-economiste/statistics-statistiques/data-facts-fiches/Facts_fiches-Canada_Quarterly-trimestriel_Ec-Ind.aspx?lang=eng">(Both in billions of current (2015) Canadian dollars.)</a></p>
                   <p>Canadian publically traded stocks <a href = "https://www.quandl.com/collections/economics/stock-market-capitalization-by-country">in billions of 2012 US dollars</a>: <code>2016</code></p>
                   <p>Since in 2012 the <a href = "http://www.canadianforex.ca/forex-tools/historical-rate-tools/yearly-average-rates">CAD/USD exchange ratio</a> was <code>1.000230</code> I\'m ignoring it.</p>
                   <p><a href = "http://www.bankofcanada.ca/rates/related/inflation-calculator/">Canadian inflation</a> from 2012 to 2015: <code>1.0477</code></p>
                   <p>Proportion of US firms publically held by revenue in 2007 <a href = "https://www.sba.gov/sites/default/files/rs385tot_0.pdf">(page 11)</a>: <code>0.636</code> (used as an estimate for the proportion of the value of publically held Canadian firms).</p>'), 
     USA = HTML('<p>Share of GDI (gross domestic income) <a href = "https://research.stlouisfed.org/fred2/series/W269RE1A156NBEA">going to wages and salaries</a> in 2011: <code>0.443</code></p>
                <p>GDI in 2011 (billions of dollars): <code>15556.3</code><br>
                GDI in 2012 (billions of dollars): <code>16358.5</code><br>
                <a href = "https://research.stlouisfed.org/fred2/series/W269RE1A156NBEA">Source</a></p>
                <p><a href = "https://www.quandl.com/collections/economics/stock-market-capitalization-by-country">Price of publically traded stocks</a> in the USA, billions of 2012 dollars: <code>18668</code></p>
                <p>Proportion of US firms publically held by revenue in 2007 <a href = "https://www.sba.gov/sites/default/files/rs385tot_0.pdf">(page 11)</a>: <code>0.636</code></p>')
)
# This is
shinyServer(function(input, output) {
     # stateInput and sourcesInput ensure that when the user updates their state choice the UI updates too.
     stateInput <- reactive({
          switch(input$state,
                 "Canada" = 2016/ (926.2/1.0477),
                 "USA" = 18668/ (15556.3 * .443) )
     })
     sourcesInput <- reactive({
          switch(input$state,
                 "Canada" = 1,
                 "USA" = 2)
     })
     # These control how the output varies according to user choices.  
     output$publicControl <- renderText({
          stateInput() / (input$pct/100) /2
     })
     output$totalControl <- renderText({
          (stateInput() / 0.636) / (input$pct/100) /2
     })
     output$publicOwnership <- renderText({
          stateInput() / (input$pct/100) 
     })
     output$totalOwnership <- renderText({
          (stateInput() / 0.636) / (input$pct/100) 
     })
     output$sources <- renderText({
          sources[[sourcesInput()]]
     })
})