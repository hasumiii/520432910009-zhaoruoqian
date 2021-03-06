class Particle {
  float dia;
  int time = 0;
  float fre = 0.000005;
  float ang;
  int lifespan = 1000;

  Particle () {
    dia = 5;
  }

  void display () {
    translate(100, 100);
    rotate(ang);
    
    for (int i = 0; i < 500; i++) {
      float circle = 200 + 50 * cos(time * fre * i);
      float col = map(circle, 150, 250, 0, 255);
      fill(col/2+map(mouseY, 0, height, 0, 100), 20, 255-col/2-map(mouseX, 0, width, 0, 100));
      noStroke();
      ellipse(circle*cos(i), circle*sin(i), dia, dia);
    }
  }

  void update() {
    time += 50;
    ang += 0.00001;
    lifespan --;
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }

  void keyPressed() {
    if (key == 'c') {
      background(0);
    }
  }
}
