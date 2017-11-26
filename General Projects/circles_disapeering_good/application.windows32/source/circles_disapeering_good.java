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

public class circles_disapeering_good extends PApplet {

ArrayList shapes;
int limit = 10;
float r = 0;
float g = 0;
float b = 255;
  
public void setup(){
  //fullScreen();
  
  shapes = new ArrayList();
  surface.setResizable(true);
}

 public void keyPressed(){
    if (key=='='||key=='+'){
      limit+=1;
    }else if (key=='_'||key=='-'){
      limit-=1;
      if(limit<0){
        limit = 0;
      }
    }else if (key==' '){
        r = (random(255)+40);
        g = (random(255)+40);
        b = (random(255)+40);
      }
 }
 
 
public void draw(){
    background(0);
    text("There are "+ limit + " circles on the screen.",0,10);
    shapes.add(new Shape());
  for (int i=0; i<shapes.size(); i++) {
    Shape s = (Shape) shapes.get(i);
    s.run();
    if (s.t > limit){
    shapes.remove(i);
    }
  }
}

class Shape{
  float xPosition;
  float yPosition;
  float opacity;
  float sSize = 30;
  int t = 0;
  Shape() {
    xPosition = mouseX;
    yPosition = mouseY;
  }
  
  public void run(){
    t+=1;
    sSize+=-30;
    stroke(r,g,b);
    strokeWeight(5);
    noFill();
    ellipse(xPosition,yPosition, sSize, sSize);
  }
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "circles_disapeering_good" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
