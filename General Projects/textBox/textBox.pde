import controlP5.*;

ControlP5 cp5;

String textValue = "";

void setup() {
  size(700,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("song")
     .setPosition((width/2)-100,(height/2)-20)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     .setAutoClear(true)
     ;
}

void draw() {
  background(0);
}



public void song(String theText) {
  println(theText);
}