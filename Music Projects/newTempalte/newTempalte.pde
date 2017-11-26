import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
//BeatDetect beat;

int start = 0;
int pause = 1;

void setup() {
  fullScreen(P3D);
  selectInput("Select a song to analyze:", "fileSelected");
}

void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();
  //beat = new BeatDetect();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  
  start=1;
}

void draw(){
  if (start == 1){
    fft.forward( song.mix );
    //beat.detect(song.mix);
    
    
  }else{
    background(0);
  }
}

void keyPressed(){
  if (key=='s'||key=='S'){
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:","fileSelected");
  }
  else{
  song.pause();
  if(pause < 0){
    song.play();
  }
  pause = pause * -1;
  }
}
/*
if ( beat.isOnset() ){
  
}

*/