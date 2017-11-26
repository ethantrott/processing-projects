float x;
float y;
float h = 0;

void setup(){
  fullScreen();
  frameRate(30);
}

void draw(){
  float W = mouseX - x;
  float Z = mouseY - y;
  
  background(0);
  
  fill(255,255,255);
  ellipse(random(width),random(height),100,100);
  
  fill(h,h,h,105);
  rect(x,y,W,Z);
  
}

  void mousePressed() {
    x = mouseX;
    y = mouseY;
    h = 255;
  }
  
  void mouseReleased(){
    x = 0;
    y = 0;
    h = 0;
  }