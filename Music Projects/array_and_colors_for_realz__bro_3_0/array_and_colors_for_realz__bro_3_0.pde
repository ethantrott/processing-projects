import processing.sound.*;

FFT fft;
SoundFile file;
int q = 512;
float[] spectrum = new float[q];

int x=1;
float r = random(255)-50;
float g = random(255)-50;
float b = random(255)-50;

float [] ballSize = new float[q];
float [] xPosition = new float[q];
float [] yPosition = new float[q];
float [] opacity = new float[q];

void setup(){
  fullScreen();
  fft = new FFT(this, q);
  file = new SoundFile(this, "/Users/Ethan/Music/songs.mp3");
  file.play();
  
  fft.input(file);
  
  for (int i=0; i<q; i++){
    ballSize[i] = spectrum[i]*800;
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    opacity[i] = 100;
  }
}

void draw(){
  noCursor();
  background(r,g,b);
  fft.analyze(spectrum);
  for(int i = 0; i < q; i++){
    spectrum[i] = spectrum[i]*900;
    opacity[i] = 100;
    if (spectrum[i]< 3){
      opacity[i] = 0;
    }
    if(spectrum[i] >= 200){
      opacity[i] = 0;
    }
    if(spectrum[i] >= 120){
      r = random(255)-50;
      g = random(255)-50;
      b = random(255)-50;
    }
    fill(255,255,255,opacity[i]);
    noStroke();
    ellipse(xPosition[i],yPosition[i], spectrum[i], spectrum[i]);
  }
}

void mousePressed(){
  for (int i=0; i<q; i++){
    xPosition[i] = random(width);
    yPosition[i] = random(height);
  }
}