import processing.video.*;

int numPixels;
int[] backgroundPixels;
Capture video;

void setup(){
 size(1280, 800, P2D); 
 video = new Capture(this, width, height, 24);
 numPixels = video.width * video.height;
 backgroundPixels = new int[numPixels];
 loadPixels();
}

void draw(){
  if (video.available()) {
    video.read();
    video.loadPixels();
    int presenceSum = 0;
    for (int i = 0; i < numPixels; i++) {
       color NOWColor = video.pixels[i];
       color BKColor = backgroundPixels[i];
       
       int NOWR = (NOWColor >> 16) & 0xFF;
       int NOWG = (NOWColor >> 8) & 0xFF;
       int NOWB = NOWColor & 0xFF;
       
       int BKR = (BKColor >> 16) & 0xFF;
       int BKG = (BKColor >> 8) & 0xFF;
       int BKB = BKColor & 0xFF;
       
       int CHGR = abs(NOWR - BKR);
       int CHGG = abs(NOWG - BKG);
       int CHGB = abs(NOWB - BKB);
       
       presenceSum += CHGR + CHGG + CHGB;
       
       pixels[i] = color(CHGR, CHGG, CHGB);
     }
   updatePixels();
     
  }
}

void keyPressed() {
  video.loadPixels();
  arraycopy(video.pixels, backgroundPixels);
}
