PFont font;

Population population;
Button button;

void setup() {
  size(800,800);
  colorMode(RGB,1.0);
  font = createFont("微软雅黑",24);
  int popmax = 6;
  float mutationRate = 0.05; 

  population = new Population(mutationRate,popmax);

  button = new Button(width/2-80,height-100,160,20, "重新生成小怪兽");
}

void draw() {
  background(1.0);

  population.display();
  population.rollover(mouseX,mouseY);

  textAlign(CENTER);
  fill(0);
  text("Generation #:" + population.getGenerations(),width/2,height-60);

  button.display();
  button.rollover(mouseX,mouseY);
}

void mousePressed() {
  if (button.clicked(mouseX,mouseY)) {
    population.selection();
    population.reproduction();
  }
}

void mouseReleased() {
  button.released();
}
