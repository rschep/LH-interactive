void drawPerson(TSPSPerson[] people){
  background(0);
  rect(10,10,100,50); 
  rect(10,60,100,50);
  rect(10,120,100,50);
  rect(10,180,100,50);
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw();      
  };
}
