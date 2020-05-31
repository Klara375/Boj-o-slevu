//BOJ O SLEVU
//Ledvinková Klára
//2020

int pocet = 10;      //zavedení počtu slev
int cena;            //zavedení proměnné, která znázorňuje cenu nákupu


Stickman player;    //zavedení class
Enemy kosik;
Settings background;
Faller[] sleva = new Faller[pocet];
WinScrean konec;
Zuby zuby;

void setup() {
  size(1280, 720);
  player = new Stickman();
  kosik = new Enemy();
  background = new Settings();
  for (int i = 0; i < pocet; i++) {
    sleva[i] = new Faller();
  }
  konec = new WinScrean();
  zuby = new Zuby();
}

void draw() {
  background(10, 170, 230);                     //barva pozadí
  cena = 600;                                   //nastavení počáteční ceny

  if (background.uvod) {                        //když úvod = true, zobrazí se menu
    background.menu();
  } else {                                      //jinak se spustí hra + hráč, nepřítel a sleva
    background.display();
    player.run();
    kosik.run();
    for (int i = 0; i < pocet; i++) {
      sleva[i].run();
    }


    if (kosik.landed()) kosik.reset();                  //resetování košíku nebo slevy, když opustí okno
    for (int i = 0; i < pocet; i++) {
      if (sleva[i].landed()) {
        sleva[i].reset();
      }
      if (sleva[i].isCatched) cena -= 50;               //za chycenou slevu se od ceny odečte 50
    }
    background.bill();                                  //vykreslení ceny na kase
    kosik.fail();                                       //kolize s nepřítelem
    if (cena < 150) {                                   //když je cena menší než 150 konec -> výhra
      for (int i = 0; i < pocet; i++) {
        konec.run(kosik, player);
      }
    }
  }
}

void keyReleased() {
  if (key == ' ') {                                      //při stisknutí mezerníku -> reset
    for (int i = 0; i < pocet; i++) {
      sleva[i].reset();
    }
    kosik.reset();
    player.d = 30;
  }
  if (key == 's') {                                      //při stisknutí s, uvod = false -> skrytí úvodního menu
    background.uvod = false;
  }
  if (key == 'm') {                                      //při stisknutí m, uvod = true -> menu se zobrazí
    background.uvod = true;
  }
}
