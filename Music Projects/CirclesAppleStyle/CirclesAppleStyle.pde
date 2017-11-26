import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
FFT         fft;

boolean left = true;
boolean fade = false;

float px, py;
float radius = 50;
float angle;
float radius2 = 20;

int start = 0;
int x = 1;

float a = random(255);
float b = random(255);
float c = random(255);

void setup()
{
  fullScreen();
  //size(800, 800);
  //surface.setResizable(true);
  background(0);
  selectInput("Select a song to analyze:", "fileSelected");
}
void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath(), 2048);
  song.play();
  beat = new BeatDetect();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  noCursor();
  start = 1;
}

void draw()
{
  if (start == 1) {
    angle++;
    beat.detect(song.mix);
    fft.forward( song.mix );
    if ( beat.isOnset() ) {
      if (left == true) {
        left = false;
      } else {
        left = true;
      }
      radius2 = random(70, height/3.5);
      a = random(255);
      b = random(255);
      c = random(255);
    }
    if (fade == true) {
      noStroke();
      fill(0, 0, 0, 70);
      rect(0, 0, width, height);
    }
    pushMatrix();
    translate(width/2, height/2);
    if (left == true) {
      rotate(radians(angle));
    } else {
      rotate(radians(angle)*-1);
    }

    noStroke();
    fill(a, b, c, 120);
    ellipse(radius2, radius2, 20, 20);
    popMatrix();

    stroke(a+40, b+40, c+40, 120);
    radius = fft.getBand(23)*(height/98);
    px = width/2 + cos(radians(angle))*(radius);
    py = height/2 + sin(radians(angle))*(radius);
    line(width/2, height/2, px, py);

    if (angle == 360) {
      fade = true;
      angle = 0;
    }
    if (angle == 10) {
      fade = false;
    }
  }
}

void keyPressed() {
  if (key=='s'||key=='S') {
    start = -1;
    song.pause();
    background(0);
    selectInput("Select a song to analyze:", "fileSelected");
  } else {
    start = 0;
    song.pause();
    if (x < 0) {
      song.play();
      start = 1;
    }
    x = x * -1;
  }
}