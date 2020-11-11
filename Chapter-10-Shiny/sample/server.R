library(shiny)
library(ggplot2)
library(ggthemes)
library(grid)
library(extrafont)
library(data.table)
library(dplyr)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    input$runButton # re-run if re-run button is hit
    P_c <- input$P_c # corn price
    P_n <- input$P_n # N price
    Y_d <- input$Y_d # Yield Dif
    N_d <- input$N_d # N dif
    # acres <- input$acres # N dif
    init_I <- input$init_I 
    resale_rate <- input$resale_rate/100 
    period <- input$period 
    dep_period <- seq(3,6,by=1)

    cost_dif <- P_n*N_d
    rev_dif <- P_c*Y_d
    prof_dif <- rev_dif - cost_dif

    break_even_acres <- init_I*(1-resale_rate)/prof_dif/dep_period 
    # profit <- prof_dif*acres*dep_period-init_I*(1-resale_rate)

    #===================================
    # Plot
    #===================================
    data <- data.table(period=dep_period,be_acres=break_even_acres)
    ggplot(data=data,aes(x=factor(period),y=be_acres)) + 
      geom_bar(stat='identity') +
      xlab('Equipment Replacement Cycle (years)') +
      ylab('Brake-even Acres (acres)') 

    # ggplot(data=data,aes(x=factor(period),y=profit)) + 
    #   geom_bar(stat='identity') +
    #   xlab('Equipment Replacement Cycle (years)') +
    #   ylab('Brake-even Acres (acres)') 

    
  })
  
})
