import controlP5.*;

ControlP5 cp5;

boolean searching = true;
boolean paused = false;
boolean loaded, looking = false;

PImage photo;
XML xml;
String query, tag;
String apikey = "ee24c4040e6b8e5b7c66c5aefc2b60aa";
String api  = "https://api.flickr.com/services/rest/?method=flickr.photos.search&"; 

void setup() {
  //fullScreen();
  size(800, 800);
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);
  imageMode(CENTER);

  cp5.addTextfield("pic")
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
  textSize(24);
  if (searching == true) {
    cursor();

    textAlign(CENTER, CENTER);
    text("Search for a pic on Flickr:", width/2, height/4);
  } else {
    noCursor();
    if (loaded == true) {
      //stuff
      image(photo, width/2, height/2);
      textAlign(LEFT, TOP);
      textSize(12);
      text("Press 'S' to choose a different pic.", 0, 0);
    } else {
      text("Press 'S' to choose a pic!", width/2, height/4);
    }
  }

  if (looking == true) {
    text("No results for '"+tag+"' ... sorry :(", width/2, 3*height/4);
  }
}

void keyPressed() {
  if (key== ESC) {
    if (searching == true) {
      key=0;
      cp5.get("pic").hide();
      searching = false;
      clear();
    }
  } else if (key=='s') {
    if (searching == false) {
      cp5.get("pic").show();
      searching = true;
    }
  }
}

public void pic(String theText) {
  println("******** New Search Initiated ********");
  looking = true;
  
  println("Searching for: '"+theText+"'...");
  tag=theText;
  query = api + "api_key=" + apikey + "&text="+tag+"&sort=relevance"; 

  xml = loadXML(query); 
  XML[] displayPhoto = xml.getChildren("photos/photo");
  println("Recieved XML Search Results...");
  
  if (displayPhoto!=null) {
    String farm = displayPhoto[1].getString("farm");
    String server = displayPhoto[1].getString("server");
    String id = displayPhoto[1].getString("id");
    String secret = displayPhoto[1].getString("secret");
    String imgPath = "https://farm"+farm+".staticflickr.com/"+server+"/"+id+"_"+secret+"_c.jpg";
    println("Found Image URL: '"+imgPath+"'...");
    println("Downloading Full Image of '"+theText+"'...");
    photo = loadImage( imgPath );
    photo.resize(width, 0);
    cp5.get("pic").hide();
    searching = false;
    loaded = true;
    looking=false;
    println("Loaded: "+theText);
  } else {
    println("Error: no pic found. Better luck next time!");
  }
}