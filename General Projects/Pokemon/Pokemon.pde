ArrayList images;

void setup() {
  size(100,100,P3D);
  images = new ArrayList<PImage>();
  //noCursor();
  frameRate(60);
  imageMode(CENTER);
  images.add(new Image());
}

void draw() {
  background(0);
  for (int i=0; i<images.size(); i++) {
    Image s = (Image) images.get(i);
    s.run();
    if (s.opacity < 0) {
      images.remove(i);
      images.add(new Image());
    }
  }
}

class Image {
  PImage img;
  int num;
  String load;
  float xPosition;
  float yPosition;
  float opacity;
  int size;

  Image() {
    num = int(random(1, 1054));
    load = "C:/Users/trott/Desktop/Stuff/Pokemon Animated/("+num+").gif";
    img = loadImage(load);
    size = int(random(50, 50));
    xPosition = width/2;
    yPosition = height/2;
    opacity = 255;
  }

  void run() {
    opacity -= 4;
    tint(255, opacity);
    img.resize(0, height);
    image(img, xPosition, yPosition);
  }
}