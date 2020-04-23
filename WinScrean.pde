class WinScrean {

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
    player.run();                                                //zobrazení hráče + zvětšení jeho velikosti
    player.d = 100;
  }
}
