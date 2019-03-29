import rwmidi.*;

int midiCh, tempMidiCh;
int[] tempadsr1 = {0,0,0,0,0};


// init variable 
MidiOutput output;

void setupMidi(){  
  //println(RWMidi.getOutputDevices()[3]);
  output = RWMidi.getOutputDevices()[3].createOutput();
  //println(output.sendNoteOn(0,55,64));
  } 
  
void MidiADSR(int midi)
{
  midiCh = 60+midi;
  println(output.sendController(0,midiCh,tempadsr1[midi]));
  tempadsr1[midi] ++;
  if(tempadsr1[midi] >= 126)
    tempadsr1[midi] = 126;
}

void MidiADSRMinus(int midi){
  
  output.sendController(0,midiCh,tempadsr1[midi]);
  tempadsr1[midi] --;
  if (tempadsr1[midi] <= 0)
    tempadsr1[midi] = 0;
}

void MuteAll(){
  midiCh = 60;
  for (int i = 0; i < tempadsr1.length; i++){
    tempMidiCh = midiCh + i;
      output.sendController(0, tempMidiCh, 0);
      tempadsr1[i] = 0;
    }
}
