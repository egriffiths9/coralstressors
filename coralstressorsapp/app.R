library(shiny)
library(tidyverse)
library(bslib) #themes for shinyapp

#SETUP THE THEME - copied from lab last week we can change
my_theme <- bs_theme(
  bg = "rgba(170, 208, 243)", #copy and pasted from the theme preview
  fg = "purple",
  primary = "yellow",
  base_font = font_google("Times")
)

#bs_theme_preview() lets you use a style sheet to make it pretty
#another way to do this during lab week 3's video, making a css file










######USER INTERFACE########
ui <- fluidPage(theme = my_theme,
                navbarPage(
                  "App Title Here",






                  #MAP ONE - ELERI
                  tabPanel("Thing 1",  #tabs up at the top we can select between
                           sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                             sidebarPanel("Widgets",
                                          checkboxGroupInput(
                                            inputId = "pick_species", label = "Choose Species:",
                                            choices = unique(dataset$columnn_name)
                                          )
                             ), #end sidebarPanel
                             mainPanel("Output",
                                       plotOutput("plot_1")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                           ) #end sidebar layout
                  ), #end tabPanel("Thing 1")





































                  #GRAPHS - HEATHER
                  tabPanel("Thing 2",  #tabs up at the top we can select between
                           sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                             sidebarPanel("Widgets",
                                          checkboxGroupInput(   #check multiple items and change output (filter)
                                            inputId = "pick_species", label = "Choose Species:",
                                            choices = unique(dataset$columnn_name) #gives the options for the checkboxes
                                          )
                             ), #end sidebarPanel
                             mainPanel("Output",
                                       plotOutput("plot_1")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                           ) #end sidebar layout
                  ), #end tabPanel("Thing 2")





































                  #MAP TWO - MELISSA
                  tabPanel("Thing 3",  #tabs up at the top we can select between
                           sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                             sidebarPanel("Widgets",
                                          checkboxGroupInput(
                                            inputId = "pick_species", label = "Choose Species:",
                                            choices = unique(dataset$columnn_name)
                                          )
                             ), #end sidebarPanel
                             mainPanel("Output",
                                       plotOutput("plot_1")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                           ) #end sidebar layout
                  ), #end tabPanel("Thing 3")





































                  #BACKGROUND INFO - HEATHER
                  tabPanel("Thing 4")













                  #LEAVE THIS HERE TO END USER INTERFACE
                ) #end navbarPage()
) #end fluidPage(theme = my_theme)


########SERVER########
#input from user interface, output is getting passed back to user interface to run and show users
server <- function(input, output) {


  # MAP ONE REACTIVE - ELERI
  sw_reactive <- reactive((
    newdataframe <- data %>%
      filter(data_column %>% input$pickspecies) #from above
    return(newdataframe)
  ))

  output$plot_name <- #graph or map function like in R markdown here

    #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go








































  # GRAPHS REACTIVE - HEATHER
  graph_1 <- reactive((
    newdataframe2 <- data %>%
      filter(data_column %>% input$pickspecies) #what you specified above
    return(newdataframe2)
  ))

  output$plot_1 <- renderPlot(
    ggplot(data = graph_1(), aes( x = , y = )) + #data is from the reactive above
      geom_bar(aes(color = species))
  )

  #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go





































  # MAP TWO REACTIVE - MELISSA

  sw_reactive_2 <- reactive((
    newdataframe_2 <- data %>%
      filter(data_column %>% input$pickspecies) #from above
    return(newdataframe_2)
  ))

  output$plot_name <- #graph or map function like in R markdown here

    #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go







































  # LEAVE THIS HERE TO CLOSE SERVER PANEL
}

# LEAVE THIS HERE TO RUN THE APPLICATION
shinyApp(ui = ui, server = server)
