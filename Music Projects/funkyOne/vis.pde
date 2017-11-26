int n;
int minRad;
int maxRad;
float nfAng;
float nfTime;

void vis_setup() {
  background(0);
  noFill();
  stroke(255, 15);
}

void vis_draw() {
  
  n = 107;
  minRad = 11;
  maxRad = 146;
  nfAng = fft.getBand(52)/260;
  nfTime = 0.006;

  println(fft.getBand(52)/26);

  noStroke();
  fill(0, 0, 0, 3);
  rect(0, 0, width, height);
  
  stroke(255, 15);
  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<n; i++) {
    float ang = map(i, 0, n, 0, TWO_PI);
    float rad = map(noise(i*nfAng, frameCount*nfTime), 0, 1, minRad, maxRad);
    float x = rad * cos(ang);
    float y = rad * sin(ang);
    curveVertex(x, y);
  }
  endShape(CLOSE);

  /*if ( beat.isOnset() ) {
   background(0);
   }*/
}