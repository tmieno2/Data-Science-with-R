library(raster)
library(tidyverse)
library(sf)
library(tidycensus)
library(tigris)

#/*=================================================*/
#' # Read all the datasets
#/*=================================================*/
tmax_Jan_09 <- stack("./Data/tmax_Jan_09.tif")

states_ls <- fips_codes$state_name %>% 
  unique() %>% 
  as.list()

states_sf <- readRDS("./Data/state_boundary.rds")

#/*=================================================*/
#' # Define UI
#/*=================================================*/

ui <- fluidPage(

  titlePanel("Precipitation"),

  fluidRow(
    column(3, # spans 3 columns
      selectInput(
        "selected_state", 
        h3("Select State"), 
        choices = states_ls, 
        selected = states_ls[[1]]
      )
    ),
    column(9, # spans 9 columns
      plotOutput("gg_state")
    )
  )
) 

#/*=================================================*/
#' # Define the server
#/*=================================================*/
server <- function(input, output){

  output$gg_state <- renderPlot({

  state_fp <- fips_codes %>% 
    filter(state_name == input$selected_state) %>% 
    pull(state_code) %>% 
    unique()

  temp_state_sf <- states_sf %>%  
    filter(statefp == state_fp)

  ggplot() +
    geom_sf(data = temp_state_sf)

  })

}

#/*=================================================*/
#' # Shiny app
#/*=================================================*/
shinyApp(ui = ui, server = server)