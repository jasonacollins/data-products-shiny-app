library(shiny)
library(psych)
library(ggplot2)

shinyServer(function(input, output) {
  output$scatterPlot <- renderPlot({
    
    # generate model of child height and predictions
    model1 <- lm(child ~ parent, data=galton)
    parent_height <- input$parent_height
    predictChild <- predict(model1, newdata=data.frame(parent=parent_height), interval="prediction")
    predInterval <- as.data.frame(t(rbind(rep(parent_height, 3), predictChild)))
    colnames(predInterval) <- c("parent_height", "child_height")
    
    # draw plot
    ggplot(galton, aes(x=parent, y=child)) +
      coord_cartesian(xlim = c(62, 74)) +
      geom_point(shape=1) +
      geom_smooth(method=lm) +
      geom_point(data=predInterval, aes(x=parent_height, y=child_height, size=8, color=c("blue", "red", "red"), shape=c(16, 95, 95))) +
      geom_linerange(aes(x=parent_height, ymin=predictChild[2], ymax=predictChild[3]), color="blue") +
      scale_shape_identity() +
      guides(color = FALSE, size = FALSE) +
      labs(x = "Mid parent height", y = "Child height")
    
  })
})
