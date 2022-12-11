#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




c_chart <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")



library(shiny)

shinyUI(fluidPage(
  tabPanel("Chart Page",  titlePanel("Coal and Oil Emissions Within Countries ")),
         
         
         # Sidebar with a slider input for number of bins
         sidebarLayout(
           sidebarPanel(
             plotOutput("selectcountry"),
             p("The scatter plot shows the countries that use coal and oil emissions to use for energy. Through the graph you can tell the amount of countries that use these on the daily. You can see the comparison between both fuels as well.  ")
             
           ),
           
           # Show a plot of the generated distribution
           mainPanel(
             plotOutput("scatterPlot_chart")
             #textOutput("sampleText")
           ),
           
           
           
           fluidPage(
             
             # select box widget
             selectInput("inputbox", label = h3("Type of Emission"), 
                         choices = list("Coal" = 1, "Oil" = 2, "Energy" = 3), 
                         selected = 1),
             
             hr(),
             fluidRow(column(3, verbatimTextOutput("value"))),
             
             
             
             
             #slide bar widget
             fluidPage(
               fluidRow(
                 column(4,
                        
                        
                        sliderInput("Coal", label = h3("Coal Emission"), min = 0, 
                                    max = 15000, value = 2500)
                 ),
                 column(4,
                        
                       
                        sliderInput("Oil", label = h3("Oil Emission"), min = 0, 
                                    max = 12000, value = c(2500))
                 )
               ),
               
               hr(),
               
               fluidRow(
                 column(4, verbatimTextOutput("value")),
                 column(4, verbatimTextOutput("range")),
                 
                 
                 #intro page
                 
                 page1 <- paste( ), 
                 
                 first_page<- tabPanel(
                   "Introduction",
                   fluidRow(
                     
                     
                     column(
                       8,
                       h1("Within looking at this dataset I was able to analyze certain fossil fuels and its affects on each country. In addition get a better understanding upon more common fuels and which countries use them. Digging deeper I was able to compare and contrast coal, oil and energy usage within the countries listed in the data set. In my first question I analyzed was which country has the highest coal emission. I was able to find it was the country World and they had the most emissions within that fuel. It was also interesting to see though that in my second question I found the highest oil emission and it was the country World again. I was able to learn that World must be a country within the dataset that relies heavily on fossil fuels and depends on it for their industry and economy. In comparison I wanted to look upon the lowest energy emission country and found it was United State Virgin Islands. I was able to inference from this that the U.S Virgin Islands probably was a smaller land and not as developed therefore indicating the least amount of energy produced. Through these questions I was able to learn which countries depend on certain energies the most and how that factors into the size of the country as well. "),
                       p(page1),
                       tags$small(
                       )
                     )
                   )
                 )
               )
               
             )
           )
         )) 
  
)