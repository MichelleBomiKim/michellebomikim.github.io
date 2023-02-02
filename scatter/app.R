#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require("tidyverse")
require("shiny")
# Loading datasets



mpgdf <- ggplot2::mpg
diam <- ggplot2::diamonds
econ <- ggplot2::economics



# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Some ggplot2 Datasets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Text for providing a caption ----
      textInput(inputId = "caption",
                label = "Caption:",
                value = "Datasets"),
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Select a chart:",
                  choices = c("Vehicles", "Diamonds", "Economics"))
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption", container = span)),
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),
      
      # Output: The graph in question ----
      plotOutput("SelectedPlot")
    )
  )
)



# Define server logic to summarize and view selected dataset ----
server <- function(input, output, session) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "Vehicles" =mpgdf,
           "Diamonds"=diam,
           "Economics"=econ)
  })
  PlotInput <- reactive({
    switch(input$dataset,
           "Vehicles" = carchart(),
           "Diamonds" = diamchart(),
           "Economics"= econchart())
  })
  
  # Create caption ----
  output$caption <- renderText({
    input$caption
  })
  
  # Create summary statistics
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  carchart <- reactive ({
    dataset <- datasetInput()
    ggplot(data = dataset, aes(y = manufacturer)) +
      geom_bar(fill = "slategray3") +
      facet_wrap(vars(drv),
                 labeller = as_labeller(c("4"= "Four-Wheel Drive",
                                          f= "Front-Wheel Drive",
                                          r= "Rear-Wheel Drive"))) +
      labs(x = "Count", y = "Make", title = "Vehicles by Drivetrain") +
      theme_bw() +
      theme(
        strip.background = element_rect(
          color = "midnightblue", fill = "azure", linetype="solid")
      )
  })
  diamchart <- reactive ({
    dataset <- datasetInput()
    ggplot(data = dataset, aes(x = cut, y = price, fill = color,
    )) +
      coord_cartesian(ylim = c(15000, 19000)) +
      geom_col(position = "dodge") +
      labs(x = "Cut", y = "Price",
           title = "Diamond Prices by Cut and Color", fill = "Colors") +
      theme_bw()
  })
  econchart <- reactive ({
    dataset <- datasetInput()
    ss <- subset(dataset, date>as.Date("1967-12-30")&date<as.Date("1969-1-1"))
    ggplot(data = ss, aes(x = date, y = unemploy)) +
      geom_area(fill = "violet", alpha = 0.5) +
      coord_polar() +
      labs(x = "Date", y = "Unemployed (thousands)",
           title = "Unemployed Population in 1968") +
      theme_bw()
  })
  
  output$SelectedPlot <- renderPlot({
    PlotInput()
  })
}



# Create Shiny app ----
shinyApp(ui, server)

