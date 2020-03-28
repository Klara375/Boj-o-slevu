class Enemy {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  int d;
  float topspeed;
  boolean failed;

  Enemy() {
    location = new PVector(0,0);
    velocity = new PVector(0,5);
    //x = random(10, width);
    //y = random(-10, 100);
    d = 85;
    topspeed = 4;
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

  void display(Stickman player) {
    if(player.x - location.x<0){
    imageMode(CENTER);
    EnemyLImage.resize(0,d);
    image(EnemyLImage, location.x, location.y); 
    }else{
    imageMode(CENTER);
    EnemyRImage.resize(0,d);
    image(EnemyRImage, location.x, location.y); 
    //fill(0);
    //circle(location.x, location.y, d);
    //fill(255);
    }
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
    boolean isInside = (player.x - d < location.x && player.x + d > location.x );
    boolean isTouching = location.y > height - 3.5*player.d;

    if (isInside && isTouching)return true;
    else return false;
  }
}
