import rwmidi.*;

// init variable 
MidiOutput output;

void setupMidi(){  
  //println(RWMidi.getOutputDevices()[3]);
  output = RWMidi.getOutputDevices()[3].createOutput();
  println(output.sendNoteOn(1,10,10));
  } 

