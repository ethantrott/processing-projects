//CAMERA STUFF
import processing.video.*;
Capture myCapture;

//VARIABLES
int x = width;
int y = height;
int s = 80;
int x1 = 0;
int y1 = 0;

//SETUPSTUFF
void setup() 
{
  //camera and movement stuff
  size(650, 650);
  myCapture = new Capture(this, width, height, 30);
  frameRate(300);
}
//MORE CAMERA STUFF
void captureEvent(Capture myCapture) {
myCapture.read();
}
//DRAW STUFF
void draw() {
  //CAMERA STUFF AGAIN
  image(myCapture, 0, 0);
  filter(GRAY);
  if(keyPressed) {
    if (key == 'b' || key == 'B') {
      background(255);
    }
  }
  //MORE MOVEMENT STUFF
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
 
//TEXT
fill(0);
PFont font;
font = loadFont("Baskerville-24.vlw"); 
textFont(font); 
text("If you don't like the camera please press B", 15, 30); 

//FOR 2 LINES BELOW 
stroke(215,18,55);
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

