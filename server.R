
library(shiny)

shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    
     s <- input$start
     d <- input$deposit
     i <- input$interest/100
     y <- input$year 
     
    x <- 1:y
    y1 <- s+d*12*x
    y2 <- (s*(1+i/12)^(12*x)) + (d*(((1+i/12)^(12*x)-1) / (i/12)))
    
    plot(x = x, y = y1, xlab = "Number of Years", ylab = "Savings", col = 1 ,lwd = 2, type = "l",
         ylim = c(s/2, max(y2)))
    lines(x = x, y = y2, lwd = 2, col = 3)
    legend("topleft", legend = c("Without Interest","With Interest"), col = c(1,3),pch=1)
    
  })
  
  
  output$difference <- renderText({
     
     s <- input$start
     d <- input$deposit
     i <- input$interest/100
     y <- input$year
     
     diff <- (s*(1+i/12)^(12*y)) + (d*(((1+i/12)^(12*y)-1) / (i/12))) -
        (s+d*12*y)
     round(diff, 2)
     
     })
})
