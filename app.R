library(shiny)
library(DBI)
library(ggplot2)
library(lubridate)
library(rsconnect)
deployApp()
pool <- dbPool(
  drv = Postgres(),
  dbname = "Mydatabase",
  host = "127.0.0.1",
  port = 5432,
  user = "postgres",
  password = "0823"
)

# Define UI
ui <- fluidPage(
  titlePanel("GDP Rate After Earthquake"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("place", "Select Country:",
                  choices = c("Japan", "Taiwan", "Mexico", "Philippines", 
                              "New Zealand", "Chile", "Bolivia", "Turkey",
                              "Russia", "Pakistan", "Peru", "Indonesia",
                              "Fiji", "United States", "Iran", "China")),
      sliderInput("year", "Select Year:",
                  min = 1990, max = 2023, value = 2010)
    ),
    
    mainPanel(
      plotOutput("gdp_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression for earthquake data filtered by country and year
  eq_data <- reactive({
    query <- sprintf("SELECT * FROM earthquake WHERE place = '%s' AND extract(year from date) = %s", 
                     input$place, input$year)
    eq_data <- dbGetQuery(pool, query)
    return(eq_data)
  })
  
  # Reactive expression for GDP data one year after earthquake
  gdp_data <- reactive({
    if (nrow(eq_data()) > 0) {
      date_one_year_after <- as.Date(eq_data()$date) %m+% years(1)
      query <- sprintf("SELECT * FROM gdp WHERE place = '%s'", input$place)
      gdp_data <- dbGetQuery(pool, query)
      if (nrow(gdp_data) > 0) {
        if (!is.na(eq_data()$date)) {
          gdp_data <- gdp_data[gdp_data$date >= date_one_year_after & gdp_data$date <= as.Date(eq_data()$date) %m+% years(5),]
        } else {
          gdp_data <- NULL
        }
      }
      return(gdp_data)
    } else {
      query <- sprintf("SELECT * FROM gdp WHERE place = '%s'", input$place)
      gdp_data <- dbGetQuery(pool, query)
      return(gdp_data)
    }
  })
  
  # Render plot
  output$gdp_plot <- renderPlot({
    if (!is.null(eq_data())) {
      earthquake_date <- format(as.Date(eq_data()$date), "%Y")
      subtitle <- paste("Earthquake Date:", earthquake_date)
    } else {
      subtitle <- ""
    }
    if (!is.null(gdp_data())) {
      ggplot(data = gdp_data(), aes(x = date, y = gdprate)) +
        geom_line() +
        labs(title = paste("GDP Rate After Earthquake in", input$place),
             subtitle = subtitle,
             x = "Date", y = "GDP Rate")
    } else {
      ggplot() + labs(title = paste("No GDP Data Available for", input$place))
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)


