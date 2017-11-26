ArrayList shapes;
int limit = 10;
float r = 0;
float g = 0;
float b = 255;
  
void setup(){
  //fullScreen();
  size(400,400);
  shapes = new ArrayList();
}

 void keyPressed(){
    if (key=='='||key=='+'){
      limit+=1;
    }else if (key=='_'||key=='-'){
      limit-=1;
      if(limit<0){
        limit = 0;
      }
    }else if (key==' '){
        r = (random(255)+40);
        g = (random(255)+40);
        b = (random(255)+40);
      }
 }
 
 
void draw(){
    background(0);
    text("There are "+ limit + " circles on the screen.",0,10);
    shapes.add(new Shape());
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.t > limit){
    shapes.remove(i);
    }
  }
}

class Shape{
  float xPosition;
  float yPosition;
  float opacity;
  float sSize = 30;
  int t = 0;
  Shape() {
    xPosition = mouseX;
    yPosition = mouseY;
  }
  
  void run(){
    t+=1;
    sSize+=-30;
    stroke(r,g,b);
    strokeWeight(5);
    noFill();
    ellipse(xPosition,yPosition, sSize, sSize);
  }
}