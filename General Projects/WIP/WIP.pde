
int x = -640;
int y = -400;
void setup(){
 fullScreen();
 frameRate(1000); 
 background(255);
}

void draw(){
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
  }
 noStroke();
 fill(r,g,b,120);
 ellipse(x,y,40,40);
 
 if(keyPressed) {
    if (key == 'c' || key == 'C') {
      int x = -640;
      int y = -400;
      background(255);
    }
  }
}