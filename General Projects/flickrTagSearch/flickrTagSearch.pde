PImage img;
XML xml;
String query, apikey, tag;
String api  = "https://api.flickr.com/services/rest/?method=flickr.photos.search&"; 

void setup() { 
  size(800, 800); 

  apikey="ee24c4040e6b8e5b7c66c5aefc2b60aa";
  tag="butterflies,purple";
  query = api + "api_key=" + apikey + "&tags="+tag+"&extras=url_o"; 
  println(query); 

  xml = loadXML(query); 
  XML[] displayPhoto = xml.getChildren("photos/photo"); 
  String imgPath = displayPhoto[2].getString("url_o");
  println(imgPath);
  PImage photo = loadImage( imgPath ); 
  image(photo, 0, 0, width, height); 
} 