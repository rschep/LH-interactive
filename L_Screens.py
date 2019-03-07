# import the necessary packages
import sys, pygame

# Dev purposes
def func_DEV(screen, center):
	mainImg = pygame.image.load('assets/main.png')
	screen.blit(mainImg,(0,0))
	
def func_testText(screen, center):
	x = str(center[0])
	y = str(center[1])
	myfont = pygame.font.SysFont('Comic Sans MS', 10)
	textsurface = myfont.render(x, False, (255, 255, 255))						
	screen.blit(textsurface,(0,0))
	
def func_testImage(screen, center):
	mainImg = pygame.image.load('assets/main.png')
	screen.blit(mainImg,(0,0))
	
	
# Ready code
def func_DrawCenter(screen, center):
	x = center[0]
	y = center[1]
	pygame.draw.circle(screen,(128,128,128),(x,y),10)


