void setup() {
  size(1500, 1500);
  frameRate(12);
}

void draw() {
  background(0);
  //Color of the arc changes as the mouse moves.
  float r = mouseX/4;
  float g = mouseY/6;
  float b = (mouseX + mouseY)/7;

  for (int i = 0; i < 500; i +=3)
  {
    stroke(r, g, b);
    strokeWeight(3);
    noFill();
    arc(width/2, height/2, i*5, i*5, random(0, TWO_PI), random(0, TWO_PI));
    //gradient color
    r +=1.2;
    g +=1.2;
    b +=1.2;
  }
}
