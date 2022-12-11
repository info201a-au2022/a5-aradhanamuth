#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(plotly)
library(ggplot2)
c_chart <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")




# scatterPlot_chart <- reactive({
#   needed_data <- c_chart %>%
#     filter(country %in% input$country)
# 
#   ggplot(c_chart, aes(x=coal_co2, y=oil_co2)) +
#     geom_point() +
#     labs(x = "C02 coal emissions",
#          y = "C02 oil emissions ",
#          title = paste("Coal and Oil Emissions", input$country))
# })
# 
# output$scatterPlot_chart <- renderPrint({
#   scatterPlot_chart()
# })

 
shinyServer(function(input, output) {

  scatterPlot_chart <- reactive({
    needed_data <- c_chart %>%
      filter(country %in% input$country)
    
    
    
    
    ggplot(c_chart, aes(x=coal_co2, y=oil_co2)) +
      geom_point() +
      labs(x = "C02 coal emissions",
           y = "C02 oil emissions ",
           title = paste("Coal and Oil Emissions", input$country))
    


  })

  output$scatterPlot_chart <- renderPlot({
    scatterPlot_chart
    
    
    
    #select box
    function(input, output) {
      
     
      output$value <- renderPlot({ input$inputbox })
      
    }
    
    
    
    #slide bar
    function(input, output) {
      
    
      output$value <- renderPlot({ input$Coal })
      
     
      output$range <- renderPlot({ input$Oil})
    }

  })

})






# which country has the highest oil emissions
highest_oil_emission <- c_chart %>%
  filter(oil_co2 == max(oil_co2, na.rm = TRUE)) %>%
  pull(country)
#(World)

# which country has the highest coal emissions 
highest_coal_emission <- c_chart %>%
  filter(coal_co2 == max(coal_co2, na.rm = TRUE))%>%
  pull(country)
#(World)

# which country has least energy production

lowest_energy_production <- c_chart %>%
  filter(energy_per_capita == max(energy_per_capita, na.rm = TRUE)) %>%
  pull(country)
#United States Virgin Islands


# #coal_emissions <-
# c_chart %>%
#   summarize(energy_per_capita = mean(energy_per_capita)) %>%
#   pull(energy_per_capita)
# (NA)



# c_chart <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
# 
# scatterplot <- ggplot(data=c_chart, aes(x=coal_co2, y=oil_co2))+
#   geom_point()
# 
# scatterplot + labs(title = "Coal vs Oil")

















