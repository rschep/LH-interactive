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
count = 0
storyProgress = 0

# Init pygame
pygame.init()
size = width, height = resX, resY
screen = pygame.display.set_mode(size)
# screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)		# -- Uncomment for full screen --
black = 0, 0, 0
dotColor = 128,128,128

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

	# -- MAIN CODE -- #
	x = center[0];
	y = center[1];	
	
	# Start screen
	if storyProgress == 0 and x > 75 and x < 125 and y > 50 and y < 300 :
		newColor = 128 + (count * 3)
		dotColor = newColor,128,128
		count += 1
		if count == 40:
			storyProgress = 1
	else :
		dotColor = 128,128,128
		count = 0
		
	# main screen
	if storyProgress == 1 and x > 75 and x < 125 and y > 50 and y < 300 :
		func_testImage(screen)
	else :
		storyProgress = 0
		
	
	func_drawBox(screen)									# -- Uncomment for positioning views --	
	
	# Draw circle
	func_drawCenter(screen, center, dotColor)
	
	# Show 
		#cv2.imshow('Video', frame)							# -- Uncomment for mask view --
	pygame.display.update()
	
	# Quit functionality
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			pygame.quit()
			sys.exit()
			break
		elif event.type == pygame.KEYDOWN:
			if event.unicode == 'q':
				pygame.quit
				sys.exit()
				break
