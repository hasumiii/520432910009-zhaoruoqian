String txt = "replica";

void setup() {
  size(1000, 1000);
  background(0);

  fill(255);
  textSize(200);
  text(txt, 200, 550);
  
  for (int i = 1; i < 10; i++) {
    fill(255, 100-i*10);
    textSize(200);
    text(txt, 200, 550+i*20);
  }
  
  for (int i = 1; i < 10; i++) {
    fill(255, 100-i*10);
    textSize(200);
    text(txt, 200, 550-i*20);
  }
}
