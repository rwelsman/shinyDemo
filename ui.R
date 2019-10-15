#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Motor Trend Cars Linear Regression on Miles Per Gallon"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("depVar",
                        "Dependent Variable",
                        c("Displacement (cu.in.)" = "disp",
                          "Gross horsepower" = "hp",
                          "Rear axle ratio" = "drat",
                          "Weight (1000 lbs)" = "wt",
                          "1/4 mile time" = 'qsec'))
        ),

        # Show the generated scatter plot with linear regression line
        mainPanel(
            plotOutput("scatterPlot"),
            h3("Regression Coefficients"),
            tableOutput("dataTable"),
            
            h3("This R Shiny demo runs linear regression on the built-in mtcars dataset."),  
            h3("Use the Dependent Variable pick list to choose which variable to use as the dependent variable."),
            h3("The independent variable will always be mpg (miles per gallon)."),
            h3(" "),
            h3("After making your selection in the pick list the following will happen:"),
            h3(" "),
            h3("   1.The scatter plot will change to display your chosen independent variable on the x-axis"),
            h3("   2.The linear regression line is plotted on the scatter chart"),
            h3("   3.The summary of the intercept and slope coefficients are shown in the table below the scatter chart"),
            h3(" "),
            h2("Have fun!")
        )
    )
))
