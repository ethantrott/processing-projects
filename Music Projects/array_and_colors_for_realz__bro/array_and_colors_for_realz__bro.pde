import ddf.minim.analysis.*;
import ddf.minim.*;
import javax.swing.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
int q = 600;
int x=1;
float r = random(255)-50;
float g = random(255)-50;
float b = random(255)-50;

float [] ballSize = new float[q];
float [] xPosition = new float[q];
float [] yPosition = new float[q];
float [] opacity = new float[q];

void setup(){
  size(displayWidth, displayHeight,P3D);
  final JFileChooser fc = new JFileChooser();
  int returnVal = fc.showOpenDialog(this);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
  File file = fc.getSelectedFile();
  minim = new Minim(this);
  song = minim.loadFile(file.getPath());
  song.play();
  }
  
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  
  for (int i=0; i<fft.specSize(); i++){
    ballSize[i] = fft.getBand(i)*5;
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    opacity[i] = 100;
  }
}

void draw(){
  background(r,g,b);
  fft.forward( song.mix );
  for(int i = 0; i < fft.specSize(); i++){
    opacity[i] = 100;
    if (fft.getBand(i)*3 < 3){
      opacity[i] = 0;
    }
    if(fft.getBand(i)*3 >= 200){
      opacity[i] = 0;
    }
    if(fft.getBand(i)*3 >= 250){
      r = random(255)-50;
      g = random(255)-50;
      b = random(255)-50;
    }
    fill(255,255,255,opacity[i]);
    noStroke();
    ellipse(xPosition[i],yPosition[i], fft.getBand(i)*3, fft.getBand(i)*3);
  }
}

void mousePressed(){
  for (int i=0; i<fft.specSize(); i++){
    xPosition[i] = random(width);
    yPosition[i] = random(height);
  }
}

void keyPressed(){
  song.pause();
  if(x < 0){
    song.play();
  }
  x = x * -1;
}
