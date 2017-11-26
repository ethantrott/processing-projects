float x = random(650);
float y = random(650);
float x1 = random(650);
float y1 = random(650);
float x2 = random(650);
float y2 = random(650);
float x3 = random(650);
float y3 = random(650);
float q = random(650);
float w = random(650);

int z = 270;

void setup(){
size(650,650);
frameRate(1.5);
}

void draw(){
float g = random(20,105);
float b = random(118,255);
background(0,g,b);

float x = random(z,650);
float y = random(650);
float x1 = random(z,650);
float y1 = random(650);
float x2 = random(z,650);
float y2 = random(650);
float x3 = random(z,650);
float y3 = random(650);
float q = 100;
float w = 100;

//main
stroke(0);
fill(255,255,255,145);
ellipse(q,w,170,170);

noStroke();
fill(0);
ellipse(q,w,5,5);
//2nd
stroke(0);
fill(#7EAEFF,155);
ellipse(x,y,120,120);

noStroke();
fill(0);
ellipse(x,y,5,5);

stroke(0);
line(q,w,x,y);
//3rd
stroke(0);
fill(#7EAEFF,155);
ellipse(x1,y1,120,120);

noStroke();
fill(0);
ellipse(x1,y1,5,5);

stroke(0);
line(q,w,x1,y1);
//4th
stroke(0);
fill(#7EAEFF,155);
ellipse(x2,y2,120,120);

noStroke();
fill(0);
ellipse(x2,y2,5,5);

stroke(0);
line(q,w,x2,y2);
//4th
stroke(0);
fill(#7EAEFF,155);
ellipse(x3,y3,120,120);

noStroke();
fill(0);
ellipse(x3,y3,5,5);

stroke(0);
line(q,w,x3,y3);
}
