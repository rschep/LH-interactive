// import dependencies
import tsps.*;
TSPS tspsReceiver;

// init variables 
float posX = 0, posY = 0;
int   pos = 0;
int   age = 0;
float visuals_age = 100;
int   visual_pos = 0;
ArrayList<Particle> parts = new ArrayList();

Background backgroundR;

void setup(){
  size(1024,768);
  //size(displayWidth, displayHeight);
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupMidi();
  
  //setup visuals
  ellipseMode(CENTER);
  img_heart  = loadImage("heart-regular.png");
  img_skulls = loadImage("skull-crossbones-solid.png");

  img_heart.resize(100,0);
  img_skulls.resize(100, 0);

  noStroke();
  
  backgroundR = new Background(100.0, 100.0, 100.0);
  backgroundR.loveBG();
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
      println("x: " + posX + " y: " + posY);
      // music 
      if (age % 10 == 0) {   
         pos = checkBounding(posX, posY);
         if(pos > 0) {
           pos--;
           volumeUp(pos);
         }       
      }
  }
  
  // SS Manual Override Control SS //
  /*posX = mouseX;
  posY = mouseY;
  pos = checkBounding(posX, posY);
  //pos = 0;
  println(pos);
  if (pos != 0)
    volumeUp(pos-1);*/
  // EE Manual Override control EE //
    
  volumeDown();
  EnableLight();
  backgroundR.drawBG();

  // background(r,g,b);
  // background(100,100,100);
  // drawPerson(people);
      
  // visuals
  visual_pos = checkBounding(posX, posY);
  
  if (visual_pos == 1) {
    backgroundR.loveBG();
    if (parts.size() < 100) {
      parts.add( new Particle( random(width), random(height), rcolor(),  img_heart) );
    }
  }
  else if (visual_pos == 2) {
    backgroundR.fearBG();
    if (parts.size() < 100) {
      parts.add( new Particle( random(width), random(height), rcolor(),  img_skulls) );
        }
  }
  else if (visual_pos == 0 && parts.size() < 101) {
      // visuals_age = visuals_age + 0.2; 
      backgroundR.neutralBG();
  }
  
  //println(visuals_age);

  for (int i = 0; i < parts.size() - visuals_age; i++) {
    parts.get(i).draw();   
  }      
  /*println("part size:" + parts.size());
  println("visuals age: " + visuals_age);
  println("visual pos: " + visual_pos);*/
  
  if (visual_pos != 0 && visuals_age > 1) {
    visuals_age = visuals_age - 0.8;
  } else if (visuals_age <= 100)  {
    visuals_age = visuals_age + 0.2; 
  }
  
  // draw coords
  textSize(32);
  text("X: "posX + " - Y: " + posY, 10, 30); 
}







