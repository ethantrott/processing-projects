float s = random(800);
float z = random(800);
float q = random(800);
float l = random(800);

float r = random(255);
float g = random(255);
float b = random(255);

void setup(){
  size(800,800);
  frameRate(80);
  background(random(255),random(255),random(255));
}

void draw(){
  println(r);
  println(g);
  println(b);
  
  q = q + 10;
  l = l + 10;
  stroke(r,g,b);
  line(s,s,z,l);
  
  if (q > 800){
    q = random(800);
    s = random(800);
    z = random(800);
    
    //r = random(255);
    //g = random(255);
    //b = random(255);
  }
  
  if (l > 800){
    l = random(800);
    s = random(800);
    z = random(800);
    
    //r = random(255);
    //g = random(255);
    //b = random(255);
  }
}

void keyPressed(){
  background(random(255),random(255),random(255));
  r = random(255);
  g = random(255);
  b = random(255);
}
