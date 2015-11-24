

fluidPage(
  # Application title
  titlePanel("Word Cloud for BullFinance Text Data"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
     
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 1000, value = 100),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 60,  value = 1)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)

