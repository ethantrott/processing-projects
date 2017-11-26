import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
BeatDetect beat;

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
  //fullScreen(P3D);
  size(600,600,P3D);
  shapes = new ArrayList();
  selectInput("Select a song to analyze:","fileSelected");
}

void fileSelected(File selection){
   minim = new Minim(this);
   song = minim.loadFile(selection.getAbsolutePath());
   song.play();
   
   beat = new BeatDetect();
   fft = new FFT( song.bufferSize(), song.sampleRate() );
   noCursor();
   start = 1;
}

void draw(){
  if (start == 1){
    fft.forward( song.mix );
    beat.detect( song.mix );
    
    background(back);
    textAlign(RIGHT,TOP);
    stroke(255);
    text(int(frameRate) + " fps", width, 0);
    y += 1;
    y2 -= 1;
    
    noStroke();
    directionalLight(light, light, light, 0, 0, -1);
    
    pushMatrix();
    translate(width/2,height/2,100);
    rotateY(y);
    for(int i = 0; i < fft.specSize(); i++){
      if (fft.getBand(i)>pastMax){
        sphere(fft.getBand(i)/2);

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
    sphere(30);
    popMatrix();
    pushMatrix();
    translate((width/4)*3, height/4, eRadius);
    rotateY(y2);
    sphere(30);
    popMatrix();
    pushMatrix();
    translate((width/4)*3, (height/4)*3, eRadius);
    rotateY(y2);
    sphere(30);
    popMatrix();
    pushMatrix();
    translate(width/4, (height/4)*3, eRadius);
    rotateY(y2);
    sphere(30);
    popMatrix();
    eRadius *= 0.25;
    drawCircles();
    fill(fillSpheres);
    noStroke();
  }else{
    
  }
}