void mapObjects(){  
  fill(0,255,0);
  noStroke();
  
  building(255,0,0,350,350,0,2,2,10);
  building(255,255,0,150,150,0,2,2,8);
}

void building(int r, int g, int b, int x, int y, int z, int w, int l, int h){
  pushMatrix();
  fill(r,g,b);
  stroke(0);
  strokeWeight(2);
  translate(x,y,z+h/2);
  box(w,l,h);
  popMatrix();
}