void optimize() {
  if (frameRate > 32) {
    m.add(new Particle());
    m.add(new Particle());
  }
  println(m.size()+" particles");
}