#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(gapminder)
library(ggplot2)
library(shiny)
library(gganimate)
library(dplyr)
library(ggthemes)
theme_set(theme_bw())

ui <- basicPage(
  imageOutput(""))

server <- function(input, output) {
  output$HIPCPI <- renderImage({
    # A temp file to save the output.
    # This file will be removed later by renderImage
    outfile <- tempfile(fileext='.gif')
    
    # now make the animation
    ggplot(aes(x = date, 
               y = HIPCPI,
               color = CPI)) +
      geom_line() +
      labs(title = "hwaii", 
           x = "",
           y = "",
           color = "CPI") +
      theme(legend.position = "top",
            legend.title = element_blank()) +
      transition_reveal(date)
     # New
    
    # Return a list containing the filename
    list(src = "outfile.gif",
         contentType = 'image/gif'
         # width = 400,
         # height = 300,
         # alt = "This is alternate text"
    )}, deleteFile = TRUE)}

shinyApp(ui, server)