void setup(){
size(500,128);
frameRate(30);
}

void draw(){
float r1 = random(255);
float g1 = random(255);
float b1 = random(255);
background(r1,g1,b1);
float r = random(255);
float g = random(255);
float b = random(255);

PFont font;
font = loadFont("yo.vlw"); 
textFont(font); 
stroke(r,g,b);
fill(r,g,b);
text("Jaxb",175,85);
}
