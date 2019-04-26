// emotion positions {xStart, xEnd, yStart, yEnd}
float[] emo1 = {0.00,0.33,0.00,0.50};
float[] emo2 = {0.33,0.66,0.00,0.50};
float[] emo3 = {0.66,1.00,0.00,0.50};
float[] emo4 = {0.00,0.33,0.50,1.00};
float[] emo5 = {0.33,0.66,0.50,1.00};
float[] emo6 = {0.66,1.00,0.50,1.00};


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
  else if(posX > emo5[0] && posX < emo5[1] && posY > emo5[2] && posY < emo5[3])   //Emotion 5
    return 5;
  else if(posX > emo6[0] && posX < emo6[1] && posY > emo6[2] && posY < emo6[3])   //Emotion 5
    return 6;
  else 
    return 0;
}
