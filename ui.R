
# This is the user-interface definition of a Shiny web application.
#

library(shiny)

shinyUI(fluidPage(

  # Application title.
  titlePanel("The Shifting Meta"),

  # Show a plot of the generated distribution
  mainPanel(
    # Display output$NAME defined in server.R.
    plotOutput("meta_plot", width = "800px", height = "600px"),

    dataTableOutput("meta_table"),

    # Slider input to select release.
    fluidRow(
      column(12, align="center",
             sliderInput("release",
                         "Release:",
                         min = 1,
                         max = length(releases),
                         step = 1,
                         value = length(releases),
                         animate = TRUE)
      )
    ),

    includeMarkdown("instructions.md")
  )
))
