# import the necessary packages
import sys, pygame

# Dev purposes
def func_DEV(screen, center):
	x = str(center[0])
	y = str(center[1])
	print(x)
	myfont = pygame.font.SysFont('Comic Sans MS', 10)
	textsurface = myfont.render(x, False, (255, 255, 255))						
	screen.blit(textsurface,(0,0))

