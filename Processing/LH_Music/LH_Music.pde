// import dependencies
import tsps.*;
TSPS tspsReceiver;

// init variables 
float posX = 0;
float posY = 0;
int check = 0;

void setup(){
  size(1024,768);
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupAudio();
};

void draw(){
  // position by camera 
  TSPSPerson[] people = tspsReceiver.getPeopleArray();
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw(); 
      posX = people[i].centroid.x;
      posY = people[i].centroid.y;
      //checkBounding(posX, posY)      // -- Comment for mouse control -- //
  };
  
  // -- Mouse control -- //
  posX = mouseX;
  posY = mouseY;
  check = checkBounding(posX, posY);
  if(check == 0)
     stopAudio(); 
  else
    startAudio(check);
  
  
  drawPerson(people);
}







