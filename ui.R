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
            tableOutput("dataTable")
        )
    )
))
