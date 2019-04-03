// import dependencies
import tsps.*;
TSPS tspsReceiver;

// init variables 
float posX = 0, posY = 0;
int age = 0;
float visuals_age = 50;
int pos = 0;
int visual_pos = 0;

void setup(){
  size(1024,768); 
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupMidi();
  
  //setup visuals
  ellipseMode(CENTER);
  img = loadImage("heart-regular.png");
  img.resize(50,0);
  for ( int i=0; i < 50; i++) {
    parts.add( new Particle( random(width), random(height), rcolor(),  img) );
  }
  noStroke();

};

void draw(){
  float r = 255;
  float g = 188;
  float b = 227;
  
  
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
  // background(r,g,b);
  background(100,100,100);
  drawPerson(people);
      
  // visuals
  visual_pos = checkBounding(posX, posY);
  
  for ( int i=0; i < parts.size() - visuals_age; i++) {
    parts.get(i).draw();   
  }      
  
  if (visual_pos == 1 && visuals_age > 1) {
    visuals_age = visuals_age - 0.2;
  } else if (visuals_age <= 50)  {
    visuals_age = visuals_age + 0.2; 
  }
}







