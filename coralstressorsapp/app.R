library(shiny)
library(tidyverse)
library(bslib) #themes for shinyapp



#SETUP THE THEME - copied from lab last week we can change
my_theme <- bs_theme(
  bg = "rgba(170, 208, 243)", #copy and pasted from the theme preview, background
  fg = "blue", #
  primary = "black",
  base_font = font_google("Arial")
)

#bs_theme_preview() lets you use a style sheet to make it pretty
#another way to do this during lab week 3's video, making a css file

#datasets?
top10_species <- corals_info %>%
  filter(species == c("acanthastrea brevis", "acanthastrea echinata", "acanthastrea hemprichii")) %>%  #change these later depending on what species we want
  return(top10_species)







######USER INTERFACE########
ui <- fluidPage(theme = my_theme,
                navbarPage(
                  "Coral Vulnerability to Stressors",






                  #MAP ONE - ELERI
               #   tabPanel("Thing 1",  #tabs up at the top we can select between
                #           sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                 #            sidebarPanel("Widgets",
                  #                        checkboxGroupInput(
                   #                         inputId = "pick_species", label = "Choose Species:",
                       #                     choices = unique(dataset$columnn_name)
                        #                  )
                         #    ), #end sidebarPanel
                          #   mainPanel("Output",
                           #            plotOutput("plot_1")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                          # ) #end sidebar layout
             #     ), #end tabPanel("Thing 1")





































#GRAPHS - HEATHER
                  tabPanel("Species Vulnerability Graphs",  #tabs up at the top we can select between
                           sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                             sidebarPanel("Widgets",
                                         selectInput(
                                            inputId = "pick_species", label = "Choose Species:",  #what goes in the input id?
                                            choices = unique(top10_species$species) #gives the options for the checkboxes
                                          )
                             ), #end sidebarPanel
                             mainPanel("Output",
                                       plotOutput("species_graph")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                           ) #end sidebar layout
                  ), #end tabPanel("Thing 2")

                 # tabPanel("Stressor Graphs",
                          # sidebarLayout(
                          #   sidebarPanel("Widgets",
                                    #      selectInput(
                                        #    inputID = "pick_stressor", label = "Choose Stressor:",
                                         #   choices = unique(top10_species$stressor)
                                     #     )
                          #    ) #end sidebar panel
                        #   ) #end sidebar layout
                      #  ), #end tabPanel





































                  #MAP TWO - MELISSA
             #     tabPanel("Thing 4",  #tabs up at the top we can select between
                       #    sidebarLayout( #creates a page that has a sidebar on one side that we can put widgets/explanations on one side, and then a larger panel on the right for graph/map
                         #    sidebarPanel("Widgets",
                                     #     checkboxGroupInput(
                                      #      inputId = "pick_species", label = "Choose Species:",
                                        #    choices = unique(dataset$columnn_name)
                                    #      )
                        #     ), #end sidebarPanel
                         #    mainPanel("Output",
                        #               plotOutput("plot_1")) #call your graph or thing from below here, this line of code comes from what you called your plot in output$plot below in the server
                         #  ) #end sidebar layout
                #  ), #end tabPanel("Thing 4")





































                  #BACKGROUND INFO - HEATHER
                  tabPanel("Thing 5")













#LEAVE THIS HERE TO END USER INTERFACE
                ) #end navbarPage()
) #end fluidPage(theme = my_theme)


########SERVER########
#input from user interface, output is getting passed back to user interface to run and show users
server <- function(input, output) {


  # MAP ONE REACTIVE - ELERI
  #sw_reactive <- reactive((
    #data %>%
      #filter(data_column %>% input$pick_species)  #from above
    #return(newdataframe)
  #))

  #output$plot_name <- #graph or map function like in R markdown here

    #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go








































  # GRAPHS REACTIVE - HEATHER
  graph_byspecies <- reactive((
    top10_species %>%
     filter(species == input$pick_species) #change these later depending on what species we want
  ))

  output$species_graph <- renderPlot(
    ggplot(data = graph_byspecies(), aes(x = stressor, y = vuln)) +
      geom_bar(aes(color = species)))

 # output$stressor_graph <- renderPlot(
  #  ggplot(data = graph_byspecies(), aes(x = species, y = vuln) +
   #   geom_bar(aes(color = stressor))
 # )
#  )

  #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go





































  # MAP TWO REACTIVE - MELISSA

  #sw_reactive_2 <- reactive((

 # ))

  #output$plot_name <- #graph or map function like in R markdown here

    #now we need to tell user interface where to put the plot we created. go back up to UI and show where you want it to go







































  # LEAVE THIS HERE TO CLOSE SERVER PANEL
}

# LEAVE THIS HERE TO RUN THE APPLICATION
shinyApp(ui = ui, server = server)
