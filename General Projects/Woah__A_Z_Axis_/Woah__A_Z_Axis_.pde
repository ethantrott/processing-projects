float z = -500;
float x = 5;
float y = 0;
int d = 120;
int s = 1;
void setup(){
fullScreen(P3D); 
//size(400,400,P3D);
surface.setResizable(true);
noCursor();
frameRate(200);
}

void draw(){
  background(0);
  directionalLight(255, 255, 255, -3, 5, 0);

  y-=0.2;
  
  if (z > 400){
    x = -5;
  }
  
  if (z < -400){
    x = 5;
  }
  
  println(frameRate + " fps");
  z = z + x;
  sphereDetail(d);
  stroke(0,0,0,100);
  fill(255);
  pushMatrix();
  translate(width/2,height/2,z);
  rotateY(y);
  sphere(100);
  popMatrix();
}

void keyPressed(){
  /*if(key=='='){
    d+=1;
  }else if(key=='-'){
    d-=1;
  }else if(key=='p'){
    println("d = " + d);
  }*/
}