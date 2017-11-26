import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.analysis.*; 
import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ParticlesStuff extends PApplet {




Minim       minim;
AudioPlayer song;
FFT         fft;


int start = 0;

ArrayList<Particle> m;
int count = 100; //How many particles to spawn
float spdLimit = 1000;

final static int SUNSET = 2;
final static int ICE = 1;
final static int FIRE = 3;
final static int THEME = ICE;

int ja;
float pastMax = 0;
float xoff = 0.0f;
float yoff = 0.0f;
float xincrement = 0; 
float yincrement = 0; 
int pastX;
int pastY;
float xPosition;
float yPosition;
float speedX, speedY;

boolean paused = false;
boolean circ = false;
boolean back = true;

public void setup() {  
  
  //size(600,400);
  colorMode(HSB, 360, 100, 100);
  m = new ArrayList<Particle>();
  for (int i = 0; i<count; i++) {
    m.add(new Particle());
  }
  selectInput("Select a song to analyze:", "fileSelected");
}
public void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  noCursor();
  start = 1;
}

public void draw() {
  println(frameRate);
  if (start == 1) {
    noStroke();
    fill(0, 40);
    rect(-1, -1, width + 1, height + 1);
    if (back == true) {
      back();
    }
    fill(50, 50, 255);
    for (Particle a : m) {
      a.update();
      a.draw();
    }
    if (circ == true) {
      stroke(255);
      ellipse(xPosition, yPosition, 10, 10);
    }
  }
}

class Particle {

  PVector prev, pos, mouse = new PVector(), spd, acc;
  int col;
  float turnFactor = random(3, 10);

  public Particle() {
    pos = new PVector(random(width), random(height));
    prev = new PVector(pos.x, pos.y);
    spd = new PVector(random(20), random(20));
    acc = new PVector();

    switch(THEME) {
    case SUNSET:
      col = color(random(320, 420) % 360, 90, 100);
      break;
    case ICE:
      col = color(random(155, 210), random(40, 100), 100);
      break;
    case FIRE:
      col = color(random(45), 90, 100);
      break;
    default:
      col = color(random(360), 90, 100);
      break;
    }
  }

  public void update() {
    prev = new PVector(pos.x, pos.y);
    if (pos.x > width || pos.x < 0) {
      spd.x *= -0.9f;
    }
    if (pos.y < 0 || pos.y > height ) {
      spd.y *= -0.9f;
    }
    mouse.set(xPosition, yPosition);
    PVector attraction = new PVector(mouse.x, mouse.y);
    attraction.sub(pos);
    acc.set(attraction);
    acc.normalize();
    acc.div(turnFactor/10);
    spd.add(acc);
    spd.limit(spdLimit * (1f/60));
    pos.add(spd);
  }

  public void draw() {
    fft.forward( song.mix );
    for (int i = 0; i < fft.specSize(); i++) {
      if (fft.getBand(i)>pastMax) {
        xincrement = fft.getBand(i)/800000;
        yincrement = fft.getBand(i)/800000+fft.getBand(i)/8000000;
        pastMax=fft.getBand(i);
      }
      speedX = fft.getBand(i)*100;
      speedY = fft.getBand(i)*100;
    }
    xoff += xincrement*1.25f;
    yoff += yincrement*1.25f;

    xPosition = noise(xoff)*width;
    yPosition = noise(yoff)*height;
    //stroke(255);
    //ellipse(xPosition,yPosition,10,10);
    if (ja == 1) {
      col = color(random(155, 210), random(40, 100), 100);
    } else if (ja ==2) {
      col = color(random(320, 420) % 360, 90, 100);
    } else if (ja ==3) {
      col = color(random(45), 90, 100);
    } else if (ja ==4) {
      col = color(random(360), 90, 100);
    }
    stroke(col);
    strokeWeight(1);
    line(prev.x, prev.y, pos.x, pos.y);
    pastMax = 0;
    sideLines();
  }
}

public void keyPressed() {
  if (key=='s'||key=='S') {
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:", "fileSelected");
  } else if (key == ' ') {
    if (paused == false) {
      song.pause();
      xincrement = 0; 
      yincrement = 0; 
      paused = true;
    } else {
      song.play();
      paused = false;
    }
  } else if (key=='g') {
    if (circ == true) {
      circ = false;
    } else {
      circ=true;
    }
  } else if (key=='1') {
    ja = 1;
  } else if (key=='2') {
    ja = 2;
  } else if (key=='3') {
    ja = 3;
  } else if (key=='4') {
    ja = 4;
  } else if (key=='b') {
    back ^= true;
  }
}
public void back() {
  colorMode(RGB);

  float curveWidth = 10.0f;
  float curveThickness = 10.0f;
  float angleOffset = 0.9f;

  float angleIncrement = map(xincrement, 0, 7*0.0000005f, 0.0f, 0.2f);
  float angleA = 0.0f;
  float angleB = angleA + angleOffset;

  float k = map(yincrement, 0, width, 2.0f, 4.0f);

  for (int i = 0; i < height; i += curveWidth*k) {
    noStroke();

    pushMatrix();
    //translate(0, 400);
    fill(80, 40);
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= width; x += 10) {
      //float y1 = i + (sin(angleA)* curveWidth);
      //float y2 = i + (sin(angleB)* curveWidth);
      float y1 = i + (sin(angleB) * curveWidth);
      float y2 = i + (cos(angleA) * curveWidth);
      vertex(x, y1);
      vertex(x, y2 + curveThickness);
      if (angleIncrement > 5.5f) {
        angleA += angleIncrement;
      }
      angleB = angleA + angleOffset;
    }
    endShape();

    /*pushMatrix();
     scale(1.0, -1.0);
     beginShape(QUAD_STRIP);
     for (int x = 0; x <= width; x += 10) {
     //float y1 = i + (sin(angleA)* curveWidth);
     //float y2 = i + (sin(angleB)* curveWidth);
     float y1 = i + (sin(angleB) * curveWidth);
     float y2 = i + (cos(angleA) * curveWidth);
     vertex(x, y1);
     vertex(x, y2 + curveThickness);
     angleA += angleIncrement;
     angleB = angleA + angleOffset;
     }
     endShape();
     popMatrix();*/
    popMatrix();
    colorMode(HSB, 360, 100, 100);
  }
}

public void sideLines() {
  int modif = 30;
  float x = ( width / 2 )/( (fft.specSize()/2) / modif );
  strokeWeight(3);
  for (int i = 0; i < fft.specSize()/2; i+=modif) {
    int t=(i/modif)+1;
    line( t*x, 0, t*x, 0 + fft.getBand(i)*4 );
    line( width-t*x, 0, width-t*x, 0 + fft.getBand(i)*4 );
    line( t*x, height, t*x, height - fft.getBand(i)*4 );
    line( width-t*x, height, width-t*x, height - fft.getBand(i)*4 );
  }
  strokeWeight(1);
}

  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ParticlesStuff" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
