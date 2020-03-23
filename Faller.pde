class Faller{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  int d;
  boolean isCatched;

  Faller() {
    location = new PVector(random (20, width),random (0, 80));
    velocity = new PVector(0,5);
    
    topspeed = 5;
    d = 20;
    isCatched = false;
 }
 
  void update() {
    acceleration = new PVector(player.x - location.x,0);
    acceleration.normalize();
    acceleration.mult(0.02);
    velocity.sub(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    circle(location.x, location.y, d);
  }
  
  void fall(Stickman player){
   if(isCatched){ location.x = player.x + 1.5*d;
   location.y = height - 3*player.d;
   }
   location.add(velocity);
 }
 
  boolean landed(){
  if(location.y>height) return true;
  else return false;
 }
 
 void reset(){
   velocity = new PVector(0, 4);
   location.x = (int) random(20, width - 20);
   location.y = (int) random(0, 200);
   isCatched = false;
 }
 
   void catche(Stickman player){
   boolean isInside = (player.x - 20 < location.x && player.x + 20 > location.x );
   boolean isTouching = location.y > height - 3.5*player.d;
   
   if (isInside && isTouching) isCatched = true;
 }
}
