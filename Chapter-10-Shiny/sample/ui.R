library(shiny)

shinyUI(fluidPage(
  theme = "bootstrap.css",
  titlePanel("Break-even Acres"),

  fluidRow(
    column(
      3,
      wellPanel(
        sliderInput("P_c", "Corn Price ($/bushel)",
          value = 3.65, step = 0.05, min = 0, max = 10
        )
      ),
      # wellPanel(
      #   numericInput("P_n","N Price ($/lb)",
      #               value = 0.65, min = 0, max = 2)
      #   ),
      wellPanel(
        sliderInput("P_n", "N Price ($/lb)",
          value = 0.65, step = 0.05, min = 0, max = 10
        )
      ),
      # wellPanel(
      #   numericInput("acres","Total Field Size (acres)",
      #               value = 130, min = 1, max = 5000)
      #   ),
      wellPanel(
        numericInput("Y_d", "Yield Differential (bushel)",
          value = -5, min = 0, max = 5000
        )
      ),
      wellPanel(
        numericInput("N_d", "N Differential (lb)",
          value = -42, min = 0, max = 5000
        )
      ),
      wellPanel(
        numericInput("init_I", "Equipment Cost ($)",
          value = 13400, min = 0, max = 30000
        )
      ),
      wellPanel(
        sliderInput("resale_rate", "Resale Rate (%)",
          value = 10, step = 5, min = 0, max = 100
        )
      )
      # wellPanel(
      #   numericInput("period","Equipment Use Period (years)",
      #               value = 6, min = 1, max = 10)
      #   ),
      # Action button for running another simulation
      # wellPanel(
      #   actionButton("runButton", "Run Analysis")
      #   )
    ),
    column(
      9,
      plotOutput("distPlot")
    )
  )
))
