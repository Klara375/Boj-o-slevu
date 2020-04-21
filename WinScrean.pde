class WinScrean{
  
 void run(Enemy kosik, Stickman player){
    background(10, 170, 230);
    kosik.location.y = 0;
    textSize(25);
    text("WINNER!",width/2 , 75);
    player.run();
    player.d = 100;
 }
 
}
