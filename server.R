
# This is the server logic for a Shiny web application.
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  # Enclose R object that is reactive but used by multiple render functions
  # in reactive function. The object is a function, so include () at end.
  filtered <- reactive({
    # Filter data set based oninput$release from ui.R.
    filtered <- combined %>%
      filter(release == releases[input$release])
  })

  # Save rendered objects (here renderPlot) to display to output$.
  # Use {} to group code inside render*().
  output$meta_plot <- renderPlot({

    # Draw XY graph. filtered is a reactive function, thus ().
    ggplot(filtered(), aes(runner_id, corp_id,
                       size = matchup_freq,
                       colour = corp_wins_percent)) +
      geom_point(alpha = 0.8, na.rm = TRUE) +
      scale_size_area(limits = c(0,10),
                      name = "Matchup freq [%]") +
      labs(title = releases[input$release],
           x = "Runner", y = "Corp") +
      scale_colour_gradient2(low = "Red", high = "Blue", mid = "grey97",
                             midpoint = 50, na.value = "grey95",
                             limits = c(0,100),
                             name = "Corp win [%]") +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            axis.ticks = element_blank(),
            panel.background = element_blank(),
            panel.border = element_blank(),
            panel.grid.major = element_line(colour = "grey95"),
            legend.key = element_rect(colour = NA)) +
      guides(colour = guide_legend(override.aes = list(alpha = 0.8)))

  })

  output$meta_table <- renderDataTable({
    filtered()  %>%
      mutate(corp_wins_percent = round(corp_wins_percent, digits = 1),
             matchup_freq = round(matchup_freq, digits = 1)) %>%
      select("Corp" = corp_id,
             "Runner" = runner_id,
             "Corp wins [%]" = corp_wins_percent,
             "Matchup freq [%]" = matchup_freq,
             "# Games" = matchup_games)
    })

})
