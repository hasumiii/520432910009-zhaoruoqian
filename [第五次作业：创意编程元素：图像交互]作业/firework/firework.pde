Button[] button;
Canvas[] canvas;

float buttonWidth = 50;
float buttonHeight = 20;
color brushColor = 255;

float canvasWidth = 50;
float canvasHeight = 20;
color canvasColor = 255;

float rate = random(3, 5);
float tailLength = 80;
float dia;

void setup() {
  size(1000, 1000);
  background(255);
  button = new Button[10];
  canvas = new Canvas[10];

  //initiating
  for (int i = 0; i < button.length; i ++) {
    color cOne = color(162+10*i, 191+5*i, 232-10*i);
    button[i] = new Button(50, 50+(buttonHeight+10)*i, buttonWidth, buttonHeight, cOne);
  }

  for (int i = 0; i < canvas.length; i ++) {
    color cTwo = color(20*i);
    canvas[i] = new Canvas(900, 50+(canvasHeight+10)*i, canvasWidth, canvasHeight, cTwo);
  }
}

void draw() {
  //change the size of the brush by pressing UP or DOWN on the keyboard
  float density = 2;
  if (keyCode == UP) {
    density ++;
  } else if (keyCode == DOWN) {
    density --;
  }
  
  //change the diameter of the circle by pressing LEFT and RIGHT on the keyboard
  dia = 10;
  if (keyCode == LEFT) {
    dia -= 5;
  } else if (keyCode == RIGHT) {
    dia += 5;
  }
  
  //draw
  if (mousePressed) {
    noStroke();
    fill(brushColor);
    ellipse(mouseX, mouseY, dia, dia);
    noStroke();
    for (int i = 0; i < tailLength; i ++) {
      fill(color((red(brushColor)+rate*i), (green(brushColor)-rate*i), (blue(brushColor)-rate*i)), 100-2*i);
      ellipse(mouseX, mouseY-density*i, dia, dia);
    }
  }

  //change the color of the brush by pressing the buttons on the left
  for (int i = 0; i < button.length; i ++) {
    button[i].showButton();
    if (button[i].pickColor) {
      brushColor = button[i].buttonColor;
      button[i].pickColor = false;
    }
  }

  //change the color of the background by pressing the buttons on the right
  for (int i = 0; i < canvas.length; i ++) {
    canvas[i].showCanvas();
    if (canvas[i].chooseColor) {
      canvasColor = canvas[i].canvasColor;
      canvas[i].chooseColor = false;
      background(canvasColor);
    }
  }
}

//clear the canvas by pressing 'c' on the keyboard
void keyPressed() {
  if (key == 'c') {
    background(canvasColor);
  }
}
