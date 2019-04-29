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
ArrayList<Particle> parts_circle_small = new ArrayList();
int array_size = 75;
int array_size_2 = 50;
Background backgroundR;

void setup(){
  //size(1024,768);
  frameRate(60);
  size(displayWidth, displayHeight);
  //size(640, 480);
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  setupMidi();
  
  //setup visuals
  ellipseMode(CENTER);
  img_heart  = loadImage("heart-regular.png");
  img_skulls = loadImage("skull-crossbones-solid.png");
  img_circle = loadImage("circle.png");
  img_circle_small = loadImage("circle.png");
  img_peace = loadImage("peace-solid-svg.png");
  img_anger = loadImage("angry-regular-svg.png");
  img_joy = loadImage("sun-regular-svg.png");

  img_heart.resize(100,0);
  img_skulls.resize(100, 0);
  img_circle.resize(500, 0);
  img_circle_small.resize(15, 0);
  img_peace.resize(50, 0);
  img_anger.resize(100, 0);
  img_joy.resize(100, 0);
  
  noStroke();
  
  backgroundR = new Background(100.0, 100.0, 100.0);
};

void draw(){
  TSPSPerson[] people = tspsReceiver.getPeopleArray();      // position by camera 
  for (int i=0; i<people.length; i++) {
      age = people[i].age;            // get age of person  
      posX = people[i].centroid.x;    // get x position of person
      posY = people[i].centroid.y;    // get y position of person
      println("x: " + posX + " y: " + posY);
      // music 
      if (age % 1 == 0) {   
         pos = checkBounding(posX, posY);
         if(pos > 0) {
           pos--;
           volumeUp(pos);
         if (parts.size() >= 50) {
           parts.remove(0);
         }
      }
    }
  }
  
  // SS Manual Override Control SS //
  /*posX = mouseX;
  posY = mouseY;
  pos = checkBounding(posX, posY);
  println(pos);
  if (pos != 0)
    volumeUp(pos-1);*/
  // EE Manual Override control EE //
    
  volumeDown();
  EnableLight();
  backgroundR.drawBG();

  // drawPerson(people);

  // visuals
  visual_pos = checkBounding(posX, posY);
  if (enabledLights[0] == 1) {
    backgroundR.loveBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(),  img_heart));
    }
  }
  if (enabledLights[1] == 1) {
    backgroundR.fearBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(),  img_skulls));
        }
  }
  if (enabledLights[2] == 1) {
    backgroundR.angerBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_anger));
    }
  }
  if (enabledLights[3] == 1) {
    backgroundR.joyBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_joy));
    }
  }
  if (enabledLights[4] == 1) {
    backgroundR.sadnessBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_circle_small));
    }
  }
  if (enabledLights[5] == 1) {
    backgroundR.peaceBG();
    if (parts.size() < array_size) {
      parts.add(new Particle(random(width), random(height), rcolor(), img_peace));
    }
  }
//  if (visual_pos == 0 && parts.size() < 101) {
//      backgroundR.neutralBG();
//  }

 for (int i = 0; i < parts.size(); i++){
    parts.get(i).draw();
  }

// if (parts_circle_small.size() < array_size_2) {
//     parts_circle_small.add(new Particle(random(width), random(height), rcolor(), img_circle_small));
// }
// for (int i = 0; i < parts_circle_small.size(); i++){
//    parts_circle_small.get(i).draw();
// }
   
//  if (visual_pos == 0 && parts.size() >= 1) {
//    parts.remove(parts.size() - 1);
//  } 
  for (int i = 0; i < enabledLights.length; i++){
    if (enabledLights[i] == 1) {
      break;
    } else if (parts.size() >= 1 && i == enabledLights.length) {
      parts.remove(parts.size() - 1);
//    } else if (parts_circle_small.size() >=1 && i == enabledLights.length){
//      parts_circle_small.remove(parts_circle_small.size() - 1);
    } else if (parts.size() == 0 && parts_circle_small.size() == 0) {
      backgroundR.neutralBG();    
    }
  }
}







