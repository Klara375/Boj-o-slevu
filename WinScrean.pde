class WinScrean{
  //PVector location;
  //PVector velocity;
  //PVector acceleration;
  //float topspeed;


//  WinScrean() {
//  }

 
 void run(Enemy kosik, Stickman player){
    background(100,100,255);
    kosik.location.y = 0;
    text("WINNER!",width/2 , 75);
    player.run();
    player.d = 100;
 }
 
}
