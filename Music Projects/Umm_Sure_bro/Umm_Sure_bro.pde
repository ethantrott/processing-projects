//USE SPACE ODDITY FOR THIS PROJECT//
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT         fft;
int x = 1;

void setup(){
  size(700, 700);
  minim = new Minim(this);
  player = minim.loadFile("/Users/Ethan/Music/space.mp3");
  player.play();
  fft = new FFT( player.bufferSize(), player.sampleRate() );
}

void draw(){
  background(random(255),random(255),random(255));
  
  for(int i = 0; i < player.bufferSize() - 1; i++){
    //use player.[mix].get(i)*[150] for volume
    ellipse(player.left.get(i)*300,player.right.get(i)*300,100,100);
  }
  
  /*
  fft.forward( player.mix );
  for(int i = 0; i < fft.specSize(); i++){
    //use fft.getBand(i)*[4] for analysis
  }
  */
} 

void keyPressed(){
  player.pause();
  if(x < 0){
    player.play();
  }
  x = x * -1;
}