class Particle {
  int lenOrigin;
  int lifespan = 255;
  float theta;
  float col;

  Particle (int lenOrigin) {
    this.lenOrigin = lenOrigin;
  }

  void display () {
    branch(lenOrigin);
  }

  void branch (float len) {
    rotate(PI/3);
    
    theta = map(sin(millis()/1000.0), -1, 1, 0, PI/6);
    col = map (len, 0, 100, 0, 255);
    
    stroke(col, 20, 255-col);
    strokeWeight(3);
    line(0, 0, 0, -len*0.6);
    
    fill(col, 20, 255-col);
    stroke(255);
    strokeWeight(1);
    ellipse(0, -len*0.6, 4, 4);
    
    if (len > 30) {
      pushMatrix();
      translate(0, -70);
      rotate(theta);
      branch(len*0.6);
      popMatrix();

      pushMatrix();
      translate(0, -70);
      rotate(-theta);
      branch(len*0.6);
      popMatrix();
    }
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
