class Faller{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PImage SlevaImage;
  float topspeed;
  int d;
  boolean isCatched;


  Faller() {
    location = new PVector(random (20, width),random (0, 80));
    velocity = new PVector(0,5);
    
    SlevaImage = loadImage("SLEVA.png");
    topspeed = 4;
    d = 50;
    isCatched = false;
 }
 
 void run(){
   display();
   update();
   fall(player);
   catche(player);
 }
 
  void display() {
    imageMode(CENTER);
    SlevaImage.resize(0,d);
    image(SlevaImage, location.x, location.y); 
    //circle(location.x, location.y, d);
  }
  
  void update() {
    acceleration = new PVector(player.x - location.x,0);
    acceleration.normalize();
    acceleration.mult(0.033);
    velocity.sub(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void fall(Stickman player){
   if(isCatched){ location.x = player.x + 2*player.d;
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
   location.y = (int) random(-50, 150);
   isCatched = false;
 }
 
   void catche(Stickman player){
   boolean isInside = (player.x - d < location.x && player.x + d > location.x );
   boolean isTouching = location.y > height - 5*player.d;
   
   if (isInside && isTouching) isCatched = true;
 }
}
