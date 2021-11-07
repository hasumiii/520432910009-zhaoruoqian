class ParticleSystem {
  ArrayList <Particle> particles;

  ParticleSystem() {
    particles = new ArrayList();
  }

  void addParticle() {
    particles.add(new Particle(800));
  }

  void run() {
    for (int i = particles.size()-1; i >=0; i--) {
      Particle p = particles.get(i);
      p.display();
      p.keyPressed();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
