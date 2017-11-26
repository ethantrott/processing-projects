ArrayList shapes;
int min = 10;
int amount;
boolean done = false;
void setup(){
  size(400,34,P3D);
  surface.setResizable(true);
  shapes = new ArrayList();
}

void draw(){
  if (done == false){
  background(#09B739);
  textSize(22);
  text("Currently @ " + shapes.size() + " spheres @ " + int(frameRate) + " fps.", 0, 22);
  if (frameRate >= min){
    shapes.add(new Shape());
  }else{
    done();
  }
   for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
  }
  }else{
    background(#DE1616);
    textSize(22);
    text("<" + min + " fps reached @ " + amount + " spheres.", 0,22);
  }
}

class Shape{
  float xPosition;
  float yPosition;
  float zPosition;
 
  float yRot = 0;
  Shape() {
    xPosition = random(-1000,1000);
    yPosition = random(-1000,1000);
    zPosition = random(-1000,1000);
  }
  
  void run(){
    yRot-=0.2;
    
    noFill();
    noStroke();
    translate(xPosition,yPosition,zPosition);
    rotateY(yRot);
    sphere(30);
  }
}

void keyPressed(){
  done = true;
  for (int i=0; i<shapes.size(); i++) {
    shapes.remove(i);
  }
  done = false;
}