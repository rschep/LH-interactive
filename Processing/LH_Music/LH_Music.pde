/**
  TSPS Basic Example
  by Brett Renfer, 9/8/12
  
  Set up TSPS + use the built-in Person draw function to visualize the data you're getting.
*/

// import TSPS
import tsps.*;
TSPS tspsReceiver;

void setup(){
  size(1024,768);
  
  //all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);
};

void draw(){
  background(0);
  rect(30, 20, 55, 55);
  // get array of people
  TSPSPerson[] people = tspsReceiver.getPeopleArray();
  
  // loop through people
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw();
      println(people[i].centroid); 
      
  };
};




