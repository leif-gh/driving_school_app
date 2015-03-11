library(shiny)
# Define UI
shinyUI(navbarPage("Driving School",
    tabPanel("Hazards",
       fixedRow(
         column(12,
                " ",
                h1("Driving School", align = "center"),
                h2("  ", align = "center"),
                img(src = "Signspng.png", height = 183, width = 375, 
                    style="display: block; margin-left: auto; margin-right: auto;"),
       fixedRow(
        column(12,
                " ",
                h2("Danger on the road!", align = "center"),
                h3("Be aware - Learn more", align = "center")                   
                  )
                )
         )
       )  
      ),
    tabPanel("Hazard statistics",
      fixedRow(
        column(12,
               "Source: http://www.viltolycka.se/",
               h1("Something to worry about?", align = "center"),
               fixedRow(
                 column(5,
                        " ",
                        h3("Statistics 2014 for Sweden", align = "left"),
                        #img(src = "Signspng.png", height = 183, width = 375),
                        h6("", align = "center"),
                        img(src = "Incidentpng.png", height = 183, width = 375),
                        selectInput("select", label = h3("Select hazard."), 
                                    choices = list("Moose" = 1, "Wild Boar" = 2,
                                                   "Venison" = 3), selected = 1)
                 ),
                 column(7,
                        " ",
                        h3(htmlOutput("text1"), align = "center"),
                        
                        plotOutput("distPlot"),
                        
                        h4(textOutput("text2"), align = "center"),
                        
                        h2("\n", align = "center"),
                        h4("Highest risk in morning hours and evening/night.", align = "center")                       
                 )
               )
        )
      )                                 
      ),          
    tabPanel("Awareness training",
             fixedRow(
               column(12,
                      " ",
                      h1("Awereness training - Stopping distance", align = "center"),
                      fixedRow(
                        column(4,
                               " ",
                               selectInput("selectr", label = h3("Are you alert? Reaction time.",
                                                                 style = "color:blue"), 
                                           choices = list("1 second" = 1, "2 seconds" = 2,
                                                          "3 seconds" = 3), selected = 1),
                               h6(" ", align = "center"),
                               selectInput("selectc", label = h3("Are you aware of road condition?", 
                                                                 style = "color:brown"), 
                                           choices = list("Dry asphalt" = 1, "Wet asphalt" = 2,
                                                          "Loose snow" = 3, "Packed snow/ice" = 4,
                                                          "Wet ice" = 5), selected = 1),

                               h6(" ", align = "center"),
                               selectInput("selects", label = h3("Speed adjusted for road condition?",
                                                                 style = "color:red"), 
                                           choices = list("30 km/h" = 1, "50 km/h" = 2,
                                                          "70 km/h" = 3, "90 km/h" = 4,
                                                          "110 km/h" = 5), selected = 3)
                               
                        ),
                        column(8,
                               " ",
                                 h3(htmlOutput("text10"), align = "center"),

                                 h3("Total stopping distance", align = "center", style = "color:red"),
                                 plotOutput("distPlot10")
                        )
                      )
               )
             )                                                  
             ),
    tabPanel("Evasive action",
             fixedRow(
               column(12,
                      " ",
                      h1("You also need evasive action skills", align = "center"),
                      h2("  ", align = "center"),
                      img(src = "Incidentpng.png", height = 183, width = 375, 
                          style="display: block; margin-left: auto; margin-right: auto;"),
                      fixedRow(
                        column(12,
                               " ",
                               h2("Contact your local driving school!", align = "center"),
                               h3("Be aware - Be alert!", align = "center")                   
                        )
                      )
               )
             )  
    )    
    
))


