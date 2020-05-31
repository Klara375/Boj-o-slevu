class Zuby {
  PImage zubyImage;
  float x = width/2;
  float y = 50;
  float xSpeed = 1;
  float ySpeed = 1;
  int d = 150;

  Zuby() {
    zubyImage = loadImage ("Zuby.png");
  }

  void run() {
    move();
    display();
    border();
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
  }
  void display() {
    imageMode(CENTER);
    zubyImage.resize(0, d);
    image(zubyImage, x, y);
  }

  void border() {
    if (x > width || x < 0) {
      xSpeed = xSpeed *-1;
    }
    if (y > height || y < 0) {
      ySpeed = ySpeed *-1;
    }
  }
}
