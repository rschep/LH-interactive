// import dependencies
import ddf.minim.*;

// init variables 
AudioPlayer[] mplayer;
Minim minim;
// array with audio samples
String[] songs={"Zero-Sum_Drums.wav"};
String emo1_X = "10";

void setupAudio(){  
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




