void setup() {
  size(650,650);
  background(#FF5858);
}	

void draw() {
  background(#FF5858);
  int s = second();
  int m = minute();
  int h = hour();
  stroke(0);
  strokeWeight(1);
  line(s*10.83, 0, s*10.83, 650/3);
  line(m*10.83, 650/3, m*10.83, 650/3*2);
  line(h*27.08, 650/3*2, h*27.08, 650);
  
  fill(255,255,255,155);
  noStroke();
  rect(0,0,120,30);
  rect(0,650/3,120,30);
  rect(0,650/3*2,120,30);
  rect(530,620,120,30);
  stroke(0);
  strokeWeight(1.7);
  line(0,650/3,650,650/3);
  line(0,650/3*2,650,650/3*2);
  strokeWeight(2.5);
  line(0,0,650,0);
  strokeWeight(4);
  line(0,650,650,650);
  
  PFont font;
  font = loadFont("fonty.vlw"); 
  textFont(font); 
  fill(0);
  text("Seconds", 17, 25); 
  text("Minutes",15,650/3+25);
  text("Hours",20,650/3*2+25);
  text(h + ":" + m + ":" + s,546,640);
}

