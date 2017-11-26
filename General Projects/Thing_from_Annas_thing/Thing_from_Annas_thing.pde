
//All credit for this goes to Anna Trott!
float x = -1000;
float y = -1000;
float z = 0;

float xChange;
float yChange;
float zChange;

void setup(){
  //size(700,700);
  fullScreen(P3D);
  noCursor();
}

void draw(){
  xChange = random(-10,10);
  yChange = random(-10,10);
  zChange = random(-10,10);
  
  x += xChange;
  y += yChange;
  z += zChange;
  
  if (x>width||x<0){
    x = width/2;
    y = height/2;
    z = 0;
  }
  if (y>height||y<0){
    x = width/2;
    y = height/2;
    z = 0;
  }
  background(#C5F7BE);
  fill (#5FE5DD,155);
  translate(x,y,z);
  sphere(100);
}