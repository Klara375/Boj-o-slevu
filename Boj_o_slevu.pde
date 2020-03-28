//BOJ O SLEVU
//Ledvinková Klára
//2020

int pocet = 10;
int cena;
PImage SlevaImage;
PImage EnemyLImage;
PImage EnemyRImage;

Stickman player;
Enemy kosik;
Faller[] sleva = new Faller[pocet];

void setup() {
  size(1280, 720);
  player = new Stickman();
  kosik = new Enemy();
  for (int i = 0; i < pocet; i++) {
    sleva[i] = new Faller();
  }
  SlevaImage = loadImage("SLEVA.png");
  EnemyLImage = loadImage("EnemyL.png");
  EnemyRImage = loadImage("EnemyR.png");
}

void draw() {
  background(240);
  cena = 3000;
  if (kosik.fail(player)) {
    background(0);
    fill(255);
    textSize(50);
    text("Narazil do tebe nepřítel! KONEC HRY Zkus to znovu", 15, height/2);
    kosik.failed = true;
  }
  player.display();
  player.move();
  player.border();

  kosik.display(player);
  kosik.fall(player);
  kosik.update(player);
  if (kosik.landed()) kosik.reset();


  for (int i = 0; i<pocet; i++) {
    sleva[i].fall(player);
    sleva[i].update();
    if (sleva[i].landed()) {
      sleva[i].reset();
    }
    sleva[i].catche(player);
    sleva[i].display();
    if(sleva[i].isCatched) cena-=100;
  }
  fill(50);
  text(cena, 15, height/2);

  //rect (20,20,300,300);
}


void mouseReleased() {
  for (int i = 0; i < pocet; i++) {
    sleva[i].reset();
  }
  kosik.reset();
}
