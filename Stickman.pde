class Stickman {
  int d = 30; 
  int x = width/2;

  void run() {
    display();
    move();
    border();
  }

  void display() {
    //circle(x, height - 3.5*d, d+5);

    line (x, height - 3*d + 2.5, x, height - d);
    line (x, height - 2*d, x + d, height - 3*d);
    line (x, height - 2*d, x - d, height - 3*d);
    line (x, height - d, x + 0.75*d, height);
    line (x, height - d, x - 0.75*d, height);
  }

  void move() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        x -= 7;
        imageMode(CENTER);
        HeadLImage.resize(0, 3*d);
        image(HeadLImage, x, height - 4.1*d);
      }
      if (keyCode == RIGHT) {
        x += 7;
        imageMode(CENTER);
        HeadRImage.resize(0, 3*d);
        image(HeadRImage, x, height - 4.1*d);
      }
    } else {
      imageMode(CENTER);
      HeadLImage.resize(0, 3*d);
      image(HeadLImage, x, height - 4.1*d);
    }
  }

  void border() {
    if (x<25) x=25;
    if (x>width-25) x=width-25;
  }
}
