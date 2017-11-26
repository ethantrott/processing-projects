String scheme = "Default";

void drawDev() {
  if (dev == true) {
    stroke(#313030,50);
    for (int i=0; i<width; i+=20) {
      line(i, 0, i, height);
    }
    for (int w=0; w<height; w+=20) {
      line(0, w, width, w);
    }
    textFont(font);

    textAlign(RIGHT, TOP);
    stroke(255);
    fill(255);
    textSize(14);
    text(int(frameRate) + " fps", width, 0);
    text(shapes.size() + " circles", width, 16);
    textAlign(RIGHT, BOTTOM);
    if (scheme == "Default") {
      text("Default Scheme (Blue)", width, height-14);
    } else if (scheme == "Custom") {
      text("Custom Scheme", width, height-14);
    } else {
      text(scheme+" Scheme", width, height-14);
    }
    text("("+int(r)+", "+int(g)+", "+int(b)+")", width, height);
    textSize(32);

    textAlign(CENTER, TOP);
    if (three == true) {
      fill(95, 0, 0);
      stroke(95, 0, 0);
      line(noise(xoff1)*width, 0, noise(xoff1)*width, height);
      text("L", noise(xoff1)*width, 0);
      fill(0, 0, 95);
      stroke(0, 0, 95);
      line(noise(xoff2)*width, 0, noise(xoff2)*width, height);
      text("R", noise(xoff2)*width, 0);
    }
    fill(0, 95, 0);
    stroke(0, 95, 0);
    line(noise(xoff)*width, 0, noise(xoff)*width, height);
    text("M", noise(xoff)*width, 0);

    textAlign(LEFT, CENTER);
    if (three == true) {
      fill(95, 0, 0);
      stroke(95, 0, 0);
      line(0, noise(yoff1)*height, width, noise(yoff1)*height);
      text("L", 0, noise(yoff1)*height);
      fill(0, 0, 95);
      stroke(0, 0, 95);
      line(0, noise(yoff2)*height, width, noise(yoff2)*height);
      text("R", 0, noise(yoff2)*height);
    }
    fill(0, 95, 0);
    stroke(0, 95, 0);
    line(0, noise(yoff)*height, width, noise(yoff)*height);
    text("M", 0, noise(yoff)*height);
  }
}