void back() {
  colorMode(RGB);

  float curveWidth = 10.0;
  float curveThickness = 10.0;
  float angleOffset = 0.9;

  float angleIncrement = map(xincrement, 0, 7*0.0000005, 0.0, 0.2);
  float angleA = 0.0;
  float angleB = angleA + angleOffset;

  float k = map(yincrement, 0, width, 2.0, 4.0);

  for (int i = 0; i < height; i += curveWidth*k) {
    noStroke();

    pushMatrix();
    //translate(0, 400);
    fill(80, 40);
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= width; x += 10) {
      //float y1 = i + (sin(angleA)* curveWidth);
      //float y2 = i + (sin(angleB)* curveWidth);
      float y1 = i + (sin(angleB) * curveWidth);
      float y2 = i + (cos(angleA) * curveWidth);
      vertex(x, y1);
      vertex(x, y2 + curveThickness);
      if (angleIncrement > 5.5) {
        angleA += angleIncrement;
      }
      angleB = angleA + angleOffset;
    }
    endShape();

    /*pushMatrix();
     scale(1.0, -1.0);
     beginShape(QUAD_STRIP);
     for (int x = 0; x <= width; x += 10) {
     //float y1 = i + (sin(angleA)* curveWidth);
     //float y2 = i + (sin(angleB)* curveWidth);
     float y1 = i + (sin(angleB) * curveWidth);
     float y2 = i + (cos(angleA) * curveWidth);
     vertex(x, y1);
     vertex(x, y2 + curveThickness);
     angleA += angleIncrement;
     angleB = angleA + angleOffset;
     }
     endShape();
     popMatrix();*/
    popMatrix();
    colorMode(HSB, 360, 100, 100);
  }
}

void sideLines() {
  int modif = 30;
  float x = ( width / 2 )/( (fft.specSize()/2) / modif );
  strokeWeight(3);
  for (int i = 0; i < fft.specSize()/2; i+=modif) {
    int t=(i/modif)+1;
    line( t*x, 0, t*x, 0 + fft.getBand(i)*4 );
    line( width-t*x, 0, width-t*x, 0 + fft.getBand(i)*4 );
    line( t*x, height, t*x, height - fft.getBand(i)*4 );
    line( width-t*x, height, width-t*x, height - fft.getBand(i)*4 );
  }
  strokeWeight(1);
}