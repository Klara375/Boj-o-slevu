class WinScrean {
  int xSpeed = 4;
  int d = 100;
  PImage BigHeadRImage;
  PImage BigHeadLImage;
  PImage TaskaImage;

  WinScrean() {
    BigHeadRImage = loadImage("abeR.png");
    BigHeadLImage = loadImage("abeL.png");
    TaskaImage = loadImage("Nakup.png");
  }

  void run(Enemy kosik, Stickman player) {                      //obrazovka, která se zobrazí, když hráč vyhraje
    background(10, 170, 230);                                   //barva pozadí
    kosik.location.y = 0;                                       //nastavení y-ové souřadnice nepřítel, 
    textSize(25);
    text("WINNER!", width/2 - 50, 75);                          //a text
    fill(#004983);
    textSize(25);
    text("space - restart", 300, 50);
    text("m - menu", 820, 50);
    fill(255);
    imageMode(CENTER);
    TaskaImage.resize(0, 250);
    image(TaskaImage, player.x+0.95*d, height - 1.75*d);
    player.display();                                                //zobrazení hráče + zvětšení jeho velikosti
    player.d = 100;
    key();
    border();
    zuby.run();
  }

  void key() {                              //pohyb hráče + zobrazení obrázku hlavy
    if (keyCode == LEFT) {
      player.x -= xSpeed;
      imageMode(CENTER);
      BigHeadLImage.resize(0, 3*d);
      image(BigHeadLImage, player.x, height - 4.2*d);
    }
    if (keyCode == RIGHT) {
      player.x += xSpeed;
      BigHeadRImage.resize(0, 3*d);
      image(BigHeadRImage, player.x, height - 4.2*d);
    } else {
      BigHeadLImage.resize(0, 3*d);
      image(BigHeadLImage, player.x, height - 4.2*d);
    }
  }

  void border() {                            //nastavení hranice, aby hráč nemohl mimo okno
    if (player.x<d+20) player.x=d+20;
    if (player.x>width-d-20) player.x=width-d-20;
  }
}
