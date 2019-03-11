# import the necessary packages
import sys, pygame
import simpleaudio as sa
from pygame import gfxdraw

#Variable
audioPlay = False
play_obj = sa.PlayObject(1)

selectionSize1 = 30
selectionSize2 = 60
selectionSize3 = 64

# Dev purposes
def func_DEV(screen, center):
	mainImg = pygame.image.load('assets/image/main.png')
	screen.blit(mainImg,(0,0))
	
# change position of drawbox	
def func_drawBox(screen):
	pygame.draw.rect(screen, (255,255,255), [75, 100, 50, 200], 2)
	
def func_testTextPos(screen, center):
	x = str(center[0])
	y = str(center[1])
	myfont = pygame.font.SysFont('Comic Sans MS', 10)
	textsurface = myfont.render(x, False, (255, 255, 255))						
	screen.blit(textsurface,(0,0))
	
def func_testText(screen, text):
	text = str(text)
	myfont = pygame.font.SysFont('Comic Sans MS', 10)
	textsurface = myfont.render(text, False, (255, 255, 255))						
	screen.blit(textsurface,(0,0))
	
def func_testImage(screen):
	mainImg = pygame.image.load('assets/image/main.png')
	screen.blit(mainImg,(0,0))

	
# Ready code
def func_drawCenter(screen, center, dotColor):
	x = center[0]
	y = center[1]
	pygame.draw.circle(screen,(dotColor),(x,y), selectionSize1)
	
def func_clickAnimation(screen, x, y):
	global selectionSize1, selectionSize2, selectionSize3
	selectionSize1 -=1
	selectionSize2 -=2
	selectionSize3 -=2
	# Check negatives
	if selectionSize1 <= 1:
		selectionSize1 = 1
	if selectionSize2 <= 1:
		selectionSize2 = 1
	if selectionSize3 <= 1:
		selectionSize3 = 1
		return True 		# Animation done
		
	pygame.gfxdraw.circle(screen, x, y, selectionSize2, (255,255,255))
	pygame.gfxdraw.circle(screen, x, y, selectionSize3, (255,255,255))	
	return False

def func_resetAnimation():
	global selectionSize1, selectionSize2, selectionSize3
	selectionSize1 = 30
	selectionSize2 = 60
	selectionSize3 = 64
	
def func_PlaySound(path):
	global audioPlay, play_obj
	if not play_obj.is_playing():
		wave_obj = sa.WaveObject.from_wave_file(path)
		play_obj = wave_obj.play()
		audioPlay = True

def func_StopSound():
	sa.stop_all()

