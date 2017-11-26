int y = 800;

void setup() {
  fullScreen();
  background(255);
  stroke(255);  
  frameRate(30);
}

void draw() { 
  fill(255);
  PFont font;
  font = loadFont("hi.vlw"); 
  textFont(font); 
  text("Think.", 200, 400); 
  
  y = y - 1; 
 if (y < 0) {
  y = width;
 }
 
if (frameCount == 800) {
  println("Program Complete");
  delay (10000000);
}
  
  stroke(#F50F17);
  strokeWeight(0);
  line(0, y, width, y);  
  stroke(#FF8503);
  line(0, y+10, width, y+40);  
  stroke(#FEFF03);
  line(0, y+20, width, y+80);  
  stroke(#09EA34);
  line(0, y+30, width, y+120);  
  stroke(#0A93FF);
  line(0, y+40, width, y+160);  
  stroke(#4411D3);
  line(0, y+50, width, y+200);  
  stroke(0);
  line(0, y+60, width, y+240);  
} 