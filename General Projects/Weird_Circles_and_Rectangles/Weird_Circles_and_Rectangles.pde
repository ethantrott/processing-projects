ArrayList shapes;
void setup(){
  fullScreen();
  //size(400,400);
  surface.setResizable(true);
  shapes = new ArrayList();
  background(255);
}

void draw(){
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
  }
  noStroke();
  fill(255);
  rect(0,0,170,15);
  fill(0);
  text("There are " + shapes.size() + " Moving Things", 0,10);
  fill(255);
  rect(width-40,0,40,15);
  fill(0);
  text(int(frameRate) + " fps", width-40,10);
  stroke(0);
}
class Shape{
  float rS = 40;
  float eS = 30;
  
  float x;
  float y;
  
  float rR;
  float rG;
  float rB;
  float eR;
  float eG;
  float eB;
  Shape() {
     x = random(width);
     y = random(height);
    
    rR = random(255);
    rG = random(255);
    rB = random(255);
    eR = random(255);
    eG = random(255);
    eB = random(255);
  }
  
  void run(){
    x += random(-10,10);
    y += random(-10,10);
    
    fill(rR,rG,rB,100);
    rect(x-rS/2,y-rS/2,rS,rS);
    fill(eR,eG,eB,100);
    ellipse(x,y,eS,eS);
  }
}
void keyPressed(){
  shapes.add(new Shape());
}

void mousePressed(){
  background(255);
}