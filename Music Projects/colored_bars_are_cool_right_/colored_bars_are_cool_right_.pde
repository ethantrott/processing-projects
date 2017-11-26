import ddf.minim.*;
import ddf.minim.analysis.*;
import javax.swing.*;
Minim minim;
AudioPlayer player;
FFT         fft;
int x = 1;
float r = 0;
float g = 0;
float b = 0;

void setup(){
  size(700,300);
  noSmooth();
  frameRate(90);
  
  final JFileChooser fc = new JFileChooser();
  int returnVal = fc.showOpenDialog(this);
  if (returnVal == JFileChooser.APPROVE_OPTION) {
  File file = fc.getSelectedFile();
  minim = new Minim(this);
  player = minim.loadFile(file.getPath());
  player.play();
  }
  fft = new FFT( player.bufferSize(), player.sampleRate() );
}

void draw(){
  background(r,g,b);
  
  fft.forward( player.mix );
  for(int i = 0; i < fft.specSize(); i++){
    noFill();
    stroke(random(255),random(255),random(255));
    ellipse((width/2)-3,height/2, fft.getBand(i)*8,fft.getBand(i)*8);
    stroke(255);
    fill(random(255),random(255),random(255));
    rect(i+(width/2)-5,height/2,5,fft.getBand(i)*-4);
    rect(i+(width/2),height/2,-5,fft.getBand(i)*4);
    rect(((width/2)-i)-5,height/2,5,fft.getBand(i)*-4);
    rect((width/2)-i,height/2,-5,fft.getBand(i)*4);
  }
} 

void keyPressed(){
  player.pause();
  if(x < 0){
    player.play();
  }
  x = x * -1;

  if (key == 'b' || key == 'B') {
    r=0;
    g=0;
    b=0;
  }
}

void mousePressed(){
  r = random(255);
  g = random(255);
  b = random(255);
}
