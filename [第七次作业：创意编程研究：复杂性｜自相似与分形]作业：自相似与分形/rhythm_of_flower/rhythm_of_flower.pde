ParticleSystem ps;

void setup() {
  size(1000, 1000);
  frameRate(20);
  ps = new ParticleSystem();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  if (mousePressed) {
    ps.addParticle();
  }
  
  ps.run();
}
