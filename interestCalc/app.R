#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates interest
ui <- fluidPage(
  # Application title
  titlePanel(h1('Interest Calculator')),
  sidebarLayout(
    sidebarPanel(
      # Sidebar with a slider input for principle, interenst, and years 
      sliderInput('principle', 'Principle', min = 0, max = 5000, value = 0, sep = ',', pre = '$', step = 500),
      sliderInput('interest', 'Interest Rate Per Year', min = 0, max = 10, value = 0, post = '%', step = .1),
      sliderInput('years','Years', min = 1, max = 50, value = 1, step = 1)),
    # Show the interest earned with the preceeding input values
    mainPanel(
      h2('Move sliders to choose Principle, Interest Rate Per Year, and Years.'),
      h2('With the parameters chosen above, interest will be calculated and displayed below.'),
      h2('Interest Earned:'),
      h2(textOutput('text1')
         )
      )
    )
  )

# Define server logic required to calculate interest earned
server <- function(input, output) {
  output$text1 <- renderText({
    # calculate interest earned from input$principle, input$interest, and inpupt$years from ui.R
    paste('$',round(input$principle*exp((input$interest/100)*input$years)-input$principle,0))
  })
}

# Run the application
shinyApp(ui = ui, server = server)


