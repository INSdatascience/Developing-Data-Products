
library(shiny)

shinyUI(fluidPage(
  
  
  titlePanel("The Power of Compound Interest"),
 
  sidebarLayout(
    sidebarPanel(
       h2("Starting Values"),
       h4("How much money are we starting with?"),
       numericInput("start",
                   "First Deposit:",
                   min = 1000,
                   max = 10000,
                   value = 5000,
                   step = 1000),
       h4("How much money are we adding per month?"),
       numericInput("deposit",
                    "Subsequent Deposits:",
                    min = 50,
                    max = 300,
                    value = 100,
                    step = 20),
       h2("Growth"),
       sliderInput("interest",
                   "Yearly Interest Rate, compounded monthly:",
                   min = 1,
                   max = 10,
                   value = 5),
       sliderInput("year",
                   "Number of years:",
                   min = 5,
                   max = 90,
                   value = 45)
    ),
    
    # Show a plot
    mainPanel(
       h1("Evolution of Savings"),
       plotOutput("plot"),
       h4("Difference in money generated :"),
       textOutput("difference")
    )
  )
))
