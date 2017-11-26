public void song(String theText) {
  println("Searched for: "+theText);
  ArrayList<Track> result = soundcloud.findTrack(theText);
  if (result!=null) {
    println("Tracks: "+result.size());
    if (paused == true) {
      stop();
      paused = false;
    }
    minim = new Minim(this);  
    player = minim.loadFile(result.get(0).getStreamUrl());
    player.play();

    cp5.get("song").hide();
    searching = false;
    loaded = true;
  } else {
    println("Error: no song found. Better luck next time!");
  }
}

public void clear() {
  cp5.get(Textfield.class, "song").clear();
}