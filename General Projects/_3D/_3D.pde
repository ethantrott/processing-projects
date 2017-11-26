int s = 0;
float y = 0;
void setup() {
  size(screen.width/2, screen.height/2, P3D);
}

void draw() {
  background(205);
  translate(width/2, height/2, 0);
  sphereDetail(s);
  rotateY(y);
  sphere(100);
}

void keyPressed() {
  if (key=='j'||key=='J'){
    s += 1;
    println("Sphere Detail set to " + s);
  }
  else if (key =='k'||key=='K'){
    s -= 1;
    if(s<0){
      s = 0;
    }
    println("Sphere Detail set to " + s);
  }
  else if (key=='a'||key=='A'){
    y += 1;
    println("Y Rotation set to " + int(y));
  }
  else if (key =='s'||key=='S'){
    y -= 1;
    println("Y Rotation set to " + int(y));
  }else{
    println("-----REPORT-----");
    println("Sphere Detail = " + s);
    println("Y Rotation = " + int(y));
  }
}
