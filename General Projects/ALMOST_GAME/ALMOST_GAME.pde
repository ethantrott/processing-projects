float x = random(800);
float y = random(800);

float xd;
float yd;

float yxd;
float yyd;

void setup(){
  size(800,800);
  frameRate(30);
}

void draw(){
  background(205);
  
  xd = mouseX - x;
  yd = mouseY - y;
  
  yxd = x - mouseX;
  yyd = y - mouseY;
  
  fill(255);
  ellipse(x,y,100,100);
  fill(0);
  ellipse(x,y,1,1);
}

void mousePressed(){
 if(yxd < 15){
  if (xd < 10){
    x = random(800);
    y = random(800);
  }
  
  if (yd < 10){
    x = random(800);
    y = random(800);
  }
 }
 
 if(yyd < 15){
  if (xd < 10){
    x = random(800);
    y = random(800);
  }
  
  if (yd < 10){
    x = random(800);
    y = random(800);
  }
 }
 
 if(xd > 15){
  if (yxd > 10){
    x = random(800);
    y = random(800);
  }
  
  if (yyd > 10){
    x = random(800);
    y = random(800);
  }
 }
 
 if(yd > 15){
  if (yxd > 10){
    x = random(800);
    y = random(800);
  }
  
  if (yyd > 10){
    x = random(800);
    y = random(800);
  }
 }
}
