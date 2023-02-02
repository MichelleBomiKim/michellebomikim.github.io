#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Albums Selling"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("Name of Albums",
                        "Number of Selling",
                        min = ,
                        max = 3000000,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
        
      output$scatterplot <- renderPlot({
       p = ggplot(data = "Seventeen_album_data" ) +
          aes_string(x = input$x, y = input$y) +
          geom_point()
       plot(p)
       observeEvent(input$update, print(as.numeric(input$update)))
      })
}

       

# Run the application 
shinyApp(ui = ui, server = server)
