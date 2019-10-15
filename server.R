#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a scatter plot with linear regression line
shinyServer(function(input, output) {

    output$scatterPlot <- renderPlot({

        # generate scatter plot with linear regression line
        g <- ggplot(mtcars, aes_string(x=input$depVar, y="mpg")) + geom_point() + geom_smooth(method=lm)
        g

    })
    
    output$dataTable <- renderTable({
        model <- lm(reformulate(c("mpg"), input$depVar),mtcars)
        temp <- cbind(c("Intercept",input$depVar),summary(model)$coefficients)
        colnames(temp)[1] <- c("Coefficient")
        temp
    })

})
