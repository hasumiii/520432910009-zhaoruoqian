int num = 30;
Ripple[] ripples = new Ripple[num];

void setup() {
  size(1500, 1500);
  frameRate(12);
  //initiate
  for (int i = 0; i < num; i ++)
  {
    ripples[i] = new Ripple (random(width), random(height), i*5, i*5, random(0, TWO_PI), random(0, TWO_PI));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < num; i ++)
  {
    ripples[i].update();
    ripples[i].display();
  }
}

class Ripple
{
  float x, y, rx, ry, st, fi;
  Ripple (float x, float y, float rx, float ry, float st, float fi)
  {
    this.x = x;
    this.y = y;
    this.rx = rx;
    this.ry = ry;
    this.st = st;
    this.fi = fi;
  }
  void update()
  {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  void display()
  {
    //Colors change as coordinates change.
    float r = x/4;
    float g = y/6;
    float b = (x + y)/7;
    for (int j = 0; j < 100; j +=2)
    {
      stroke(r, g, b);
      strokeWeight(3);
      noFill();
      arc(x, y, j*5, j*5, random(0, TWO_PI), random(0, TWO_PI));
      //gradient color
      r += 2.5;
      g += 2.5;
      b += 2.5;
    }
  }
}
