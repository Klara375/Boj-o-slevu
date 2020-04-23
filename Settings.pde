class Settings {
  PImage ObchodImage;                        //zavedení obrázků
  PImage KasaImage;
  boolean uvod;

  Settings() {
    ObchodImage = loadImage("Kwik-E-Mart.png");            //načtení obrázků
    KasaImage = loadImage("kasa.png");
    uvod = true;
  }

  void menu() {
    background(10, 170, 230);                              //Úvodní pozadí a text
    textSize(100);
    text("Boj o slevu", 360, 135);
    textSize(25);
    fill(#004983);
    text("Pravidla", 560, 50);
    textSize(28);
    text("Abe Simpson si potřebuje nakoupit."+ " \n" +"Nemá však dost peněz, a tak se musí spolehnout na slevy."+ " \n" +"Není ale sám, kdo loví slevy v Kwik E Martu, proto si musí dát pozor na ostatní zákazníky.", 25, 200);
    textSize(33);
    text("Sesbírej potřebné slevy, vyhni se nepřeátelům a pomoz Abovi splatit nákup!", 25, 350);
    textSize(28);
    fill(#1813AF);
    text("Ovládání", 560, 415);
    line(350, 422, 950, 422);
    text("←                         pohyb vlevo", 400, 460);
    text("→                         pohyb vpravo", 400, 496);
    text("↓                          zastavení pohybu", 400, 526);
    text("space                   restart hry  ", 400, 556);
    text("m                         pauza - zobrazí menu", 400, 586);
    text("s                          start - skryje menu", 400, 616);
    fill(255);
  }


  void display() {                                                    //zobrazení obrázků ve hře
    imageMode(CENTER);
    KasaImage.resize(0, 200);
    image(KasaImage, width-125, 120); 

    imageMode(CORNER);
    ObchodImage.resize(0, 720);
    image(ObchodImage, 0, 0);

    textSize(100);                                                    //informativní texty ve hře
    text("Boj o slevu", 360, 135 );
    textSize(25);
    fill(#004983);
    text("space - restart", 300, 50);
    text("m - menu", 820, 50);
  }

  void bill() {                                                       //častka na kase
    fill(255);
    textSize(20);
    text("$" + cena, 1145, 50);
    fill(255);
  }
}
