library(shiny)

shinyServer(function(input, output, session) {
  vals <- reactiveValues()
  
  # WebCam Module
  myCamera <- callModule(module = shinysense::shinyviewr,
                         id = "myCamera",
                         outputHeight = 300,
                         outputWidth = 533)
  
  # logic for what happens after a user has take a photo. 
  observeEvent(eventExpr = myCamera(), 
               handlerExpr = { 
                 # Take a photo
                 vals$photo <- myCamera()
                 
                 if(!dir.exists("output")){dir.create("output")}
                 
                 img <- round(vals$photo*255)
                 img <- np_array(img, dtype = "uint8")
                 vals$face <- get_faces(img)
                 
                 output$photo <- renderPlot({
                   countcolors::plotArrayAsImage(vals$photo)
                 })
                 output$face <- renderPlot({
                   countcolors::plotArrayAsImage(vals$face/255)
                 })
          })
})