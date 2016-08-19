
# Variables for both, user-interface definition and server logic of a Shiny web
# application.
#

library(dplyr)

load("combined.RData")
releases <- levels(combined$release)

# Note: Refactor, so color for each ID is determined automatically.
runnercolors <- c("orange", "orange", "orange", "orange", "blue", "blue",
                  "blue","blue", "blue", "blue", "blue", "green", "green",
                  "green", "green", "green", "green", "green")
corpcolors <- c("purple", "purple", "purple", "purple", "purple", "purple",
                "purple", "red", "red", "red", "red", "red", "red", "gold",
                "gold", "gold", "darkgreen", "darkgreen", "darkgreen",
                "darkgreen")
