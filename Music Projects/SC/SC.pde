import de.voidplus.soundcloud.*;
import ddf.minim.*;
import controlP5.*;

ControlP5 cp5;
SoundCloud soundcloud;
Minim minim;
AudioPlayer player;

boolean searching = true;
boolean paused = false;
boolean loaded = false;

void setup() {
  fullScreen();
  // http://soundcloud.com/you/apps for APP_CLIENT_ID and APP_CLIENT_SECRET
  soundcloud = new SoundCloud("SO07S2McouELPN9QvxJiIvXLYBfzQqWZ", "ZNzbTU26i0hfQHZ5vGs4Lic6VH23JWOi");

  // If you need any permissions:
   soundcloud.login("ethan.trott@rsu35.org", "eth@ncpt14");

  // show user details
  User me = soundcloud.get("me");
  println("User Info: "+ me);

  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);
  minim = new Minim(this);

  cp5.addTextfield("song")
    .setPosition((width/2)-100, (height/2)-20)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setAutoClear(true)
    ;
}

void draw() {
  background(0);
  textSize(32);

  if (searching == true) {
    cursor();

    textAlign(CENTER, CENTER);
    text("Search for a song on SoundCloud:", width/2, height/4);
  } else {
    noCursor();
    if (loaded == true) {
      visualizer();
      textAlign(LEFT, TOP);
      textSize(12);
      text("Press 'S' to choose a different song.", 0, 0);
    } else {
      text("Press 'S' to choose a song!", width/2, height/4);
    }
  }
}

void stop() {
  player.close();
  minim.stop();
}