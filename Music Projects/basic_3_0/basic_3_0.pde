import processing.sound.*;

FFT fft;
SoundFile file;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(512, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  file = new SoundFile(this, "/Users/Ethan/Desktop/gold.mp3");
  file.play();
  
  // patch the AudioIn
  fft.input(file);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i, height, i, height - spectrum[i]*height*5 );
  ellipse(width/2,height/2,spectrum[i]*800,spectrum[i]*800);
  } 
}