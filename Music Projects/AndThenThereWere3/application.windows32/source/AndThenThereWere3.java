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

public class AndThenThereWere3 extends PApplet {




Minim       minim;
AudioPlayer song;
FFT         fft;
FFT         fftL;
FFT         fftR;

PFont font;

int start = 0;
boolean three = true;

float pastMax = 0;
float pastMaxL = 0;
float pastMaxR = 0;

int rand;
boolean dev = false;

float r = 12;
float g = 2;
float b = 39;

public void setup() {
  
  font = createFont("Arial", 32);
  shapes = new ArrayList();
  selectInput("Select a song to analyze:", "fileSelected");
}

public void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
  fftL = new FFT( song.bufferSize(), song.sampleRate() );
  fftR = new FFT( song.bufferSize(), song.sampleRate() );

  noCursor();
  start = 1;
}

public void draw() {
  background(r,g,b);
  if (start == 1) {
    drawOpt();
    rand = PApplet.parseInt(random(1, 4));
    fft.forward( song.mix );
    if (three == true) {
      fftL.forward( song.left );
      fftR.forward( song.right );
    }
    
    strokeWeight(0.25f);
    for (int i = 0; i < fft.specSize(); i++) {
      stroke(random(255), random(255), random(255));
      line( i*2, 0, i*2, 0 + fft.getBand(i)*10 );
      line( width-i*2, 0, width-i*2, 0 + fft.getBand(i)*10 );
      line( i*2, height, i*2, height - fft.getBand(i)*10 );
      line( width-i*2, height, width-i*2, height - fft.getBand(i)*10 );
      if (fft.getBand(i)>pastMax) {
        xincrement = fft.getBand(i)/8000;
        yincrement = fft.getBand(i)/8000+fft.getBand(i)/80000;
        pastMax=fft.getBand(i);
      }
    }
    if (three == true) {
      for (int i = 0; i < fftL.specSize(); i++) {
        if (fftL.getBand(i)>pastMaxL) {
          xincrement1 = fftL.getBand(i)/8000;
          yincrement1 = fftL.getBand(i)/8000+fftL.getBand(i)/80000;
          pastMaxL=fftL.getBand(i);
        }
      }
      for (int i = 0; i < fftR.specSize(); i++) {
        if (fftR.getBand(i)>pastMaxR) {
          xincrement2 = fftR.getBand(i)/8000;
          yincrement2 = fftR.getBand(i)/8000+fftR.getBand(i)/80000;
          pastMaxR=fftR.getBand(i);
        }
      }
      pastMaxL = 0;
      pastMaxR = 0;
    }
    pastMax = 0;
    drawCircles();
    drawDev();
  }
}
ArrayList shapes;

boolean mouse = false;

float xoff = 0.0f;
float yoff = 0.0f;
float xincrement = 0; 
float yincrement = 0; 
float xoff1 = 0.0f;
float yoff1 = 0.0f;
float xincrement1 = 0; 
float yincrement1 = 0; 
float xoff2 = 0.0f;
float yoff2 = 0.0f;
float xincrement2 = 0; 
float yincrement2 = 0; 
int pastXL;
int pastYL;
int pastXR;
int pastYR;
int pastX;
int pastY;

public void drawCircles() {
  xoff += xincrement;
  yoff += yincrement;
  xoff1 += xincrement1;
  yoff1 += yincrement1;
  xoff2 += xincrement2;
  yoff2 += yincrement2;
  shapes.add(new Shape());
  if (three == true) {
    shapes.add(new Shape());
    shapes.add(new Shape());
  }
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0) {
      shapes.remove(i);
    }
  }
}

class Shape {
  float sSize;
  float xPosition;
  float yPosition;
  float opacity;
  float n = noise(xoff)*width;
  float n2 = noise(yoff)*height;
  float nL = noise(xoff1)*width;
  float n2L = noise(yoff1)*height;
  float nR = noise(xoff2)*width;
  float n2R = noise(yoff2)*height;
  float r;
  float g;
  float b;

  Shape() {
    if (three == true) {
      if (rand == 1) {
        xPosition = nL;
        yPosition = n2L;
        r = 95;
        g=0;
        b=0;
      } else if (rand == 2) {
        xPosition = nR;
        yPosition = n2R;
        r=0;
        g=0;
        b=95;
      } else {
        xPosition = n;
        yPosition = n2;
        r=0;
        g=95;
        b=0;
      }
    } else {
      xPosition = n;
      yPosition = n2;
      r = 0;
      g = 95;
      b = 0;
    }
    sSize = 30;
    opacity = 255;
  }
  public void run() {
    opacity -= disRate;
    noFill();
    strokeWeight(2);
    stroke(r, g, b, opacity);
    fill(r-40,g-40,b-40,opacity-50);
    ellipse(xPosition, yPosition, 30, 30);
    strokeWeight(2);
    if (three == true) {
      if (r==95) {
        line(xPosition, yPosition, pastXL, pastYL);
        pastXL = PApplet.parseInt(xPosition);
        pastYL = PApplet.parseInt(yPosition);
      }
      if (b==95) {
        line(xPosition, yPosition, pastXR, pastYR);
        pastXR = PApplet.parseInt(xPosition);
        pastYR = PApplet.parseInt(yPosition);
      }
    }
    if (g==95) {
      line(xPosition, yPosition, pastX, pastY);
      pastX = PApplet.parseInt(xPosition);
      pastY = PApplet.parseInt(yPosition);
    }
  }
}
String scheme = "Default";

