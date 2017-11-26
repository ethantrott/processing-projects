import ddf.minim.analysis.*;
import ddf.minim.*;
import javax.swing.*;

Minim       minim;
AudioPlayer song;
FFT         fft;

int x=1;

float a = random(255);
float b = random(255);
float c = random(255);

void setup(){
  size(700, 700,P3D);
  final JFileChooser fc = new JFileChooser();
  int returnVal = fc.showOpenDialog(this);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
  File file = fc.getSelectedFile();
  minim = new Minim(this);
  song = minim.loadFile(file.getPath());
  song.play();
  }
  
  fft = new FFT( song.bufferSize(), song.sampleRate() );
}

void draw(){
  background(a,b,c);
  stroke(255);
  noFill();
  
  fft.forward( song.mix );
  
  for(int i = 0; i < fft.specSize(); i++){
    line( i, 0, i, 0 + fft.getBand(i)*10 );
    line( width-i, 0, width-i, 0 + fft.getBand(i)*10 );
    line( i, height, i, height - fft.getBand(i)*10 );
    line( width-i, height, width-i, height - fft.getBand(i)*10 );
    ellipse(width/2, height/2, fft.getBand(i)*4,fft.getBand(i)*4);
  }

}

void mousePressed(){
  a= random(255);
  b= random(255);
  c= random(255);
}

void keyPressed(){
  song.pause();
  if(x < 0){
    song.play();
  }
  x = x * -1;
}


