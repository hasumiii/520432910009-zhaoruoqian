//Reference: https://openprocessing.org/sketch/422446

ParticleSystem ps;

void setup() {
  size(1000, 1000);
  frameRate(20);
  ps = new ParticleSystem();
}

void draw() {
  background(0);
  
  if (mousePressed) {
    ps.addParticle();
  }
  
  ps.run();
}
