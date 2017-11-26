float x = random(800);
float y = random(800);
float x1 = random(800);
float y1 = random(800);
float x2 = random(800);
float y2 = random(800);
float x3 = random(800);
float y3 = random(800);

float r = random(255);
float g = random(255);
float b = random(255);

int n = 0;

void setup(){
size(800,800);
frameRate(10);
}

void draw(){
fill(r,g,b,5);
stroke(r+50,g+50,b+50);
strokeWeight(6);
quad(x,y,x1,y1,x2,y2,x3,y3);
fill(255);
noStroke();
rect(0,0,50,20);
fill(0);
text(n,10,15);
}

void keyPressed(){
x = random(800);
y = random(800);
x1 = random(800);
y1 = random(800);
x2 = random(800);
y2 = random(800);
x3 = random(800);
y3 = random(800);

r = random(255);
g = random(255);
b = random(255);

n = n + 1;
}

void mousePressed(){
  x = -540;
  y = -540;
  x1 = -540;
  y1 = -540;
  x2 = -540;
  y2 = -540;
  x3 = -540;
  y3 = -540;
  
  n = 0;
  
  background(205);
}
