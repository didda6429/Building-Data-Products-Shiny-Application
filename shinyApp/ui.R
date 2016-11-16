#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI calculator"),
             sidebarLayout(
               sidebarPanel(
                 numericInput("weight", "Weight:",0),
                 numericInput("height", "Height:",0),
                 selectInput("units", "Units:",
                             choices=c("Metric (Kg/m)","Imperial (lb/in)"),
                             selected="Metric (Kg/m)")
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("BMI Calculator",
                            h1(textOutput("overweight")),
                            h4(textOutput("bmi"))),
                   tabPanel("Help",
                            h4("This app calculates a persons BMI to determine if they are overweight or underweight."),
                            h4("To use the app, select your units and input your height and weight. the BMI will automatically
                              be calculated."))
                 )
               )
             )
)
)
