# Import the necessary packages
import numpy as np
import cv2
import sys, pygame

# Import external library
import L_CameraTrack
from L_CameraTrack import *
import L_Screens
from L_Screens import *

# Variable
# define the lower and upper boundaries of the object
#	objLower = (100, 86, 6)
#	objUpper = (150, 255, 255)
objLower = (0, 86, 6)
objUpper = (150, 255, 255)
# screensize 
resX = 590
resY = 590

# Init pygame
pygame.init()
size = width, height = resX, resY
screen = pygame.display.set_mode(size)

# Capture webcam
cap = cv2.VideoCapture(0)

while(True):
	# Capture frame
	ret, frame = cap.read()
	#flip mirror
	frame = cv2.flip(frame,1)
	# resize frame
	frame = cv2.resize(frame,(resX,resY),interpolation=cv2.INTER_LINEAR)
	
	# calculate position
	# frame = func_CalcXY(frame, objLower, objUpper)    -- Uncomment for mask view --
	center = func_CalcXY(frame, objLower, objUpper)
	
	# Get screens
	func_DEV(screen, center)
	
	# Show 
	#cv2.imshow('Video', frame)
	pygame.display.update()
	
	# Break with 'q'
	if cv2.waitKey(1) & 0xFF == ord('q'):
		break
		
cap.release()
cv2.destroyAllWindows()	
