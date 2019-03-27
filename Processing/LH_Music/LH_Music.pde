// import dependencies
import tsps.*;
import ddf.minim.*;
TSPS tspsReceiver;

// init variables 
AudioPlayer[] mplayer;
Minim minim;
// array with audio samples
String[] songs={"Zero-Sum_Drums.wav"};

void setup(){
  size(1024,768);
  
  // all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
  
  // audio setup 
  minim = new Minim(this);
  // define the amount of audio players 
  mplayer=new AudioPlayer[3];
  
  // example load sample 0 into player 0 and play 
  mplayer[0] = minim.loadFile(songs[0]);
  mplayer[0].play();
  // gain setter
  mplayer[0].setGain(-10);
};

void draw(){
  background(0);
  rect(30, 20, 55, 55);
  // get array of people
  TSPSPerson[] people = tspsReceiver.getPeopleArray();
   mplayer[0].play();
  // loop through people
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw();
      println(people[i].centroid); 
      
  };
};




