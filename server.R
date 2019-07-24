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
                 
                 # save the original photo
                 png::writePNG(vals$photo,"output/photo.png")
                 
                 # render & Proces the original photo
                 output$photo <- renderImage({
                   file.remove("output/face.png")
                   system('python facialRecognition.py')
                   
                   list(src ="output/photo.png",
                        alt = "Original photo",
                        height = '250px')})

                 # render the modified photo
                 output$face <- renderImage({
                   list(src ="output/face.png",
                        alt = "Modified photo",
                        height = '250px') },
                   deleteFile = F)
                            })
})