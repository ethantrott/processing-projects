import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;

float a = random(255);
float b = random(255);
float c = random(255);

int x = 1;
int start = 0;

void setup(){
  size(700, 700);
  selectInput("Select a song to analyze:","fileSelected");
}

void fileSelected(File selection){
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();
  
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  start = 1;
  }
void draw(){
  if (start == 1){
  background(a);
  fft.forward( song.mix );
  for(int i = 0; i < fft.specSize(); i++){
    a= 255-(fft.getBand(i)*800);
  }
  text(a,10,10);
  }
}

void keyPressed(){
  song.pause();
  if(x < 0){
    song.play();
  }
  x = x * -1;
}