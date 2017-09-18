library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting child height from Galton's height data"),
  
  # Sidebar with a slider input for mid-parent height 
  sidebarLayout(
    sidebarPanel(
      h3("Enter the mid-parent height"),
      sliderInput("parent_height",
                  " ",
                  min = 62,
                  max = 74,
                  value = 70)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Predicted child height"),
      p("This plot shows the predicted child height given the mid-parent height, using a model derived from Galton's height data. The blue line represents the prediction interval. The scatterplot shows the parent/child pairs in Galton's dataset."),
      plotOutput("scatterPlot")
    )
  )
))
