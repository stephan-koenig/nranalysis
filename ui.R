
# This is the user-interface definition of a Shiny web application.
#

library(shiny)

shinyUI(fluidPage(

  # Application title.
  titlePanel("The Shifting Meta"),

  # Sidebar layout.
  sidebarLayout(

    # Elements in left sidebar.
    sidebarPanel(

      # Slider for input.
      sliderInput("release",
                  "Release:",
                  min = 1,
                  max = length(releases),
                  step = 1,
                  value = length(releases),
                  animate = TRUE)
    ),

    # Elements in main (right) panel.
    mainPanel(

      # Tab layout for multiple planes of output.
      tabsetPanel(

        # Graph plane.
        tabPanel("Graph", plotOutput("meta_plot")),

        # Table plane.
        tabPanel("Table", dataTableOutput("meta_table")),

        # Instructions plane.
        tabPanel("Instructions", includeMarkdown("instructions.md"))

      )
    )
  )
))
