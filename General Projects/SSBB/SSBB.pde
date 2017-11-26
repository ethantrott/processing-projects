
float x = random(width+200,width-200);
float y = random(height+200,width-200);

int s = 0;
int n = 1;

int p = 0;

int z = 60;
int h = 0;

float x2 = x - z;
float y2 = y;
float x3 = x2 + h;
float y3 = y;

float x4 = x;
float y4 = y - z;
float x5 = x;
float y5 = y4 + h;
void setup(){
  fullScreen();
}

void draw(){
  float x2 = x - z;
  float y2 = y + 30;
  float x3 = x2 + h;
  float y3 = y + 30;

  float x4 = x - 30;
  float y4 = y - z;
  float x5 = x - 30;
  float y5 = y4 + h;
  if(s < 120){
    n = 1;
  }
  if(s == 120){
    n = 0;
    p = 1;
  }
  s = s + n;
  
  if(p == 1){
    if(h < 120){
      h = h + 1;
    }
    if(h == 120){
      x = random(height);
      y = random(width);
      s = 0;
      n = 1;
      z = 60;
      p = 0;
      h = 0;
    }
  }
  fill(#FF2424,155);
  stroke(255);
  strokeWeight(5);
  ellipse(x,y,s,s);
  stroke(205);
  strokeWeight(8);
  line(x2,y2,x3,y3);
  strokeWeight(10);
  line(x4,y4,x5,y5);
  noFill();
  stroke(0);
  strokeWeight(1);
  ellipse(x,y,s,s);
}

void keyPressed(){
      x = random(height);
      y = random(width);
      s = 0;
      n = 1;
      z = 60;
      p = 0;
      h = 0;
}

void mousePressed(){
  background(205);
  x = mouseX;
  y = mouseY;
}