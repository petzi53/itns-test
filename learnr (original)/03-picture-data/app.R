library(shiny)
library(tidyverse)

df_laptop <- read_csv("Describe_Laptop.csv")

# Define UI for app that draws a histogram ----
ui <- fluidPage(

    # App title ----
    titlePanel("Frequency Histogram"),



    # Input: Slider for the number of bins ----
    sliderInput(inputId = "bins",
                label = "Number of bins:",
                min = 1,
                max = 20,
                value = 9),


    # Output: Histogram ----
    plotOutput(outputId = "distPlot")

)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

    # Histogram of the Old Faithful Geyser Data ----
    # with requested number of bins
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$bins) change
    # 2. Its output type is a plot
    output$distPlot <- renderPlot({

        x    <- df_laptop$`Transcription%`
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        hist(x, breaks = bins, col = "#75AADB", border = "white",
             xlab = "X (Transcription in %)",
             main = "Frequency histogram of verbatim transcription data in percent,
             for the laptop group, with N = 31,
             from Study 1 of Muellerand Oppenheimer (2014)")

    })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
