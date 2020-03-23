class Enemy {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float d;
  float topspeed;
  boolean failed;

  Enemy() {
    location = new PVector(0,0);
    velocity = new PVector(0,5);
    //x = random(10, width);
    //y = random(-10, 100);
    d = 30;
    topspeed = 5;
    failed = false;
  }
  
   void update(Stickman player) {
    acceleration = new PVector(player.x - location.x,0);
    acceleration.normalize();
    acceleration.mult(0.04);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    circle(location.x, location.y, d);
  }
  
  void fall(Stickman player) {
    if(failed){location.x = player.x;
    location.y = height - 3*player.d;
    }
    else location.add(velocity);
  }

  boolean landed() {
    if (location.y > height) return true;
    else return false;
  }

  void reset() {
   velocity = new PVector(0, 4);
   location.x = (int) random(20, width - 20);
   location.y = (int) random(0, 100);
   failed = false;
  }

  boolean fail(Stickman player) {
    boolean isInside = (player.x - 20 < location.x && player.x + 20 > location.x );
    boolean isTouching = location.y > height - 3.5*player.d;

    if (isInside && isTouching)return true;
    else return false;
  }
}
