
// import dependencies
import tsps.*;
TSPS tspsReceiver;

// init variables 
float posX = 0, posY = 0;
int age = 0;
float visuals_age = 100;
int pos = 0;
int visual_pos = 0;
ArrayList<Particle> parts = new ArrayList();
int array_size = 100;
Background backgroundR;


void setup(){
  size(1024,768); 
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupMidi();
  
  //setup visuals
  ellipseMode(CENTER);
  img_heart = loadImage("heart-regular.png");
  img_skulls = loadImage("skull-crossbones-solid.png");
  img_circle = loadImage("circle.png");

  img_heart.resize(100,0);
  img_skulls.resize(100, 0);
  img_circle.resize(500, 0);

  noStroke();
  
  backgroundR = new Background(100.0, 100.0, 100.0);
  backgroundR.loveBG();


};

void draw(){
  TSPSPerson[] people = tspsReceiver.getPeopleArray();      // position by camera 
  for (int i=0; i<people.length; i++) {
      age = people[i].age;            // get age of person  
      posX = people[i].centroid.x;    // get x position of person
      posY = people[i].centroid.y;    // get y position of person
      println(posX);
      println(posY);
      // music 
      if (age % 10 == 0) {    
         pos = checkBounding(posX, posY);
         if(pos > 0) {
           pos--;
           volumeUp(pos);
           EnableLight(pos);
         }         
      }
  }

  
  // SS Manual Override Control SS //
  posX = mouseX;
  posY = mouseY;
  pos = checkBounding(posX, posY);
  println(pos);
  if (pos != 0)
    volumeUp(pos-1);
  
  // EE Manual Override control EE //
    
  volumeDown();
  CheckLight();
  backgroundR.drawBG();

  drawPerson(people);

  // visuals
  visual_pos = checkBounding(posX, posY);
  
  if (visual_pos == 1) {
    backgroundR.loveBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(),  img_heart));
    }
  }
  if (visual_pos == 2) {
    backgroundR.fearBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(),  img_skulls));
        }
  }
  if (visual_pos == 3) {
    backgroundR.angerBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_circle));
    }
  }
  if (visual_pos == 4) {
    backgroundR.joyBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_circle));
    }
  }
  if (visual_pos == 5) {
    backgroundR.sadnessBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_circle));
    }
  }
  if (visual_pos == 6) {
    backgroundR.peaceBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_circle));
    }
  }
  if (visual_pos == 0 && parts.size() < 101) {
      backgroundR.neutralBG();
  }

 for (int i = 0; i < parts.size(); i++){
    parts.get(i).draw();
  }
  
  if (visual_pos == 0 && parts.size() >= 1) {
    parts.remove(parts.size() - 1);
  }
}







