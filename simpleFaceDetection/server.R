library(shiny)

shinyServer(function(input, output, session) {
  vals <- reactiveValues()
  observeEvent(input$take_foto,{
    img <- ocv_picture()
    vals$photo_r <- img %>% ocv_bitmap() %>% aperm(c(3,2,1))
    vals$face_r  <- img %>% ocv_face() %>% ocv_bitmap() %>% aperm(c(3,2,1))
  })
  output$photo_r <- renderPlot({
    if(!is.null(vals$photo_r) ) countcolors::plotArrayAsImage(vals$photo_r)
  })
  
  output$face_r <- renderPlot({
    if(!is.null(vals$face_r) ) countcolors::plotArrayAsImage(vals$face_r)
  })
})