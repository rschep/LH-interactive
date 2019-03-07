# import the necessary packages
import sys, pygame

# Dev purposes
def func_DEV(screen, center):
	mainImg = pygame.image.load('assets/main.png')
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
	mainImg = pygame.image.load('assets/main.png')
	screen.blit(mainImg,(0,0))

	
# Ready code
def func_drawCenter(screen, center, dotColor):
	x = center[0]
	y = center[1]
	pygame.draw.circle(screen,(dotColor),(x,y),10)


