library(shiny)

shinyUI(pageWithSidebar(
      headerPanel("US Tax Calculator (married filed jointly)"),
      sidebarPanel(
            numericInput('income','Household Income (USD)', 40000, min=0, max=10000000),
            numericInput('insurance','Total pre-tax deductions (like insurance and/or retirement account contributions)', 3000, min=0, max=50000),
            numericInput('exemptions','Exemptions (number of people in household)', 2, min=2, max=15, step=1),
            numericInput('deductions','Deduction (leave at $12,600 for standard deduction)', 12600, min=12600, max=100000),
            submitButton('Submit')
      ),
      mainPanel(
            h3('Tax Amount'),
            h4('Your adjusted gross income'),
            verbatimTextOutput("oid1"),
            h4('Your federal taxable income'),
            verbatimTextOutput("oid2"),
            h4('Your federal tax amount'),
            verbatimTextOutput("tax")
      )
))