import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
FFT         fftL;
FFT         fftR;

boolean imageBETAenabled = false;

PFont font;

int start = 0;
boolean three = true;
boolean backG = false;
float pastMax = 0;
float pastMaxL = 0;
float pastMaxR = 0;

int rand;
boolean dev = false;

float r = 12;
float g = 2;
float b = 39;

String name;
String searchTerm;
String url;
String rLink;
String nURL;
PImage back;
String type = "jpg";

void setup() {
  fullScreen(P3D);
  font = createFont("Arial", 32);
  shapes = new ArrayList();
  selectInput("Select a song to analyze:", "fileSelected");
}

void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  if (imageBETAenabled == true) {
    name = selection.getAbsolutePath().substring(21, selection.getAbsolutePath().length()-4);
    search();
  }
  song.play();

  fft = new FFT( song.bufferSize(), song.sampleRate() );
  fftL = new FFT( song.bufferSize(), song.sampleRate() );
  fftR = new FFT( song.bufferSize(), song.sampleRate() );

  noCursor();
  start = 1;
}

void draw() {
  background(r, g, b);

  if (start == 1) {
    if (imageBETAenabled == true) {
      if (backG == true) {
        tint(255, 70);
        image(back, 0, 0, width, height);
      }
    }
    drawOpt();
    rand = int(random(1, 4));
    fft.forward( song.mix );
    if (three == true) {
      fftL.forward( song.left );
      fftR.forward( song.right );
    }

    strokeWeight(0.25);
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