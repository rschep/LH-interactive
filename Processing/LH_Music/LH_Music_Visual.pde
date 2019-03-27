void drawPerson(TSPSPerson[] people){
  background(0);
  rect(30, 20, 55, 55);
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw();      
  };
}
