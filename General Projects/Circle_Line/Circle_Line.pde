int x = 0;
int y = height;
int z = 8;
int a = 0;

float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
  size(1280,800);
  frameRate(10000);
  background(r,g,b);
}

void draw(){
  println(y);
  
   x = x + z;
   y = y + a;
   
  if (x > width){
    z = 0;
    a = 8;
  }
  
  if (y > 800){
    z = -8;
    a = 0;
  }
  
  if (x < 0){
    z = 0;
    a = -8;
  }
  
  if (y < 0){
    z = 8;
    a = 0;
    
    x = 0;
    y = 0;
    
    background(random(255),random(255),random(255));
  }

  
  stroke(random(255),random(255),random(255));
  strokeWeight(5);
  line(width/2,height/2,x,y);
  stroke(0);
  strokeWeight(1);
  //fill(255,255,255,155);
  //ellipse(width/2,height/2,100,100);
}
