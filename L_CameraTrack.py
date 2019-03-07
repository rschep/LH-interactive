# import the necessary packages
import cv2
import imutils

# calculate position
def func_CalcXY(frame, objLower, objUpper):
	blurred = cv2.GaussianBlur(frame, (11, 11), 0)
	hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
	# Create mask
	mask = cv2.inRange(hsv, objLower, objUpper)
	mask = cv2.erode(mask, None, iterations=2)
	mask = cv2.dilate(mask, None, iterations=2)
	# Find contour
	cnts = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL,
	cv2.CHAIN_APPROX_SIMPLE)
	cnts = imutils.grab_contours(cnts)
	center = None
	if len(cnts) > 0:
		# find the largest contour in the mask, then use it to compute centroid
		c = max(cnts, key=cv2.contourArea)
		M = cv2.moments(c)
		center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))
		
		#print(center)				# uncomment for console position
	#return mask						# uncomment for mask view
	return center					# uncomment for position return