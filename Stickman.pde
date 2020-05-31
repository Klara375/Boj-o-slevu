class Stickman {
  int d = 30;                              //zavedení proměnné pro zobrazení hráče
  int x = width/2;                         //x-ová souřadnice hráče
  PImage HeadLImage;                       //zavedení obrázků
  PImage HeadRImage; 

  Stickman() {
    HeadLImage = loadImage("abeL.png");    //načtení obrázků
    HeadRImage = loadImage("abeR.png");
  }
  void run() {                             //funkce, která spustí hráče - spuštění tří funkcí najednou, aaby byl kód v hlavní části přehlednější
    display();
    key();
    border();
  }

  void display() {                          //zobrazení hráče
    //circle(x, height - 3.5*d, d+5);
    strokeWeight(2);
    line (x, height - 3*d + 2.5, x, height - d);
    line (x, height - 2*d, x + d, height - 3*d);
    line (x, height - 2*d, x - d, height - 3*d);
    line (x, height - d, x + 0.75*d, height);
    line (x, height - d, x - 0.75*d, height);
    strokeWeight(1);
  }

  void key() {                              //pohyb hráče + zobrazení obrázku hlavy do směru, kterým se pohybuje
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
    } else {
      imageMode(CENTER);
      HeadLImage.resize(0, 3*d);
      image(HeadLImage, x, height - 4.1*d);
    }
  }

  void border() {                            //nastavení hranice, aby hráč nemohl mimo okno
    if (x<25) x=25;
    if (x>width-25) x=width-25;
  }
}
