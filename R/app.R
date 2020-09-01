library(flexdashboard)
library(shiny)

ui <- fluidPage(
  includeHTML("dashboard")
)

server <- function(input, output, session) {
  source("")
}

rmarkdown::run("learning_tidyselect/learning_tidyselect.Rmd")

