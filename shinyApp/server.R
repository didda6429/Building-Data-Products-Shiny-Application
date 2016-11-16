#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$overweight <- renderText({
    validate(
      need(input$weight>0&input$height>0, "Please input a valid height and weight")
    )
    if(input$weight>0 & input$height>0){
      if(input$units=="Metric (Kg/m)"){
        bmi <- input$weight/(input$height^2)
      } else {
        bmi <- (input$weight/(input$height^2))*703
      }
    }
    if(bmi<18.5){
      status <- "Underweight"
    } else if(bmi <25){
      status <- "Normal"
    } else if(bmi<29){
      status <- "Overweight"
    } else if(bmi>29){
      status <- "Obese"
    }
    status <- c("You are ",status)
    status
  })
  
  output$bmi <- renderText({
    validate(
      need(input$weight>0&input$height>0, "Please input a valid height and weight")
    )
    if(input$weight>0 & input$height>0){
      if(input$units=="Metric (Kg/m)"){
        bmi <- input$weight/(input$height^2)
      } else {
        bmi <- (input$weight/(input$height^2))*703
      }
    }
    bmi
    bmi <- c("You're BMI is ", bmi)
  })
  
})
