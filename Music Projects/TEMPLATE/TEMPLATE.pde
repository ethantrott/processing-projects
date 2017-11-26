import ddf.minim.*;
import ddf.minim.analysis.*;
import javax.swing.*;
Minim minim;
AudioPlayer player;
FFT         fft;
int x = 1;

void setup(){
  size(700, 700, P3D);
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
  background(255);
  /*
  for(int i = 0; i < player.bufferSize() - 1; i++){
    //use player.[mix].get(i)*[150] for volume
  }
  */
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
