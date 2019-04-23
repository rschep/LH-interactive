# import the necessary packages
import cv2
import imutils
from threading import Thread, Lock
import time

# Async webcam
class VideoCaptureAsync:
	def __init__(self, src = 0, width = 960, height = 540) :
		self.stream = cv2.VideoCapture(src)
		c = cv2.waitKey(10)

		self.stream.set(cv2.CAP_PROP_FRAME_WIDTH, width)
		self.stream.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
		(self.grabbed, self.frame) = self.stream.read()
		self.started = False
		self.read_lock = Lock()

	def start(self):
		if self.started:
			print("already started!!")
			return None
		self.started = True
		self.thread = Thread(target=self.update, args=())
		self.thread.start()
		return self

	def update(self):
		while self.started :
			(grabbed, frame) = self.stream.read()
			self.read_lock.acquire()
			self.grabbed, self.frame = grabbed, frame
			self.read_lock.release()

	def read(self):
		with self.read_lock:
			frame = None
			grabbed = self.grabbed
			if grabbed == True:
				frame = self.frame.copy()
		return grabbed, frame

	def stop(self):
		self.started = False
		self.thread.join()

	# def isOpen(self):
	# 	# print(cv2.self.isOpened())
	# 	# self.isOpened = False
	# 	# if (self.stream.isOpened()):
	# 	# 	stream.open()
	# 	# 	isOpened = True
	# 	# print(cv2.isOpened())

	def __exit__(self, exc_type, exc_value, traceback) :
		self.stream.release()
	

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
	# return mask						# uncomment for mask view
	return center					# uncomment for position return
	
# return mask view	
def func_Mask(frame, objLower, objUpper):
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
		# print(center)				# uncomment for console position
	return mask