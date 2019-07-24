library(shiny)
library(reticulate)
library(shinysense)
library(tidyverse)

# py_install()
# conda_create("r-reticulate")
# conda_install("r-reticulate", "numpy")
# conda_install("r-reticulate", "Opencv")


source_python('facialRecognition.py')
