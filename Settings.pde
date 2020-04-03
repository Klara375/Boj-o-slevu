class Settings {

  void display() {
    imageMode(CENTER);
    KasaImage.resize(0, 200);
    image(KasaImage, width-125, 120); 

    imageMode(CORNER);
    ObchodImage.resize(0, 720);
    image(ObchodImage, 0, 0);

    textSize(100);
    text("Boj o slevu", 50, 135 );
    //textSize(25);
    //text("Pravidla", 800, 50);
    //text("Abe Simpson si potřebuje nakoupit. Nemá ale dost peněz, a tak se musí spolehnout na slevy. Není ale sám, kdo loví slevy v " )
  }

  void bill() {
    fill(255);
    textSize(20);
    text("$" + cena, 1145, 50);
    fill(255);
  }
}
