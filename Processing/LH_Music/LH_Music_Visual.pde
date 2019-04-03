void drawPerson(TSPSPerson[] people){
  //background(0);
  rect(10,10,100,50); 
  rect(10,60,100,50);
  rect(10,120,100,50);
  rect(10,180,100,50);
  for (int i=0; i<people.length; i++){
      // draw person!
      people[i].draw();      
  };
}


ArrayList<Particle> parts = new ArrayList();
float r_part;
color k;
float mx, my;
color rcolor() { 
  return(color(random(255), random(255), random(255)));
}
PImage img;

//void draw() {
  //background(255, 188, 227);

//  posX = mouseX;
//  posY = mouseY;
//  pos = checkBounding(posX, posY);

  // if (mousePressed) {
  //   r++;
  //   fill(k, 10);
  //   stroke(k);
  //   ellipse(mx, my, r*2, r*2);
  // }
//}
 
// void mousePressed() {
//   mx=mouseX;
//   my=mouseY;
//   k = rcolor();
//   r=0;
// }
 
// void mouseReleased() {
//   for ( int i=0; i < parts.size (); i++) {
//     parts.get(i).joinZone(mx, my, r, k);
//   }
// }
 
class Particle {
  float px, py, vx, vy;
  color c;
  boolean isZoned;
  float zx, zy, zr;
  color zc;
  
  Particle(float ipx, float ipy, color ic, PImage imgP) { 
    px=ipx;
    py=ipy;
    vx = random(-1, 1);
    vy = random(-5, 0);
    c=ic;
    isZoned = false;
    img = imgP;
  }

  void move() {
    float tpx = px;
    float tpy = py; 
    px+=vx;//random(-1, 1); 
    py+=vy;//random(-1, 1);
    px+=width;
    py+=height;
    px%=width;
    py%=height;
    if (isZoned) {
      if (dist(px, py, zx, zy)>zr) {
        px = tpx;
        py = tpy;
        vx = random(-1, 1);
        vy = random(-1, 1);
      }
      if (dist(px, py, zx, zy)>zr) {
        if (px>zx)px--;
        if (px<zx)px++;
        if (py>zy)py--;
        if (py<zy)py++;
      }
    }
  }
  void draw() {
    //float randnr = random(-10, 10);
    move();
    image(img, px, py);
    rotate(10);
    fill(c);
    if (isZoned) fill(zc);
    noStroke();
    //rect(px, py, 5, 5);
    //    if ( random(1) < 0.01 ) {
    //    isZoned = false;
    //}
  }
  void joinZone(float izx, float izy, float izr, color izc) {
    if (dist(px, py, izx, izy)<izr) {
      zx = izx;
      zy = izy;
      zr = izr;
      zc = izc;
      isZoned = true;
    }
  }
}
