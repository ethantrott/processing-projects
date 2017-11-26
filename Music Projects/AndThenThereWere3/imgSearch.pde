void search(){
  println(name);
  searchTerm = name + "+Album+Art";
  url = "https://www.googleapis.com/customsearch/v1?key=AIzaSyAQMyzp8Mrx99K2uGAoTcnsugtw_Lv4ryE&cx=006156123637990767949:qfufsc1qaxc&q="+ searchTerm + "&num=1&searchType=image&fileType="+type+"&alt=json";
  String lines[] = loadStrings(url);
  rLink = lines[52];
  println(rLink);
  nURL = rLink.substring(12,rLink.length()-2);  // Returns "CC"
  println(nURL);
  back = loadImage(nURL);
}