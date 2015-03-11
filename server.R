library(shiny)
library(xlsx)

# Define server logic
shinyServer(function(input, output) {
  a <- read.xlsx("data_game_14.xlsx", sheetIndex = 1)

########### Tab - Danger statistics ##################################
  game <- c("Moose", "Wild Boar", "Venison")
  color <- c("red", "blue", "green")
  
  output$text1 <- renderUI({ 
        div(paste("Accidents with ", game[as.numeric(input$select)]), 
            style = paste("color:", color[as.numeric(input$select)]))
   })
  
  output$distPlot <- renderPlot({
      barplot(a[, as.numeric(input$select) + 1], names = a$"Month", 
        col = color[as.numeric(input$select)], border = "black",
        xlab = "Month", ylab = "Number of accidents",
        cex.axis = 1.4, cex.names = 1.2, cex.lab = 1.4,
        main = "")    #game[as.numeric(input$select)])
   })

  output$text2 <- renderText({ 
    if (as.numeric(input$select) == 3) {
      paste(game[as.numeric(input$select)], ": One accident every quarter of an hour the year around!") }      
    else {
      if (as.numeric(input$select) == 1) {
      paste(game[as.numeric(input$select)], ": One accident every second hour the year around!") }
      else {
        if (as.numeric(input$select) == 2) 
          paste(game[as.numeric(input$select)], ": One accident every second hour the year around!") }}    
    })
  
################# TAB - Awareness #######################
  reaction <- c("1 second", "2 seconds", "3 seconds")
  reaction_time <- c(1, 2, 3)
  road <- c("Dry asphalt", "Wet asphalt", "Loose snow", "Packed snow/ice", "Wet ice")
  road_condition <- c(0.9, 0.75, 0.4, 0.2, 0.1)
  speed <- c(30, 50, 70, 90, 110)

output$distPlot10 <- renderPlot({
  v0 <- speed[as.numeric(input$selects)]              # velocity km/h
  tr <- reaction_time[as.numeric(input$selectr)]      # reaction time in sec
  fri <- road_condition[as.numeric(input$selectc)]    # friction coefficient

  sr <- v0*tr/3.6       # reaction distance in m with v0 in km/h
  sb <- v0^2/250/fri    # breaking distance in m with v0 in km/h

  sr.grid <- seq(from = 0, to = sr, length.out = 20)  # x axis points reaction period
  dfr <- data.frame(sr.grid, v0)                      # dataframe reaction period
  names(dfr) <- c("Distance", "Velocity")
  
  vb.grid <- seq(from = v0, to = 0, length.out = 30)  # y axis points brake period
  sb.grid <- vb.grid^2/250/fri
  sb.grid <- sr + sb - sb.grid
  dfb <- data.frame(sb.grid, vb.grid)
  names(dfb) <- c("Distance", "Velocity")
  
  dftot <- rbind(dfr, dfb)

  matplot(dftot[1], dftot[2], pch = 19, col = "red", cex.axis = 1.4, cex.lab = 1.4,
        xlab = "Distance travelled during reaction and braking (meter)", 
        ylab = "Velocity (km/h)")

  points(dftot[1:20,1], dftot[1:20,2], pch = 19, col = "blue")
  
  text(dftot[10,1], dftot[10,2]*0.9, "Reaction distance", col = "blue", cex = 1.4)
  text(dftot[30,1], dftot[20,2]*0.9, "Braking distance", col = "red", cex = 1.4)
  img(src = "Incidentpng.png", height = 43, width = 85)
})

  output$text10 <- renderUI({ 
    div(paste("Velocity", speed[as.numeric(input$selects)], "km/h,  ",
          road[as.numeric(input$selectc)], ",  Reaction ",
          reaction[as.numeric(input$selectr)]),
          style = "color:red")
  })

})