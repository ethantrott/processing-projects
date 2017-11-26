void keyPressed() {
  if (key== ESC) {
    if (searching == true) {
      key=0;
      cp5.get("song").hide();
      searching = false;
      clear();

      if (paused == true) {
        player.play();
        paused = false;
      }
    }
  } else if (key=='s') {
    if (searching == false) {
      if (loaded == true) {
        player.pause();
        paused = true;
      }
      cp5.get("song").show();
      searching = true;
    }
  }
}