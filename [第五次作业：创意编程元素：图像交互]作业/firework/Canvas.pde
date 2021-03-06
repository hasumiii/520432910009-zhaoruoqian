class Canvas {
  float posX, posY;
  float canvasWidth, canvasHeight;
  color canvasColor;
  boolean chooseColor;

  Canvas(float x, float y, float w, float h, color c) {
    posX = x;
    posY = y;
    canvasWidth = w;
    canvasHeight = h;
    canvasColor = c;
  }

  void showCanvas() {
    if (hover()) {
      stroke(255);
      strokeWeight(2);
    } else {
      noStroke();
    }
    if (mousePressed && hover()) {
      chooseColor = true;
      fill(canvasColor);
      stroke(0, 0, 255);
    } else {
      fill(canvasColor);
    }
    rect(posX, posY, buttonWidth, buttonHeight);
  }

  boolean hover() {
    if (mouseX < posX + buttonWidth && mouseX > posX && mouseY < posY + buttonHeight && mouseY > posY) {
      return true;
    } else {
      return false;
    }
  }
}
