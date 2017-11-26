import ddf.minim.analysis.*;
import ddf.minim.*;
  
import processing.video.*;

Movie myMovie;
Minim       minim;
AudioPlayer song;
FFT         fft;
BeatDetect beat;

int start = 0;
int pause = 1;

ArrayList poop;
boolean flag=false;
int distance=85;
int sum=0;

void setup() {
  fullScreen(P3D);
  myMovie = new Movie(this,"vid.mp4");
  myMovie.loop();
  myMovie.volume(0);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.play();
  beat = new BeatDetect();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  smooth();
  noCursor();
  poop = new ArrayList();
  for (int i=0; i<200; i++)
  {
    Particle P = new Particle();
    poop.add(P);
  }
  start=1;
}

void draw() {
  if (start == 1) {
    image(myMovie,0,0,width,height);
    fft.forward( song.mix );
    beat.detect(song.mix);
    if ( beat.isOnset() ) {
      flag = !flag;
    }
    //background(0);
    for (int i = 0; i < fft.specSize(); i++) {
      sum+=fft.getFreq(i);
    }
    float temp = sum/fft.specSize();
    distance = int(temp)*2;
    sum = 0;
    for (int i=0; i<poop.size(); i++)
    {
      Particle Pn1 = (Particle) poop.get(i);
      Pn1.display();
      Pn1.update();
      for (int j = i + 1; j < poop.size(); j++) {
        Particle Pn2 = (Particle) poop.get(j);
        Pn2.update();
        if (dist(Pn1.x, Pn1.y, Pn2.x, Pn2.y)< distance)
        {
          for (int k = j + 1; k < poop.size(); k++) {
            Particle Pn3 = (Particle) poop.get(k);
            if (dist(Pn3.x, Pn3.y, Pn2.x, Pn2.y)< distance) {
              if (flag) {
                stroke(255);
                fill(Pn3.c, 95); // method to access the class property
              } else {
                noFill();
                strokeWeight(1);
                stroke(255);
              }
              beginShape(TRIANGLES);
              vertex(Pn1.x, Pn1.y);
              vertex(Pn2.x, Pn2.y);
              vertex(Pn3.x, Pn3.y);
              endShape();
            }

            Pn3.update();
          }
        }
      }
    }
    if ( beat.isOnset() ) {
      flag = !flag;
    }
    
    fill(0, 100);
    noStroke();
    rect(0, 0, width, height);
  } else {
    background(0);
  }
}

class Particle {
  float x, y, r;
  color c;
  float id = random(-5, 5);
  int i=1, j=1;
  int band;
  Particle( )
  {
    if (id <= 0) {
      i = 1;
      j = 1;
    } else {
      i = -1;
      j = -1;
    }
    x = random(0, width);
    y = random(0, height);
    r = random(1, 5);
    band = int(random(fft.specSize()));
    int j = (int)random(0, 4);
    if (j==0)
    {
      c = color(#05CDE5);
    }
    if (j==1)
    {
      c = color(#FFB803);
    }
    if (j==2)
    {
      c = color(#FF035B);
    }
    if (j==3)
    {
      c = color(#3D3E3E);
    }
  }

  void display()
  {
    pushStyle();
    noStroke();
    if (flag == true) {
      fill(c);
    } else {
      fill(255);
    }
    ellipse(x, y, r, r);
    popStyle();
  }

  void update()
  {
    x = x + i*fft.getBand(band)/400+0.01;
    y = y + j*fft.getBand(band)/400+0.01;
    if (x < 0 || x> width || y<0 || y>height) {
      x = random(width);
      y = random(height);
      i = int(random(-1, 1));
      j = int(random(-1, 1));
      if (i == 0) {
        i = -1;
      }
      if (j == 0) {
        j = -1;
      }
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}