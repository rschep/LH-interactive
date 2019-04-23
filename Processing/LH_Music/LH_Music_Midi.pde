import rwmidi.*;
MidiOutput outputVolume;
MidiOutput outputDMX;

// init variable 
int r;                                              // random selector variable
int volumeDownCount = 0;                            // volume down timer
int[] volumeUpCount       = {0,0,0,0,0,0};          // counts how many times the volume for a specific emotion is increased
int[] volumeSelectedTrack = {0,0,0,0,0,0};          // keeps track of wich track is affected by change 
int[] volumeEmotion       = {0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0};  // current volume for emotions 

void setupMidi(){  
  //println(RWMidi.getOutputDevices()[3]);
  outputVolume = RWMidi.getOutputDevices()[3].createOutput();
  outputDMX    = RWMidi.getOutputDevices()[4].createOutput();
  } 
  
void volumeUp(int emotion) {
  volumeUpCount[emotion]++;
  if(volumeUpCount[emotion] >=25)
    randomTrackSelector(emotion);
  volumeEmotion[volumeSelectedTrack[emotion]]++;
  if(volumeEmotion[volumeSelectedTrack[emotion]] <= 10)      // initial start volume when track is low on volume
    volumeEmotion[volumeSelectedTrack[emotion]] = 10;
  if(volumeEmotion[volumeSelectedTrack[emotion]] >= 122)     // max volume for a track 
    volumeEmotion[volumeSelectedTrack[emotion]] = 122;
  outputVolume.sendController(0,60+volumeSelectedTrack[emotion],volumeEmotion[volumeSelectedTrack[emotion]]);
}

void volumeDown() {
  volumeDownCount++;
  if(volumeDownCount >=10) {
    volumeDownCount = 0;
    r = int(random(0, 59));
    if(volumeEmotion[r]>0)
      volumeEmotion[r] = volumeEmotion[r]-1;
    outputVolume.sendController(0,60+r,volumeEmotion[r]);
  }
}

// -- HELPERS -- // 
void randomTrackSelector(int emotion) {
  switch(emotion) {
  case 0: 
    volumeUpCount[0] = 0;
    r = int(random(0, 9)); volumeSelectedTrack[0] = r;
    break;
  case 1: 
    volumeUpCount[1] = 0;
    r = int(random(10, 19)); volumeSelectedTrack[1] = r;
    break;
  case 2: 
    volumeUpCount[2] = 0;
    r = int(random(20, 29)); volumeSelectedTrack[2] = r;
    break;
  case 3: 
    volumeUpCount[3] = 0;
    r = int(random(30, 39)); volumeSelectedTrack[3] = r;
    break;
  case 4: 
    volumeUpCount[4] = 0;
    r = int(random(40, 49)); volumeSelectedTrack[4] = r;
    break;
  case 5: 
    volumeUpCount[5] = 0;
    r = int(random(50, 59)); volumeSelectedTrack[5] = r;
    break;
  }
}
