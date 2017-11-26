float x = 0;

void setup(){
  size(1080,600,P3D);
  surface.setResizable(true);
  
}
void draw(){
  x-=0.2; 
  background(0,0,0);
  translate(width/2, height/2, 0);
  rotateY(x);
  fill(80,1,80);
  sphere(170);
}