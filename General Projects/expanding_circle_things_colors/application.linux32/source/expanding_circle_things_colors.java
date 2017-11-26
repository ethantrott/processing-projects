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

public class expanding_circle_things_colors extends PApplet {

int d = 325;
int u = 325;
int l = 325;
int r = 325;

int x = 50;

float r1 = random(x,255);
float g1 = random(x,255);
float b1 = random(x,255);

float r2 = r1 - 20;
float g2 = g1 - 20;
float b2 = b1 - 20;

public void setup(){
  size(650,650);
  background(r1+30,g1+30,b1+30);
  frameRate(150);
}

public void draw(){
 r = r + 1;
 d = d + 1;
 u = u - 1;
 l = l - 1;
 
 if (r > 700) {

  r1 = random(x,255);
  g1 = random(x,255);
  b1 = random(x,255);

  d = 325;
  u = 325;
  l = 325;
  r = 325;
  
  background(r1+40,g1+40,b1+40);
 }
 
 float r2 = r1 - 20;
 float g2 = g1 - 20;
 float b2 = b1 - 20;
 
  stroke(r2,g2,b2,155);
  strokeWeight(1);
  fill(r1,g1,b1);
  ellipse(r,325,50,50);
  ellipse(325,d,50,50);
  ellipse(r,d,50,50);
  ellipse(325,u,50,50);
  ellipse(r,u,50,50);
  ellipse(l,325,50,50);
  ellipse(l,u,50,50);
  ellipse(l,d,50,50);
  stroke(r2,g2,b2);
  fill(r1-55,g1-55,b1-55,25);
  ellipse(height/2,width/2,100,100);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "expanding_circle_things_colors" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
