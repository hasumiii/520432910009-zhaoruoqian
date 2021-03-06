String txt = "replica";

int fr = 8;
int pointNum = 200; //the number of points
float amplitude = 300; //amplitude
float cycle = 1; //cycle
float wavelength = 250; //wavelength
float time;
float timeVelocity = TWO_PI/fr/cycle;
float timeEachPoint;
float timeCurrentPoint;

PVector pos;

void setup() {
  size(1000, 1000);
  background(0);
  frameRate(fr);
  pos = new PVector();
  timeEachPoint = TWO_PI / (wavelength/width * pointNum);
}

void draw() {
  background(0);
  time += timeVelocity; //time flies
  stroke(255);
  for (int i = 0; i < pointNum; i ++) {
    timeCurrentPoint = i * timeEachPoint;
    pos.x = (i+0.3)/pointNum*width; //formula
    pos.y = amplitude * sin(time + timeCurrentPoint) + height/2; //formula
    fill(mouseX/5, mouseY/5, mouseX/6+mouseY/6); //the color changes as the mouse moves
    textSize(20);
    text(txt, pos.x, pos.y);
  }
}
