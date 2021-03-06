void setup() {
  size(1200, 800);
  background(255);
  frameRate(1);
}

void draw() {
  mondrian();
}

void mondrian() {
  //draw lines
  stroke(0);
  strokeWeight(10);
  line(100,0,100,800);
  line(500,0,500,600);
  line(600,0,600,800);
  line(700,0,700,800);
  line(1100,0,1100,700);
  line(0,150,1100,150);
  line(600,250,1200,250);
  line(0,600,600,600);
  line(0,700,100,700);
  line(600,700,1200,700);
  
  //draw rectangles
  fill(random(255));
  rect(0,0,100,150);
  fill(random(255));
  rect(600,0,100,150);
  fill(random(255));
  rect(100,150,400,450);
  fill(random(255));
  rect(0,600,100,100);
  fill(random(255));
  rect(0,700,100,100);
  fill(random(255));
  rect(600,150,100,100);
  fill(random(255));
  rect(700,250,400,350);
  fill(random(255));
  rect(600,700,100,100);
}
