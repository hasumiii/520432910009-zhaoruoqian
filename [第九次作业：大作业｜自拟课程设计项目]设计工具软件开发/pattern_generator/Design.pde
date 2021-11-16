class Design {

  DNA dna;
  float fitness;
  float x, y;
  int wh = 200;
  boolean rolloverOn;
  float b1 = random(0, 1);
  float b2 = random(0, 1);

  Rectangle r;

  // Create a new Design
  Design(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;

    fitness = 1;

    r = new Rectangle(int(x), int(y), int(wh), int(wh));
  }

  void displayShape(int xx, int yy) {

    pushMatrix();
    translate(x, y);

    color c1 = color(dna.genes[0], dna.genes[1], dna.genes[2]);
    color c2 = color(dna.genes[4], dna.genes[3], dna.genes[2]);
    color c3 = color(dna.genes[2], dna.genes[3], dna.genes[4]);
    color c4 = color(dna.genes[2], dna.genes[1], dna.genes[4]);
    color c5 = color(dna.genes[5], dna.genes[1], dna.genes[4]);

    //draw rectangles
    if (dna.genes[0] < 0.3) {
      //draw rect01
      noStroke();
      fill(c1);
      rect(xx, yy, 50, 50);
    } else if (dna.genes[0] <0.6 && dna.genes[0] >0.3) {
      //draw rect02
      noFill();
      stroke(c1);
      rect(xx, yy, 50, 50);
    } else if (dna.genes[0] <0.9 && dna.genes[0] >0.6) {
      //draw rect03
      noStroke();
      fill(c1);
      rect(xx, yy, 25, 25);
    }

    //draw arcs(larger)
    if (dna.genes[1] < 0.2) {
      //draw arc01
      noFill();
      stroke(c2);
      strokeWeight(10);
      arc(xx, yy, 100, 100, 0, HALF_PI);
    } else if (dna.genes[1] <0.4 && dna.genes[1] >= 0.2) {
      //draw arc02
      noFill();
      stroke(c2);
      strokeWeight(10);
      arc(xx+50, yy, 100, 100, HALF_PI, PI);
    } else if (dna.genes[1] <0.6 && dna.genes[1] >= 0.4) {
      //draw arc03
      noStroke();
      fill(c2);
      arc(xx, yy, 110, 110, 0, HALF_PI);
    } else if (dna.genes[1] <0.8 && dna.genes[1] >= 0.6) {
      //draw arc04
      noStroke();
      fill(c2);
      arc(xx+50, yy, 110, 110, HALF_PI, PI);
    }

    //draw circles
    if (dna.genes[2] < 0.2) {
      //draw circle01
      noFill();
      stroke(c3);
      strokeWeight(10);
      ellipse(xx, yy, 50, 50);
    } else if (dna.genes[2] <0.4 && dna.genes[2] >= 0.2) {
      //draw circle02
      noStroke();
      fill(c3);
      ellipse(xx, yy, 50, 50);
    } else if (dna.genes[2] <0.6 && dna.genes[2] >= 0.4) {
      //draw circle03
      noFill();
      stroke(c3);
      strokeWeight(5);
      ellipse(xx, yy, 30, 30);
    } else if (dna.genes[2] <0.8 && dna.genes[2] >= 0.6) {
      //draw circle04
      noStroke();
      fill(c3);
      ellipse(xx, yy, 30, 30);
    }

    //draw arcs(smaller)
    if (dna.genes[3] < 0.2) {
      //draw arc01
      noFill();
      stroke(c4);
      strokeWeight(10);
      arc(xx, yy, 50, 50, 0, HALF_PI);
    } else if (dna.genes[3] <0.4 && dna.genes[3] >= 0.2) {
      //draw arc02
      noFill();
      stroke(c4);
      strokeWeight(5);
      arc(xx+50, yy, 50, 50, HALF_PI, PI);
    } else if (dna.genes[3] <0.6 && dna.genes[3] >= 0.4) {
      //draw arc03
      noStroke();
      fill(c4);
      arc(xx, yy, 60, 60, 0, HALF_PI);
    } else if (dna.genes[3] <0.8 && dna.genes[3] >= 0.6) {
      //draw arc04
      noStroke();
      fill(c4);
      arc(xx+50, yy, 60, 60, HALF_PI, PI);
    }

    //draw quads
    if (dna.genes[4] < 0.1) {
      //draw quad01
      noFill();
      stroke(c5);
      strokeWeight(10);
      quad(xx+25, yy, xx+50, yy+25, xx+25, yy+50, xx, yy+25);
    } else if (dna.genes[3] <0.2 && dna.genes[4] >= 0.1) {
      //draw quad02
      noStroke();
      fill(c5);
      quad(xx+25, yy, xx+50, yy+25, xx+25, yy+50, xx, yy+25);
    } else if (dna.genes[4] <0.3 && dna.genes[4] >= 0.2) {
      //draw quad03
      noFill();
      stroke(c5);
      strokeWeight(5);
      quad(xx+25, yy+10, xx+40, yy+25, xx+25, yy+40, xx+10, yy+25);
    } else if (dna.genes[4] <0.4 && dna.genes[4] >= 0.3) {
      //draw quad04
      noStroke();
      fill(c5);
      quad(xx+25, yy+10, xx+40, yy+25, xx+25, yy+40, xx+10, yy+25);
    }

    popMatrix();
  }

  void displayText() {
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
