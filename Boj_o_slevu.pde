//BOJ O SLEVU
//Ledvinková Klára
//2020

int pocet = 10;
int cena;
PImage SlevaImage;
PImage EnemyLImage;
PImage EnemyRImage;
PImage ObchodImage;
PImage KasaImage;
PImage HeadLImage;
PImage HeadRImage;

Stickman player;
Enemy kosik;
Settings background;
Faller[] sleva = new Faller[pocet];
WinScrean konec;

void setup() {
  size(1280, 720);
  player = new Stickman();
  kosik = new Enemy();
  background = new Settings();
  for (int i = 0; i < pocet; i++) {
    sleva[i] = new Faller();
  }
  konec = new WinScrean();
  
  SlevaImage = loadImage("SLEVA.png");
  EnemyLImage = loadImage("EnemyL.png");
  EnemyRImage = loadImage("EnemyR.png");
  ObchodImage = loadImage("Kwik-E-Mart.png");
  KasaImage = loadImage("kasa.png");
  HeadLImage = loadImage("abeL.png");
  HeadRImage = loadImage("abeR.png");
}

void draw() {
  background(10, 170, 230);
  cena = 600;

  background.display();
  player.run();

  kosik.run();
  if (kosik.landed()) kosik.reset();

  for (int i = 0; i < pocet; i++) {
    sleva[i].run();
    if (sleva[i].landed()) {
      sleva[i].reset();
    }
    if (sleva[i].isCatched) cena -= 50;
  }
  background.bill();
  kosik.fail();
  if(cena < 150){
    for (int i = 0; i < pocet; i++) {
    konec.run(kosik, player);
    //sleva[i].display();
  }
  }
  
}


//void mouseReleased() {
   void keyReleased() {
     if (key == ' ') {
  for (int i = 0; i < pocet; i++) {
    sleva[i].reset();
  }
  kosik.reset();
  player.d = 30;
}
   }
