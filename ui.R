
# This is the user-interface definition of a Shiny web application.
#

library(shiny)

shinyUI(fluidPage(

  # Application title.
  titlePanel("The Shifting Meta"),

  # Choose layout with sidebar
  sidebarLayout(

    sidebarPanel(
      sliderInput("release",
                  "Release:",
                  min = 1,
                  max = length(releases),
                  step = 1,
                  value = length(releases),
                  animate = TRUE)
    ),

    mainPanel(
      tabsetPanel(

        # Display output$NAME defined in server.R.
        tabPanel("Graph", plotOutput("meta_plot")),

        tabPanel("Table", dataTableOutput("meta_table")),

        # Slider input to select release.

        tabPanel("Instructions", includeMarkdown("instructions.md"))

      )
    )
  )
))
