import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;


int start = 0;

ArrayList<Particle> m;
int count = 100; //How many particles to spawn
float spdLimit = 1000;

final static int SUNSET = 2;
final static int ICE = 1;
final static int FIRE = 3;
final static int THEME = ICE;

color ja;
float pastMax = 0;
float xoff = 0.0;
float yoff = 0.0;
float xincrement = 0; 
float yincrement = 0; 
int pastX;
int pastY;
float xPosition;
float yPosition;
float speedX, speedY;

boolean paused = false;
boolean circ = false;
boolean back = true;

void setup() {  
  fullScreen(P3D);
  //size(600,400);
  colorMode(HSB, 360, 100, 100);
  m = new ArrayList<Particle>();
  for (int i = 0; i<count; i++) {
    m.add(new Particle());
  }
  selectInput("Select a song to analyze:", "fileSelected");
}
void fileSelected(File selection) {
  minim = new Minim(this);
  song = minim.loadFile(selection.getAbsolutePath());
  song.play();

  fft = new FFT( song.bufferSize(), song.sampleRate() );

  noCursor();
  start = 1;
}

void draw() {
  println(frameRate);
  if (start == 1) {
    noStroke();
    fill(0, 40);
    rect(-1, -1, width + 1, height + 1);
    if (back == true) {
      back();
    }
    fill(50, 50, 255);
    for (Particle a : m) {
      a.update();
      a.draw();
    }
    if (circ == true) {
      stroke(255);
      ellipse(xPosition, yPosition, 10, 10);
    }
  }
}

class Particle {

  PVector prev, pos, mouse = new PVector(), spd, acc;
  color col;
  float turnFactor = random(3, 10);

  public Particle() {
    pos = new PVector(random(width), random(height));
    prev = new PVector(pos.x, pos.y);
    spd = new PVector(random(20), random(20));
    acc = new PVector();

    switch(THEME) {
    case SUNSET:
      col = color(random(320, 420) % 360, 90, 100);
      break;
    case ICE:
      col = color(random(155, 210), random(40, 100), 100);
      break;
    case FIRE:
      col = color(random(45), 90, 100);
      break;
    default:
      col = color(random(360), 90, 100);
      break;
    }
  }

  void update() {
    prev = new PVector(pos.x, pos.y);
    if (pos.x > width || pos.x < 0) {
      spd.x *= -0.9;
    }
    if (pos.y < 0 || pos.y > height ) {
      spd.y *= -0.9;
    }
    mouse.set(xPosition, yPosition);
    PVector attraction = new PVector(mouse.x, mouse.y);
    attraction.sub(pos);
    acc.set(attraction);
    acc.normalize();
    acc.div(turnFactor/10);
    spd.add(acc);
    spd.limit(spdLimit * (1f/60));
    pos.add(spd);
  }

  void draw() {
    fft.forward( song.mix );
    for (int i = 0; i < fft.specSize(); i++) {
      if (fft.getBand(i)>pastMax) {
        xincrement = fft.getBand(i)/800000;
        yincrement = fft.getBand(i)/800000+fft.getBand(i)/8000000;
        pastMax=fft.getBand(i);
      }
      speedX = fft.getBand(i)*100;
      speedY = fft.getBand(i)*100;
    }
    xoff += xincrement*1.25;
    yoff += yincrement*1.25;

    xPosition = noise(xoff)*width;
    yPosition = noise(yoff)*height;
    //stroke(255);
    //ellipse(xPosition,yPosition,10,10);
    if (ja == 1) {
      col = color(random(155, 210), random(40, 100), 100);
    } else if (ja ==2) {
      col = color(random(320, 420) % 360, 90, 100);
    } else if (ja ==3) {
      col = color(random(45), 90, 100);
    } else if (ja ==4) {
      col = color(random(360), 90, 100);
    }
    stroke(col);
    strokeWeight(1);
    line(prev.x, prev.y, pos.x, pos.y);
    pastMax = 0;
    sideLines();
  }
}

void keyPressed() {
  if (key=='s'||key=='S') {
    start = -1;
    song.pause();
    selectInput("Select a song to analyze:", "fileSelected");
  } else if (key == ' ') {
    if (paused == false) {
      song.pause();
      xincrement = 0; 
      yincrement = 0; 
      paused = true;
    } else {
      song.play();
      paused = false;
    }
  } else if (key=='g') {
    if (circ == true) {
      circ = false;
    } else {
      circ=true;
    }
  } else if (key=='1') {
    ja = 1;
  } else if (key=='2') {
    ja = 2;
  } else if (key=='3') {
    ja = 3;
  } else if (key=='4') {
    ja = 4;
  } else if (key=='b') {
    back ^= true;
  }
}