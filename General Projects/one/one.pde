//my variable things
int x = width;
int y = height;
int s = 80;
int x1 = 0;
int y1 = 0;
int r = #FC03CF;

//setup stuff
 void setup() {
  //Background
  size(650, 650);
  background(192, 64, 0);
  frameRate(300);
 }

//draw stuff
void draw() {
 //move stuff
  background(192, 64, 0);
  y = y - 1;
  x = x - 1;
  y1 = y1 + 1;
  x1 = x1 + 1;
  

 if (x < 0) {
  x = height;
 }
 
 if (y < 0) {
  y = width;
 }
 
 if (x1 > width) {
   x1 = 0;
 }
 
 if (y1 > height) {
   y1 = 0;
 }

//for lines//
stroke(13,77,77);
strokeWeight (8);

//L-up to R-down//
line(50, 50, 600, 600);

//R-up to L-down//
line(600, 50, 50, 600);

//MIDLE Circles//
stroke (0);
strokeWeight (3.4);

fill(#19FA3C,127);
ellipse(325,x,s,s);

fill(#E53535,127);
ellipse(x1,height/2,s,s);

fill(#358CE5,127);
ellipse(width/2,y1,s,s);

fill(#FF9F29,127);
ellipse(y,325,s,s);

}


