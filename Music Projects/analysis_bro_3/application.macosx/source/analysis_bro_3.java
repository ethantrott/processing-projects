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

public class analysis_bro_3 extends PApplet {




Minim       minim;
AudioPlayer song;
FFT         fft;
BeatDetect beat;

int start = 0;
float shape = 1;
float a = random(200);
float b = random(100);
float c = random(200);
float eRadius;

public void setup(){
  
  shapes = new ArrayList();
  selectInput("Select a song to analyze:","fileSelected");
}

public void fileSelected(File selection){
   minim = new Minim(this);
   song = minim.loadFile(selection.getAbsolutePath());
   song.play();
  beat = new BeatDetect();
  
  ellipseMode(RADIUS);
  eRadius = 20;
   fft = new FFT( song.bufferSize(), song.sampleRate() );
   setup_circles();
   start = 1;
}
public void draw(){
  if (start == 1){
  background(a-50,b-50,c-50);
  
  fft.forward( song.mix );
  draw_circles();
  stroke(255);
  noFill();
  for(int i = 0; i < fft.specSize(); i++){
    line( i*2, 0, i*2, 0 + fft.getBand(i)*10 );
    line( width-i*2, 0, width-i*2, 0 + fft.getBand(i)*10 );
    line( i*2, height, i*2, height - fft.getBand(i)*10 );
    line( width-i*2, height, width-i*2, height - fft.getBand(i)*10 );
    ellipse(width/2, height/2, fft.getBand(i)*4,fft.getBand(i)*4);
   
    if(fft.getBand(i)*4 >= 513){
      a = random(200);
      b = random(100);
      c = random(200);
    }
    if(fft.getBand(i)*4 >= 603){
      shape = 2;
      }
      if(fft.getBand(i) < 0.004f){
      shape = 1;
      }
  }
  drawCircles();
  }
}

/*void mousePressed(){
  a= random(255);
  b= random(100);
  c= random(255);
}*/
int ballCount = 499;
float [] size = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xSpeed = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];

public void setup_circles(){
  for (int q=0; q<ballCount; q++){
    size[q] = random(10,40);
    xPosition[q] = random(width);
    yPosition[q] = random(height);
    xSpeed[q] = random(-25,25);
    ySpeed[q] = random(-15,15);
    colorR[q] = random(255);
    colorG[q] = random(255);
    colorB[q] = random(255);
  }
}

public void draw_circles(){
  for (int q=0; q<ballCount; q++){
    xPosition[q] += xSpeed[q];
    yPosition[q] += ySpeed[q];
    fill(colorR[q],colorG[q],colorB[q],40);
    noStroke();
   if (shape == 1){
    ellipse(xPosition[q],yPosition[q],size[q],size[q]);
   }
   if (shape == 2){
    rect(xPosition[q]-(size[q]/2),yPosition[q]-(size[q]/2),size[q],size[q]);
   }
    if (xPosition[q] < 0){
      xPosition[q] = random(width);;
      yPosition[q] = random(height);
    }
    if (xPosition[q] > width){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
    if(yPosition[q] < 0){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
    if(yPosition[q] > height){
      xPosition[q] = random(width);
      yPosition[q] = random(height);
    }
  }
}
ArrayList shapes;
float w = 1;
int back = 0;
int t = 1;

public void drawCircles(){
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  if (mousePressed){
    shapes.add(new Shape());
  }
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0){
    shapes.remove(i);
    }
  }
}

class Shape{
  float sSize;
  float xPosition;
  float yPosition;
  float opacity;
  float r;
  float g;
  float b;

  Shape() {
    xPosition = mouseX;
    yPosition = mouseY;
    sSize = 30;
    opacity = 255;
    r = 255;
    g = 255;
    b = 255;
  }
  
  public void run(){
    
    sSize += 2;
    opacity -= 10;
    if ( beat.isOnset() ) eRadius = sSize+(random(50));
    noFill();
    strokeWeight(2);
    stroke(r,g,b,opacity);
if ( eRadius < sSize ) eRadius = sSize;
    if (w == 1){
    ellipse(xPosition, yPosition, eRadius, eRadius);
    }else if (w == -1){
    rect(xPosition-(sSize/2), yPosition-(sSize/2), eRadius, eRadius);
    }
    eRadius *= 0.25f;
  }
}
int x=1;

public void keyPressed(){
  if (key=='s'||key=='S'){
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:","fileSelected");
    float a = random(200);
    float b = random(100);
    float c = random(200);

  }else if(key == '`'||key == '~'){
    w = w * -1;
  }
  else{
  song.pause();
  if(x < 0){
    song.play();
  }
  x = x * -1;
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "analysis_bro_3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
