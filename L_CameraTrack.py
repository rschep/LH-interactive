# import the necessary packages
import cv2

# calculate position
def func_CalcXY(frame, objLower, objUpper):
	blurred = cv2.GaussianBlur(frame, (11, 11), 0)
	hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
	# Create mask
	mask = cv2.inRange(hsv, objLower, objUpper)
	mask = cv2.erode(mask, None, iterations=2)
	mask = cv2.dilate(mask, None, iterations=2)
	
	
	return mask