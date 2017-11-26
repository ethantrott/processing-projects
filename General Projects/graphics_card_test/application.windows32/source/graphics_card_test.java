import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class graphics_card_test extends PApplet {

ArrayList shapes;
int min = 10;
int amount;
boolean done = false;
public void setup(){
  
  surface.setResizable(true);
  shapes = new ArrayList();
}

public void draw(){
  if (done == false){
  background(0xff09B739);
  textSize(22);
  text("Currently @ " + shapes.size() + " spheres @ " + PApplet.parseInt(frameRate) + " fps.", 0, 22);
  if (frameRate >= min){
    shapes.add(new Shape());
  }else{
    done();
  }
   for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
  }
  }else{
    background(0xffDE1616);
    textSize(22);
    text("<" + min + " fps reached @ " + amount + " spheres.", 0,22);
  }
}

class Shape{
  float xPosition;
  float yPosition;
  float zPosition;
 
  float yRot = 0;
  Shape() {
    xPosition = random(-1000,1000);
    yPosition = random(-1000,1000);
    zPosition = random(-1000,1000);
  }
  
  public void run(){
    yRot-=0.2f;
    
    noFill();
    noStroke();
    translate(xPosition,yPosition,zPosition);
    rotateY(yRot);
    sphere(30);
  }
}

public void keyPressed(){
  done = true;
  for (int i=0; i<shapes.size(); i++) {
    shapes.remove(i);
  }
  done = false;
}
public void done(){
  //surface.setSize(600,400);
  amount = shapes.size();
  //println("MINIMUM FRAMERATE REACHED: Score of " + shapes.size() + " spheres.");
  for (int i=0; i<shapes.size(); i++) {
    shapes.remove(i);
  }
  done = true;
}
  public void settings() {  size(400,34,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "graphics_card_test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
