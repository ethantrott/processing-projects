import ddf.minim.analysis.*;
import ddf.minim.*;

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

void setup(){
  fullScreen();
  shapes = new ArrayList();
  selectInput("Select a song to analyze:","fileSelected");
}

void fileSelected(File selection){
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
void draw(){
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
      if(fft.getBand(i) < 0.004){
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