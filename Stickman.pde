class Stickman {
  // průměr kruhu, pozice hráče
  float d; 
  float x = width/2;


  void display() {
    d = 32;

    circle(x, height - 3.5*d, d+5);
    line (x, height - 3*d + 2.5, x, height - d);
    line (x, height - 2*d, x + d, height - 3*d);
    line (x, height - 2*d, x - d, height - 3*d);
    line (x, height - d, x + 20, height);
    line (x, height - d, x - 20, height);
  }

  void move() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        x -= 7;
      }
      if (keyCode == RIGHT) {
        x += 7;
      }
    }
  }
  
  void border(){
   if (x<25) x=25;
   if(x>width-25) x=width-25;
  }
}
