import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
BeatDetect beat;

int start = 0;
int h=0;

void setup() {
  fullScreen(P3D);
  selectInput("Select a song to analyze:", "fileSelected");
}

void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();
  beat = new BeatDetect();
  fft = new FFT( song.bufferSize(), song.sampleRate() );

  start=1;
}

void draw() {
  if (start == 1) {
    fft.forward( song.mix );
    beat.detect(song.mix);

    //background(#FF035F);
    float w = width/270.0f;
    stroke(-1, 200); 
    for (int i=0; i<270; i+=8) {
      float l = fft.getBand(i/4);
      //float l = fft.getBand(i)*10;
      float r =  10;
      float p =  10;
      line(i*w, 0, i*w, height/2+l);
      ellipse(i*w, height/2+l, r, r);
      line(i*w+5, height, i*w+5, height/2-l); 
      ellipse(i*w+5, height/2-l, p, p);
    }
    h++;
    
    fill(#FF035F,70);
    noStroke();
    rect(0,0,width,height);
  } else {
    background(0);
  }
}

/*
if ( beat.isOnset() ){
 
 }
 
 */