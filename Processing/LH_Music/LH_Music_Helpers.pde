// emotion positions {xStart, xEnd, yStart, yEnd}
float[] emo1 = {10,100,10,50};

int checkBounding(float posX, float posY)
{
  if(posX > emo1[0] && posX < emo1[1] && posY > emo1[2] && posY < emo1[3])        //Emotion 1
    return 1; 
  else if(posX > emo1[0] && posX < emo1[1] && posY > emo1[2] && posY < emo1[3])   //Emotion 2
    return 2;
  else 
    return 0;
}
