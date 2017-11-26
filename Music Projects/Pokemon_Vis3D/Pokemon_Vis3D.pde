import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
BeatDetect beat;

PImage ground;
PImage main;
PImage small;
PImage body;
PImage head;
PImage logo;
PImage bodyg;
PImage headg;

int start = 0;

float eRadius;
float sSize = 100;
float pastMax = 0;
int y;
int y2;
boolean two = true;

int back = 106;
int light = 200;
int fillSpheres = 255;
int fillCircles = 206;

void setup(){
  fullScreen(P3D);
  //size(1100,610,P3D);
  shapes = new ArrayList();
  shapes1 = new ArrayList();
  ground = loadImage("lumiose.png");
  main = loadImage("pokeball.png");
  small = loadImage("sPokeball.gif");
  body = loadImage("body.png");
  head = loadImage("head.png");
  logo = loadImage("logo.png");
  bodyg = loadImage("bodyg.gif");
  headg = loadImage("headg.png");
  
   minim = new Minim(this);
   song = minim.loadFile("music.mp3");
   //song = minim.loadFile("/Users/Etham/Music/poKAZOOmon.mp3");
   song.play();
   
   beat = new BeatDetect();
   fft = new FFT( song.bufferSize(), song.sampleRate() );
   //noCursor();
   start = 1;
}

void draw(){
  if (start == 1){
    imageMode(CORNER);
    
    fft.forward( song.mix );
    beat.detect( song.mix );
    
    image(ground,0,0,width,height);
    imageMode(CENTER);
    textAlign(RIGHT,TOP);
    stroke(0);
    text(int(frameRate) + " fps      ", width, 0);
    y += 0;
    y2 -= 0.05;
    
    noStroke();
    directionalLight(light, light, light, 0, 0, -1);
    
    pushMatrix();
    translate(width/2,height/2,100);
    rotateY(y);
    for(int i = 0; i < fft.specSize(); i++){
      if (fft.getBand(i)>pastMax){
        if (fft.getBand(i)/2>30){
          image(main,0,0,fft.getBand(i)/2,fft.getBand(i)/2);
        }else{
          image(main,0,0,30,30);
        }
        xincrement = fft.getBand(i)/8000;
        yincrement = fft.getBand(i)/8000+0.005;
        xincrement1 = fft.getBand(i)/8001+0.001;
        yincrement1 = fft.getBand(i)/8001+0.003;
        pastMax=fft.getBand(i);
      }
      
    }
    pastMax = 0;
    popMatrix();
    if ( eRadius < sSize ) eRadius = sSize;
    if ( beat.isOnset() ) eRadius = sSize+(random(50));
    if ( eRadius < sSize ) eRadius = sSize;
    pushMatrix();
    translate(width/4, height/4, eRadius);
    rotateY(y2);
    image(small, 0,0,30,30);
    popMatrix();
    pushMatrix();
    translate((width/4)*3, height/4, eRadius);
    rotateY(y2);
    image(small, 0,0,30,30);
    popMatrix();
    pushMatrix();
    translate((width/4)*3, (height/4)*3, eRadius);
    rotateY(y2);
    image(small, 0,0,30,30);
    popMatrix();
    pushMatrix();
    translate(width/4, (height/4)*3, eRadius);
    rotateY(y2);
    image(small, 0,0,30,30);
    popMatrix();
    eRadius *= 0.25;
    drawCircles();
    fill(fillSpheres);
    noStroke();
    pushMatrix();
    translate(0,0,200);
    image(head, noise(xoff)*width, noise(yoff)*height,22,34);
    if (two == true){
      image(headg, noise(xoff1)*width, noise(yoff1)*height,32,48);
    }
    popMatrix();
    pushMatrix();
    translate(0,-80,202);
    image(logo, width/2, height-(height/6), 160, 59);
    popMatrix();
  }else{
    
  }
}