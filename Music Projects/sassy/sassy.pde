import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
FFT         fft;

float angle2;
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
    angle2++;

    fft.forward( song.mix );
    
    fill(0,0,0,6.5);
    noStroke();
    rect(0,0,width,height);
    radius2 = random(70, 200);
    a = random(255);
    b = random(255);
    c = random(255);

    stroke(a, b, c, 120);

    pushMatrix();
    translate(width/2,height/2);
    rotate(random(360));
    float radius = fft.getBand(42)*13;
    line(0,0,radius,radius);
    popMatrix();
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