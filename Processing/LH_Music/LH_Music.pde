// import dependencies
import tsps.*;
TSPS tspsReceiver;

// init variables 
float posX = 0, posY = 0;
int age = 0;
int pos = 0;

void setup(){
  size(1024,768); 
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupMidi();
};

void draw(){
  TSPSPerson[] people = tspsReceiver.getPeopleArray();      // position by camera 
  for (int i=0; i<people.length; i++) {
      age = people[i].age;            // get age of person
      posX = people[i].centroid.x;    // get x position of person
      posY = people[i].centroid.y;    // get y position of person
      
      // music 
      if (age % 100 == 0) {    
         pos = checkBounding(posX, posY);
         if(pos > 0) {
           pos--;
           volumeUp(pos);
         }         
      }
  }

  
  // SS Manual Override Control SS //
  posX = mouseX;
  posY = mouseY;
  pos = checkBounding(posX, posY);
  pos = 1;
  volumeUp(pos);
  // EE Manual Override control EE //
  
  volumeDown();
  drawPerson(people);
}







