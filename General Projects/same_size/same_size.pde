
void setup(){
 size(700,700,P3D);
}

void draw(){
pushMatrix();
translate(0,0,100);
ellipse(width/2-50,height/2,50,50);
popMatrix();
pushMatrix();
translate(0,0,-100);
ellipse(width/2+50,height/2,51,51);
popMatrix();

line(width/2-50,height/2,100,width/2+50,height/2,-100);
}