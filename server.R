library(shiny)

taxable <- function(inc, ins) max(inc - ins, 0)
fedtaxable <- function(taxnum, exe, ded) max(taxnum - exe*4000 - ded, 0)

taxbrackets <- c(18450, 74900, 151200, 230450, 411500, 464850)
taxrates <- c(0.1, 0.15, 0.25, 0.28, 0.33, 0.35, 0.396)
tax <- function(fed) {
      if(fed<taxbrackets[1]) fed * taxrates[1]
      else if (fed<taxbrackets[2]) taxbrackets[1]*taxrates[1]+(fed-taxbrackets[1])*taxrates[2]
      else if (fed<taxbrackets[3]) taxbrackets[1]*taxrates[1]+taxbrackets[2]*taxrates[2]+(fed-taxbrackets[2])*taxrates[3]
      else if (fed<taxbrackets[4]) taxbrackets[1]*taxrates[1]+taxbrackets[2]*taxrates[2]+taxbrackets[3]*taxrates[3]+(fed-taxbrackets[3])*taxrates[4]
      else if (fed<taxbrackets[5]) taxbrackets[1]*taxrates[1]+taxbrackets[2]*taxrates[2]+taxbrackets[3]*taxrates[3]+taxbrackets[4]*taxrates[4]+(fed-taxbrackets[4])*taxrates[5]
      else if (fed<taxbrackets[6]) taxbrackets[1]*taxrates[1]+taxbrackets[2]*taxrates[2]+taxbrackets[3]*taxrates[3]+taxbrackets[4]*taxrates[4]+taxbrackets[5]*taxrates[5]+(fed-taxbrackets[5])*taxrates[6]
      else taxbrackets[1]*taxrates[1]+taxbrackets[2]*taxrates[2]+taxbrackets[3]*taxrates[3]+taxbrackets[4]*taxrates[4]+taxbrackets[5]*taxrates[5]+taxbrackets[6]*taxrates[6]+(fed-taxbrackets[6])*taxrates[7]
      
}

shinyServer(
      function(input, output) {
            output$oid1 <- renderPrint({taxable(input$income,input$insurance)})           
            output$oid2 <- renderPrint({fedtaxable(taxable(input$income,input$insurance),input$exemptions,input$deductions)})
            output$tax <- renderPrint({tax(fedtaxable(taxable(input$income,input$insurance),input$exemptions,input$deductions))})
      }
      )