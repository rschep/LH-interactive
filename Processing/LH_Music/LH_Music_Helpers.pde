// emotion positions {xStart, xEnd, yStart, yEnd}
float[] emo1 = {10,100,10,50};
float[] emo2 = {10,100,60,110};
float[] emo3 = {10,100,120,170};
float[] emo4 = {10,100,180,230};


int checkBounding(float posX, float posY)
{
  if(posX > emo1[0] && posX < emo1[1] && posY > emo1[2] && posY < emo1[3])        //Emotion 1
    return 1; 
  else if(posX > emo2[0] && posX < emo2[1] && posY > emo2[2] && posY < emo2[3])   //Emotion 2
    return 2;
  else if(posX > emo3[0] && posX < emo3[1] && posY > emo3[2] && posY < emo3[3])   //Emotion 3
    return 3;
  else if(posX > emo4[0] && posX < emo4[1] && posY > emo4[2] && posY < emo4[3])   //Emotion 4
    return 4;
  else 
    return 0;
}
