class Design {

  DNA dna;
  float fitness;
  float x, y;
  int wh = 200;
  boolean rolloverOn;
  float chooseMouthShape = random(0, 1);
  float chooseEyeShape = random(0, 1);

  Rectangle r;

  // Create a new Design
  Design(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;

    fitness = 1;

    r = new Rectangle(int(x), int(y), int(wh), int(wh));
  }

  void display() {

    pushMatrix();
    translate(x, y);
    noStroke();

    if (rolloverOn) fill(0, 0.25);
    else noFill();

    // Draw the monster
    
    int dia = 100;
    int xx = 100;
    int yy = 100;
    
    fill(dna.genes[0], dna.genes[1], dna.genes[2]);
    ellipse(xx, yy, dia, dia);
    triangle(xx*0.54, yy*0.8, xx*0.8, xx*0.54, xx*0.52, yy*0.45);
    triangle(xx*1.45, yy*0.77, xx*1.2, xx*0.54, xx*1.54, yy*0.45);

    if (chooseEyeShape <0.5) {
      fill(dna.genes[4], dna.genes[3], dna.genes[2]);
      ellipse(xx-22, yy, dia/8, dia/8);
      ellipse(xx+22, yy, dia/8, dia/8);
    } else {
      rectMode(CENTER);
      fill(dna.genes[4], dna.genes[3], dna.genes[2]);
      rect(xx-22, yy, dia/8, dia/8);
      rect(xx+22, yy, dia/8, dia/8);
    }

    if (chooseMouthShape<0.3) {
      noStroke();
      fill(0);
      arc(xx, yy*1.1, dia/4, dia/4, 0, PI);
    } else if (chooseMouthShape>0.6) {
      noFill();
      stroke(0);
      strokeWeight(4);
      arc(xx, yy*1.1, dia/4, dia/4, 0, PI);
    } else {
      noFill();
      stroke(0);
      strokeWeight(4);
      arc(xx, yy*1.2, dia/4, dia/4, PI, TWO_PI);
    }

    popMatrix();

    textAlign(CENTER);
    if (rolloverOn) fill(0);
    else fill(0.25);
    text(int(fitness), x+wh/2, y+wh+20);
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  boolean clickedOn;
  boolean clicked(int mx, int my) {
    if (r.contains(mx, my)) clickedOn = true;
    return clickedOn;
  }

  void rollover(int mx, int my) {
    if (r.contains(mx, my)) {
      rolloverOn = true;
      if (mousePressed) {
        fitness += 0.25;
      }
    } else {
      rolloverOn = false;
    }
  }
}
