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
  
  //Filters
  if(keyPressed) {
    if (key == 'a' || key == 'A') {
      filter(THRESHOLD);
    }
  }
  if(keyPressed) {
    if (key == 's' || key == 'S') {
      filter(GRAY);
    }
  }
  if(keyPressed) {
    if (key == 'd' || key == 'D') {
      filter(INVERT);
    }
  }
  if(keyPressed) {
    if (key == 'f' || key == 'F') {
      filter(POSTERIZE, 10);
    }
  }
  if(keyPressed) {
    if (key == 'g' || key == 'G') {
      filter(BLUR,4);
    }
  }

  
  //JIC OF CAMERA SHY
  if(keyPressed) {
    if (key == 'b' || key == 'B') {
      background(255);
      text("Hello, how are you today?",190,325);
    }
  }
  //MORE MOVEMENT STUFF
  //r=>l
  y = y - 1;
  //u=>d
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
   x1 = width;
 }
 
 if (y1 > height) {
   y1 = height;
 }
 
//TEXT
fill(0);
PFont font;
font = loadFont("Baskerville-24.vlw"); 
textFont(font); 

fill(255,255,255,155);
noStroke();
rect(0,0,width,50);
rect(0,605,width,60);

fill(0,0,0,255);
text("If you don't like the camera just hold the letter 'B'", 15, 30); 
text("Change the filter using the keys A,S,D,F,and G", 15, 635); 

}

