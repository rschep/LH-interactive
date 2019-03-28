// import dependencies
import ddf.minim.*;

// init variables 
AudioPlayer[] mplayer;
Minim minim;
int emotion;
int attack_decayTime = 0; float r = 0;
float gain = 0;
// array with audio samples
String[] songs={"Zero-Sum_Drums.wav"};

void setupAudio(){  
  // audio setup 
  minim = new Minim(this);
  // define the amount of audio players 
  mplayer=new AudioPlayer[60];
  
  //load audio files
  for(int i=1; i<songs.length+1; i++)
  {
   mplayer[i] = minim.loadFile(songs[i-1]);
   mplayer[i].setGain(-20);
   mplayer[i].play();
  } 
};

void startAudio(int emotion)
{
  if(attack_decayTime > r)
  {
    //random volume attack
    r = random(200, 500);
    println(r);
    attack_decayTime = 0;
    //select random track based on emotion 
    emotion = 1;
   
    // reduce gain random over time 
    if (mplayer[emotion].isPlaying())
    {
      gain = mplayer[emotion].getGain();
      gain++;
      println(gain);
      if(gain < 0)
        mplayer[emotion+0].setGain(gain);    
    }
  }
  attack_decayTime++;
}

void stopAudio()
{
  //println(decayTime);
  if(attack_decayTime > r)
  {
    //random volume decay
    r = random(500, 1000);
    println(r);
    attack_decayTime = 0;
    //select random track 
    emotion = 1;
   
    // reduce gain random over time 
    if (mplayer[emotion].isPlaying())
    {
      gain = mplayer[emotion].getGain();
      gain--;
      println(gain);
      if(gain > -50)
        mplayer[emotion+0].setGain(gain);    
    }
  }
  attack_decayTime++;
}




