ArrayList shapes;
int back = 0;
int t = 1;
float r = 255;
float g = 255;
float b = 255;
void setup(){
  size(500,500);
  frameRate(300);
  shapes = new ArrayList();
}

void draw(){
  background(back);
    shapes.add(new Shape());
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.opacity < 0){
    shapes.remove(i);
    }
  }
}

class Shape{
  float sSize;
  float xPosition;
  float yPosition;
  float opacity;


  Shape() {
    xPosition = mouseX;
    yPosition = mouseY;
    sSize = 15;
    opacity = 255;
  }
  
  void run(){
    opacity -= 6;
    
    noStroke();
    fill(r+100,g+100,b+100,opacity);
    ellipse(xPosition, yPosition, sSize, sSize);
  }
}

void keyPressed(){
  if(key == 'b'||key == 'B'){
    if (t == 1){
    back = 255;
    }
    if ( t == -1){
      back = 0;
    }
    t = t * -1;
  }
  if (key == ' '){
    r = random(255);
    g = random(255);
    b = random(255);
  }
}