import numpy
import cv2

def get_faces(img):
  
  face_cascade = cv2.CascadeClassifier('data/haarcascades/haarcascade_frontalface_default.xml') # https://github.com/opencv/opencv
  eye_cascade = cv2.CascadeClassifier('data/haarcascades/haarcascade_eye.xml') # https://github.com/opencv/opencv
  # img = cv2.imread('output/photo.png')
  # str(img.__class__)
  # str(img[0][0][0].__class__)
  gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
  
  faces = face_cascade.detectMultiScale(gray, 1.3, 5)  # find faces over the picture in gray

  for (x,y,w,h) in faces:
    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2) # adds a blue (0,0,255) rectangle for each face
    roi_gray = gray[y:y+h, x:x+w]
    # find eyes over the face found
    eyes = eye_cascade.detectMultiScale(roi_gray)

    roi_color = img[y:y+h, x:x+w]
    for (ex,ey,ew,eh) in eyes:
      cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2) # adds a green (0,255,0) rectangle for each eye
  return(img) 
