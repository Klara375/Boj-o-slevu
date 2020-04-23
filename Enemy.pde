class Enemy {
  PVector location;                  //zavedení vektorů
  PVector velocity;
  PVector acceleration;

  PImage EnemyLImage;                //zavedení obrázků
  PImage EnemyRImage;
  PImage MeggieImage;
  PImage KonecImage;
  int d;                             //zavedení proměnné pro velikost nepřítele
  float topspeed;                    //zavedení maximální rychlosti
  boolean failed;                    //zavedení proměnné, která určuje, jestli nepřítel srazil hráče nebo ne

  Enemy() {
    location = new PVector(0, 0);    //nastavení původní lokace nepřítele
    velocity = new PVector(0, 5);    //nastavení rychlosti
    //x = random(10, width);
    //y = random(-10, 100);
    EnemyLImage = loadImage("EnemyL.png");    //načtení obrázků
    EnemyRImage = loadImage("EnemyR.png");
    MeggieImage = loadImage("Meggie.png");
    KonecImage = loadImage("Fail.png");
    d = 85;
    topspeed = 4;
    failed = false;
  }
  void run() {              //zabalení tří funkcí do jedné funkce - pro zjednodušení kódu
    update(player);
    display(player);
    fall(player);
  }

  void update(Stickman player) {                              //pohyb
    acceleration = new PVector(player.x - location.x, 0);     //zrychlení směrem ke hráčovi
    acceleration.normalize();                                 //normalizace vektoru
    acceleration.mult(0.04);                                  //zmenšení zrychlení
    velocity.add(acceleration);                               //přidání zrychlení k rychlosti
    velocity.limit(topspeed);                                 //limitování maximální rychlosti
    location.add(velocity);                                   //přičtení rychlosti k lokaci
  }

  void display(Stickman player) {                             //zobrazení obrázku
    if (player.x - location.x<0) {                            //otočení obrázku směrem k hráči
      imageMode(CENTER);
      EnemyLImage.resize(0, d*3);
      image(EnemyLImage, location.x, location.y);
    } else {
      imageMode(CENTER);
      EnemyRImage.resize(0, d*3);
      image(EnemyRImage, location.x, location.y); 
      //fill(0);
      //circle(location.x, location.y, d);
      //fill(255);
    }
  }

  void fall(Stickman player) {
    if (failed) {                                  //když nepřítel narazí do hráče, zůstane na statických souřadnicích
      location.x = player.x;
      location.y = height - 3*player.d;
    } else location.add(velocity);                 //jinak se pohybuje - k souřadnicím se přičítá rychlost
  }

  boolean landed() {                               //určení, jestli se nachází pod oknem
    if (location.y > height+20) return true;
    else return false;
  }

  void reset() {                                   //resetování rychlosti a lokace
    velocity = new PVector(0, 4);
    location.x = (int) random(20, width - 20);
    location.y = (int) random(-50, 100);
    failed = false;
  }

  boolean hit(Stickman player) {                            //porovnání souřadnic nepřítele a hráče
    boolean isInside = (player.x - d < location.x && player.x + d > location.x );
    boolean isTouching = location.y + 0.5*d> height - 5*player.d;

    if (isInside && isTouching)return true;                 //když nepřítel narazí do hráče, hit = true
    else return false;
  }

  void fail() {
    if (kosik.hit(player)) {                      //když nepřítel narazí do hráče, spustí se "failScreen"
      background(0);                              //obsahuje spoustu textu a obrázky
      fill(255);
      textSize(50);
      text("            BUM!"+ " \n" +"            BÁC!" + " \n" + "Narazila do tebe Meggie!" + " \n" + "        KONEC HRY!" + " \n" + "      Zkus to znovu" + " \n" + "            :( :( :(", width/2-165, height/2-150);
      fill(#004983);
      textSize(25);
      text("space - restart", 500, height - 50);
      text("m - menu", 750, height - 50);
      kosik.failed = true;
      imageMode(CORNERS);
      image(MeggieImage, -55, 170);
      image(KonecImage, 835, 178);
      cena = 3000;
    }
  }
}
