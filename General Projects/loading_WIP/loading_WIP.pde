int s = 20;
float s1 = 20;
float s2 = 20;
int x = 1;
float x1 = 0.66;
float x2 = 0.33;

float a = random(255);
float a1 = random(255);
float a2 = random(255);
float b = random(255);
float b1 = random(255);
float b2 = random(255);
float c = random(255);
float c1 = random(255);
float c2 = random(255);

void setup(){
  size(300,100);
  frameRate(50);
}

void draw(){
  background(205);
  s = s + x;
  s1 = s1 + x1;
  s2 = s2 + x2;
  fill(a,b,c);
  ellipse(50,50,s,s);
  fill(a1,b1,c1);
  ellipse(150,50,s1,s1);
  fill(a2,b2,c2);
  ellipse(250,50,s2,s2);
  if(s > 100){
    x = -1;
    a = random(255);
    b = random(255);
    c = random(255);
  }
  if(s < 20){
    x = 1;
    a = random(255);
    b = random(255);
    c = random(255);
  }
  if(s1 > 100){
    x1 = -0.66;
    a1 = random(255);
    b1 = random(255);
    c1 = random(255);
  }
  if(s1 < 20){
    x1 = 0.66;
    a1 = random(255);
    b1 = random(255);
    c1 = random(255);
  }
  if(s2 > 100){
    x2 = -0.33;
    a2 = random(255);
    b2 = random(255);
    c2 = random(255);
  }
  if(s2 < 20){
    x2 = 0.33;
    a2 = random(255);
    b2 = random(255);
    c2 = random(255);
  }
}
