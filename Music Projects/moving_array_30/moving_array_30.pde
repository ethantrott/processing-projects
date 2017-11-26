import processing.sound.*;

FFT fft;
SoundFile file;
int q = 512;
float[] spectrum = new float[q];

float [] ballSize = new float[q];
float [] xPosition = new float[q];
float [] yPosition = new float[q];
float [] xSpeed = new float[q];
float [] ySpeed = new float[q];
float [] colorR = new float[q];
float [] colorG = new float[q];
float [] colorB = new float[q];

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
    colorR[i] = random(255);
    colorG[i] = random(255);
    colorB[i] = random(255);
  }
}

void draw(){
  noCursor();
  background(#05043B);
  fft.analyze(spectrum);
  for(int i = 0; i < q; i++){
    spectrum[i] = spectrum[i]*900;
    xSpeed[i] = spectrum[i]/10;
    ySpeed[i] = spectrum[i]/10;
    fill(colorR[i],colorG[i],colorB[i],100);
    noStroke();
    xPosition[i] += xSpeed[i];
    yPosition[i] += ySpeed[i];
    fill(colorR[i],colorG[i],colorB[i],100);
    ellipse(xPosition[i],yPosition[i],spectrum[i],spectrum[i]);

    if (xPosition[i] < 0){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if (xPosition[i] > width){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if(yPosition[i] < 0){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
    if(yPosition[i] > height){
      xPosition[i] = width/2;
      yPosition[i] = height/2;
    }
  }
}