PFont font;

Population population;
Button button01;
Button button02;

boolean clear;

void setup() {
  size(1000, 1000);
  colorMode(RGB, 1.0);
  font = createFont("Arial", 30);
  int popmax = 12;
  float mutationRate = 0.05;
  clear = false;

  population = new Population(mutationRate, popmax);

  button01 = new Button(width/2-150, height-100, 160, 20, "Generate new unit forms");
  button02 = new Button(width/2+30, height-100, 80, 20, "Commit");
}

void draw() {
  background(1.0);

  if (clear == false) {
    population.display();
    population.rollover(mouseX, mouseY);

    textAlign(CENTER);
    fill(0);
    text("Generation #:" + population.getGenerations(), width/2, height-60);
    
    textAlign(LEFT);
    fill(0);
    text("Press 'r' to reset.", 50, 50);
    text("Press 's' to save the image as png.", 50, 70);

    button01.display();
    button01.rollover(mouseX, mouseY);
    button02.display();
    button02.rollover(mouseX, mouseY);
  }

  if (clear == true) {
    population.displaySingle();
  }
}

void mousePressed() {
  if (button01.clicked(mouseX, mouseY)) {
    population.selection();
    population.reproduction();
  }

  if (button02.clicked(mouseX, mouseY)) {
    clear = true;
  }
}

void mouseReleased() {
  button01.released();
  button02.released();
}

void keyPressed() {
  if (key == 's') {
    saveFrame("#####.png");
  }

  if (key == 'r') {
    clear =  false;
    population.reset();
  }
}
