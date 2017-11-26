int s = 10;
float h = 0;
float q = 0;
int r = 0;
float z = 0;
float x = random(width);
float y = random(height);
void setup(){
  size(650,650);
}

void draw(){
  //Percent stuff
  background(205);
  q = ((s/2)*(s/2))* 3.14;
  r = width * height;
  h = (q / r);
  z = h * 100;
  //circle stuff
  fill(255);
  ellipse(width/2,height/2,s,s);
  //more percent stuff
  fill(0);
  text(z,0,20);
  //random point
  fill(random(255),random(255),random(255));
  ellipse(x,y,5,5);
  
  if (x < (width - s)
  ){
    if ( x > (0 + s)){
      if (y < (height - y)){
        if ( y > (0 + y)){
          println(s);
        }
      }
    }
  }
}

//circle size change
void keyPressed(){
  s = s + 5;
  x = random(width);
  y = random(height);
}
