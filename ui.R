library(shiny)

# Some sources
# https://github.com/opencv/opencv
# https://electronicsforu.com/electronics-projects/real-time-face-recognition-python-opencv
# https://www.stoltzmaniac.com/facial-recognition-in-r/
# https://pythonprogramming.net/haar-cascade-face-eye-detection-python-opencv-tutorial/
# install_github("nstrayer/shinysense")

# some isues found (due to win10)
# upgrade as administrator python -m pip install numpy mitmproxy
# Add to PATH C:\Users\~\Anaconda3 And Anaconda3\Library\bin
# olny work on explorer



shinyUI(
  fluidPage(
    fluidRow( column(2),
              column(4, wellPanel(shinyviewrUI("myCamera", height = "250px"))),
              column(4,
                     wellPanel(imageOutput("photo", height = "250px")),
                     wellPanel(imageOutput("face", height = "250px"))),
              column(2)
    )
  )
)
