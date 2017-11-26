int posX = 350;
int posY = 370;
int posZ = 0;

int speed = 1;

void setup(){
  size(700,700,P3D);
}

void draw(){
  background(#02C1B0);
  //println(frameRate);
  position();
  
  mapObjects();
}

void keyPressed(){
 if (key==' '){
   float x = random(700);
   float y = random(700);
   float z = random(15);
   camera(posX,posY,posZ+2,x,y,z,0,0,-1);
   println(x+" "+y+" "+z);
 }
}