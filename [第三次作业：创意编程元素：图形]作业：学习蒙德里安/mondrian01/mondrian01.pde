void setup() {
  size(1200, 800);
  background(255);
}

void draw() {
  mondrian();
}

int x_unit, y_unit, width_unit = 5, height_unit;
boolean button;
color c;

void mondrian() {
  x_unit = int(random(0, 12));
  y_unit = int(random(0, 8));
  width_unit = int(random(1, 6));
  height_unit = int(random(1, 4));
  c = color(random(0, 255));
  
  for (int i = 100*x_unit; i < 100*x_unit+100*width_unit; i++) {
    for (int j = 100*y_unit; j < 100*y_unit+100*height_unit; j++) {
      if (get(i, j) != color(255)) {
        button = false;
      }
    }
  }

  if (mousePressed) {
    fill(c);
    stroke(0);
    strokeWeight(12);
    rect(100*x_unit, 100*y_unit, 100*width_unit, 100*height_unit);
  }
}
