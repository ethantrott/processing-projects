void setup(){
  size(800,800,P3D);
  frameRate(1);
}

void draw(){
  lights();
  background(7);
  pushMatrix();
  translate(random(width),random(height),random(200));
  box(100);
  popMatrix();
  pushMatrix();
  translate(random(width),random(height),random(200));
  box(100);
  popMatrix();
  pushMatrix();
  translate(random(width),random(height),random(200));
  box(100);
  popMatrix();
  pushMatrix();
  translate(random(width),random(height),random(200));
  box(100);
  popMatrix();
  pushMatrix();
  translate(random(width),random(height),random(200));
  box(100);
  popMatrix();

}