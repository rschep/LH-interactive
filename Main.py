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
black = 0, 0, 0

# Capture webcam
cap = cv2.VideoCapture(0)

while(True):
	# fix for unresponsive window
	pygame.event.get()
	# Capture frame
	ret, frame = cap.read()
	#flip mirror
	frame = cv2.flip(frame,1)
	# resize frame
	frame = cv2.resize(frame,(resX,resY),interpolation=cv2.INTER_LINEAR)
	
	# calculate position
		# frame = func_CalcXY(frame, objLower, objUpper)    # -- Uncomment for mask view --
	center = func_CalcXY(frame, objLower, objUpper)
	center = pygame.mouse.get_pos() 						# -- Uncomment for mouse control --
	# Reset screen
	screen.fill(black)
	
	# Get screens
	func_DEV(screen, center)
	
	# Draw circle
	func_DrawCenter(screen, center)
	
	# Show 
		#cv2.imshow('Video', frame)							# -- Uncomment for mask view --
	pygame.display.update()
