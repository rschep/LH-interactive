void drawPerson(TSPSPerson[] people) {
  //background(0);
  rect(10, 10, 100, 50); 
  rect(10, 60, 100, 50);
  rect(10, 120, 100, 50);
  rect(10, 180, 100, 50);
  for (int i=0; i<people.length; i++) {
    // draw person!
    people[i].draw();
  };
}

float r_part;
color k;
float mx, my;
color rcolor() { 
  return(color(random(255), random(255), random(255)));
}
PImage img_heart;
PImage img_skulls;

int[]   enabledLights       = {0,0,0,0,0,0}; 
int[]   tempLights          = {0,0,0,0,0,0}; 

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
  PImage img;

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
    //recolorImg(255, 255, 0);
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
  void recolorImg(int r_new, int g_new, int b_new) {
    // new_++ img = new_img;
    // easier to do with white svg's (>= 250, 250, 250, 250). For now with black
    for (int i = 0; i < img.pixels.length; i++) {
      if (img.pixels[i] <= color(250, 250, 255)) {
        img.pixels[i] = color(255, 255, 0);
      }
    }
  }
}

class Background {
  float r_bg, g_bg, b_bg;

  float r_new, b_new, g_new;

  FloatList rbg_list;


  Background (float r, float g, float b) {
    r_bg = r;
    g_bg = g;
    b_bg = b;
  }

  public void drawBG() {
    background(r_bg, g_bg, b_bg);
  }

  private float transitionRBG(float oldRGB, float newRGB) {
    float inc = 0.3;

    if (newRGB > oldRGB) {
      oldRGB+=inc;
    } else if (newRGB < oldRGB) {
      oldRGB-=inc;
    }
    return oldRGB;
  }

  public void neutralBG() {
    // dark grey
    r_new = 50.0;
    g_new = 50.0;
    b_new = 50.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }

  public void sadnessBG() {
    // steel blue
    r_new = 20.0;
    g_new = 32.0;
    b_new = 66.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }

  public void angerBG() {
    // intense reddish
    r_new = 239.0;
    g_new = 32.0;
    b_new = 15.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }
  
  public void joyBG() {
    // light greenish
    r_new = 187.0;
    g_new = 236.0;
    b_new = 102.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }  
  
  public void loveBG() {
    // soft pinkish
    r_new = 241.0;
    g_new = 78.0;
    b_new = 128.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }
  
  public void peaceBG() {
    // soft yellowish
    r_new = 245.0;
    g_new = 244.0;
    b_new = 115.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }  
  
   public void fearBG() {
    // brownred, pretty bad color
    r_new = 60.0;
    g_new = 12.0;
    b_new = 12.0;

    r_bg = transitionRBG(r_bg, r_new);
    g_bg = transitionRBG(g_bg, g_new);
    b_bg = transitionRBG(b_bg, b_new);

    background(r_bg, g_bg, b_bg);
  }   
}

// DMX 
void EnableLight() {
  TSPSPerson[] people = tspsReceiver.getPeopleArray();
  for (int y=0; y<enabledLights.length; y++) {
    for (int i=0; i<people.length; i++) {
       posX = people[i].centroid.x;    // get x position of person
       posY = people[i].centroid.y;    // get y position of person
       pos = checkBounding(posX, posY); 
    }
    if(pos > 0) {
      pos--;
      if (y == pos) {
        tempLights[y] = 1;
      }
    }
  }
  for (int y=0; y<tempLights.length; y++) {
    if(tempLights[y] == 1 && enabledLights[y] == 0)
    {
      enabledLights[y] = 1;
      outputDMX.sendController(0, y+1, 126);  
    }
    else if(tempLights[y] == 0 && enabledLights[y] == 1)
    {
      enabledLights[y] = 0;
      outputDMX.sendController(0, y+1, 0);
    }
    tempLights[y] = 0;
  }
}

