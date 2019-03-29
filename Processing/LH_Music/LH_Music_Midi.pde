import rwmidi.*;

int tempadsr = 0;

// init variable 
MidiOutput output;

void setupMidi(){  
  //println(RWMidi.getOutputDevices()[3]);
  output = RWMidi.getOutputDevices()[3].createOutput();
  //println(output.sendNoteOn(0,55,64));
  } 
  
void MidiADSR()
{
    println(output.sendController(0,61,tempadsr));
    tempadsr ++;
    if(tempadsr >= 126)
      tempadsr = 126;
}

void MidiADSRMinus(){
  println(output.sendController(0,61,tempadsr));
  tempadsr --;
  if (tempadsr <= 0)
    tempadsr = 0;
}
