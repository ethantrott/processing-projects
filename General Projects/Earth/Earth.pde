int x = 0;
int y = 0;
int z = 0;

void setup(){
fullScreen(P3D);
background(0);
}

void draw(){
background(0);
  z = z + 1;
  x = x + 3;
  y = y + 7;
lights();
  
pushMatrix();
rotateY(z);
fill(#F6FF08);
sphere(500);
popMatrix();
  
pushMatrix();
translate(width/2, height/2, 0); 
rotateY(x);
fill(#026CDB);
sphere(200);
popMatrix();

pushMatrix();
translate(1000,300,0);
rotateY(y);
fill(100);
sphere(50);
popMatrix();
}