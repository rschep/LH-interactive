# Import the necessary packages
import numpy as np
import cv2
import sys, pygame
from pygame import gfxdraw

# Import external library
import L_CameraTrack
from L_CameraTrack import *
import L_Screens
from L_Screens import *

# Variable
# define the lower and upper boundaries of the object
#	objLower = (100, 86, 6)
#	objUpper = (150, 255, 255)
objLower = (100, 86, 120)
objUpper = (150, 255, 255)
# screensize 
resX = 800
resY = 800
count = 0
storyProgress = 0

# Init pygame
pygame.init()
clock = pygame.time.Clock()
size = width, height = resX, resY
screen = pygame.display.set_mode(size)
#screen = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)		# -- Uncomment for full screen --
black = 0, 0, 0
dotColor = 255,255,255
selectionSize = 30
selectionSize2 = 60
selectionSize3 = 64
skippedFrames = False
# Capture webcam
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FPS, 60)
while(True):
	# fix for unresponsive window
	pygame.event.get()
	# Capture frame
	ret, frame = cap.read()
	# SHPEED HACK | Disable original cap.read if this is enabled
	#if skippedFrames == False:
	#	ret, frame = cap.read()
	#	skippedFrames = True
	#else:
	#	skippedFrames == False
	#flip mirror
	frame = cv2.flip(frame,1)
	# resize frame
	frame = cv2.resize(frame,(resX,resY),interpolation=cv2.INTER_LINEAR)
	
	# calculate position
	center = func_CalcXY(frame, objLower, objUpper)
	#center = pygame.mouse.get_pos() 						# -- Uncomment for mouse control --
	frame = func_Mask(frame, objLower, objUpper)    		# -- Uncomment for mask view --
	# Reset screen
	screen.fill(black)

	# -- MAIN CODE -- #
	x = center[0];
	y = center[1];	
	
	# Start screen
	if storyProgress == 0 and x > 75 and x < 125 and y > 50 and y < 300 :
		# newColor = 128 + (count * 3)
		# dotColor = newColor,128,128
		# count += 1
		# if count == 40:
		# 	storyProgress = 1
		dotColor = 255,255,255
		selectionSize -=1
		selectionSize2 -=2
		selectionSize3 -=2
		if selectionSize == 0:
			storyProgress = 1 

		if selectionSize2 >= 1:
			pygame.gfxdraw.circle(screen, x, y, selectionSize2, (255,255,255))
		else:
			pygame.gfxdraw.circle(screen, x, y, 1, (255,255,255))
		pygame.gfxdraw.circle(screen, x, y, selectionSize3, (255,255,255))

	else :
		dotColor = 200,200,200
		count = 0
		selectionSize = 30
		selectionSize2 = 60
		selectionSize3 = 64
		
	# main screen
	if storyProgress == 1 and x > 75 and x < 125 and y > 50 and y < 300 :
		func_testImage(screen)
	else :
		storyProgress = 0
		
	
	func_drawBox(screen)									# -- Uncomment for positioning views --	
	
	# Draw circle
	func_drawCenter(screen, center, dotColor, selectionSize, 15)
	
	# Show 
	cv2.imshow('Video', frame)							# -- Uncomment for mask view --
	pygame.display.update()
	
	# Quit functionality
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			cap.release()
			cv2.destroyAllWindows()
			pygame.quit()
			sys.exit()
			break
		elif event.type == pygame.KEYDOWN:
			if event.unicode == 'q':
				cap.release()
				cv2.destroyAllWindows()
				pygame.quit
				sys.exit()
				break
