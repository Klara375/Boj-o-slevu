class Faller {
  PVector location;                        //zavedení vektorů
  PVector velocity;
  PVector acceleration;

  PImage SlevaImage;                       //zavedení obrázku
  float topspeed;                          //zavedení maximální rychlosti
  int d;                                   //zavedení proměnné pro velikost slevy
  boolean isCatched;                       //zavedení proměnné, která určuje, jestli hráče slevu chytil nebo ne


  Faller() {
    location = new PVector(random (20, width), random (0, 80));       //nastavení původní lokace slevy
    velocity = new PVector(0, 5);                                     //nastavení rychlosti

    SlevaImage = loadImage("SLEVA.png");                              //načtení obrázku
    topspeed = 4;
    d = 50;
    isCatched = false;
  }

  void run() {                                                        //zabalení funkcí do jedné funkce - čistě jen pro zjednodušení kódu
    display();
    update();
    fall(player);
    catche(player);
  }

  void display() {                                                  //zobrazení obrázku
    imageMode(CENTER);
    SlevaImage.resize(0, d);
    image(SlevaImage, location.x, location.y); 
    //circle(location.x, location.y, d);
  }

  void update() {                                                    //pohyb
    acceleration = new PVector(player.x - location.x, 0);            //zrychlení směrem od hráče
    acceleration.normalize();                                        //normalizace vektoru
    acceleration.mult(0.033);                                        //zmenšení zrychlení
    velocity.sub(acceleration);                                      //přidání zrychlení k rychlosti
    velocity.limit(topspeed);                                        //limitování maximální rychlosti
    location.add(velocity);                                          //přičtení rychlosti k lokaci
  }

  void fall(Stickman player) {                      
    if (isCatched) {                                                 //když hráč chytí slevu, zůstane na statických souřadnicích
      location.x = player.x + 2*player.d;
      location.y = height - 3*player.d;
    }
    location.add(velocity);                                          //jinak se pohybuje - k souřadnicím se přičítá rychlost
  }

  boolean landed() {                                                 //určení, jestli se nachází pod oknem
    if (location.y>height) return true;
    else return false;
  }

  void reset() {                                                     //resetování rychlosti a lokace
    velocity = new PVector(0, 4);
    location.x = (int) random(20, width - 20);
    location.y = (int) random(-50, 150);
    isCatched = false;
  }

  void catche(Stickman player) {                                      //porovnání souřadnic slevy a hráče
    boolean isInside = (player.x - d < location.x && player.x + d > location.x );
    boolean isTouching = location.y > height - 5*player.d;

    if (isInside && isTouching) isCatched = true;                     //když hráč chytí lsevu, isCatched = true
  }
}
