float s;
float x = random(1,6);

int r1 = 41;
int g1 = 153;
int b1 = 237;

int r2 = 237;
int g2 = 48;
int b2 = 225;

int r3 = 255;
int g3 = 247;
int b3 = 3;

int r4 = 255;
int g4 = 167;
int b4 = 3;

int r5 = 221;
int g5 = 3;
int b5 = 225;

void setup(){
  fullScreen();
  background(255);
  frameRate(10);
}

void draw(){
  x = random(0,6);
  
  if (x<2){
    fill(r1,g1,b1,120);
    ellipse(random(width),random(height),s,s);
    println("1");
  }
  
  if (x<3 || x>2){
    fill(r2,g2,b2,120);
    ellipse(random(width),random(height),s,s);
    println("2");
  }
  
  if (x<4 || x>3){
    fill(r3,g3,b3,120);
    ellipse(random(width),random(height),s,s);
    println("3");
  }
  
  if (x<5 || x>4){
    fill(r4,g4,b4,120);
    ellipse(random(width),random(height),s,s);
    println("4");
  }
  
  if (x<6 || x>5){
    fill(r5,g5,b5,120);
    ellipse(random(width),random(height),s,s);
    println("5");
  }
  
  s = random(30,121);
  noStroke();
}

void mousePressed(){
  background(255);
}