public void drawDev() {
  if (dev == true) {
    stroke(0xff313030,50);
    for (int i=0; i<width; i+=20) {
      line(i, 0, i, height);
    }
    for (int w=0; w<height; w+=20) {
      line(0, w, width, w);
    }
    textFont(font);

    textAlign(RIGHT, TOP);
    stroke(255);
    fill(255);
    textSize(14);
    text(PApplet.parseInt(frameRate) + " fps", width, 0);
    text(shapes.size() + " circles", width, 16);
    textAlign(RIGHT, BOTTOM);
    if (scheme == "Default") {
      text("Default Scheme (Blue)", width, height-14);
    } else if (scheme == "Custom") {
      text("Custom Scheme", width, height-14);
    } else {
      text(scheme+" Scheme", width, height-14);
    }
    text("("+PApplet.parseInt(r)+", "+PApplet.parseInt(g)+", "+PApplet.parseInt(b)+")", width, height);
    textSize(32);

    textAlign(CENTER, TOP);
    if (three == true) {
      fill(95, 0, 0);
      stroke(95, 0, 0);
      line(noise(xoff1)*width, 0, noise(xoff1)*width, height);
      text("L", noise(xoff1)*width, 0);
      fill(0, 0, 95);
      stroke(0, 0, 95);
      line(noise(xoff2)*width, 0, noise(xoff2)*width, height);
      text("R", noise(xoff2)*width, 0);
    }
    fill(0, 95, 0);
    stroke(0, 95, 0);
    line(noise(xoff)*width, 0, noise(xoff)*width, height);
    text("M", noise(xoff)*width, 0);

    textAlign(LEFT, CENTER);
    if (three == true) {
      fill(95, 0, 0);
      stroke(95, 0, 0);
      line(0, noise(yoff1)*height, width, noise(yoff1)*height);
      text("L", 0, noise(yoff1)*height);
      fill(0, 0, 95);
      stroke(0, 0, 95);
      line(0, noise(yoff2)*height, width, noise(yoff2)*height);
      text("R", 0, noise(yoff2)*height);
    }
    fill(0, 95, 0);
    stroke(0, 95, 0);
    line(0, noise(yoff)*height, width, noise(yoff)*height);
    text("M", 0, noise(yoff)*height);
  }
}
boolean paused = false;
public void keyPressed() {
  if (key=='s'||key=='S') {
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:", "fileSelected");
  } else if (key == 'g') {
    if (three == false) {
      three = true;
    } else {
      three = false;
    }
  } else if (key == ' ') {
    if (paused == false) {
      song.pause();
      xincrement = 0; 
      yincrement = 0; 
      xincrement1 = 0; 
      yincrement1 = 0; 
      xincrement2 = 0; 
      yincrement2 = 0; 
      paused = true;
    } else {
      song.play();
      paused = false;
    }
  }else if (key == 'r') {
    r = random(255)-72;
    g = random(255)-72;
    b = random(255)-72;
    scheme = "Custom";
  }else if (key == '1') {
    r = 0;
    g = 0;
    b = 27;
    scheme = "Default";
  }else if (key == '2') {
    r = 46;
    g = 0;
    b = 20;
    scheme = "Red";
  }else if (key == '3') {
    r = 0;
    g = 23;
    b = 11;
    scheme = "Green";
  }else if (key == '4') {
    r = 149;
    g = 137;
    b = 100;
    scheme = "Beige";
  }else if (key == '5') {
    r = 0;
    g = 0;
    b = 0;
    scheme = "Black";
  }else if (key == '6') {
    r = 39;
    g = 5;
    b = 68;
    scheme = "Purple";
  }else if (key == 'p') {
    println("("+PApplet.parseInt(r)+", "+PApplet.parseInt(g)+", "+PApplet.parseInt(b)+")");
  }else if (key == 'd'){
    if (dev == false){
      dev = true;
    }else{
      dev = false;
    }
  }
}
//I'll do stuff here sometime...maybe
float disRate = 7.5f;

public void drawOpt(){
  if (frameRate < 47){
    disRate += 0.25f;
  }else if (frameRate > 58){
    if (disRate > 7.5f){
      disRate -= 0.25f;
    }
  }
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AndThenThereWere3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
